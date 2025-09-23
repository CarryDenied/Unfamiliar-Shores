using System.Collections.Generic;
using System.Linq;
using ACE.Common;
using ACE.Entity;
using ACE.Entity.Enum;
using ACE.Entity.Enum.Properties;
using ACE.Server.Entity;
using ACE.Server.Entity.Actions;
using ACE.Server.Factories;
using ACE.Server.Managers;
using ACE.Server.Network.GameMessages.Messages;

namespace ACE.Server.WorldObjects
{
    partial class Creature
    {
        // Elite system constants
        private const float ELITE_RESISTANCE_MIN = 0.00f;
        private const float ELITE_RESISTANCE_MAX = 0.60f;
        private const float ELITE_RESISTANCE_WEAKNESS_THRESHOLD = 0.25f;
        private const float ELITE_RESISTANCE_MIN_FLOOR = 0.01f;
        
        private const int ELITE_STAT_BONUS_HIGH_MIN = 70;
        private const int ELITE_STAT_BONUS_HIGH_MAX = 200;
        private const int ELITE_STAT_BONUS_LOW_MIN = 25;
        private const int ELITE_STAT_BONUS_LOW_MAX = 75;
        
        private const float ELITE_ARMOR_BONUS = 1.5f;
        private const int ELITE_HEALTH_RATE_MAGIC_IMMUNE = 50;
        private const int ELITE_HEALTH_RATE_NORMAL = 100;
        private const int ELITE_MANA_RATE = 1000;
        private const int ELITE_STAMINA_RATE = 1000;
        
        // XP rewards - much more reasonable than original 100k-2M
        private const long ELITE_XP_HIGH_LEVEL = 15000; // Was 2000000
        private const long ELITE_XP_LOW_LEVEL = 8000;   // Was 100000
        
        // HP multipliers - increased from original for better balance
        private const uint ELITE_HP_MULTIPLIER_HIGH = 20;      // Was 17
        private const uint ELITE_HP_MULTIPLIER_LOW = 15;       // Was 12
        private const uint ELITE_HP_MULTIPLIER_BEEFY_HIGH = 35; // Was 30
        private const uint ELITE_HP_MULTIPLIER_BEEFY_LOW = 10;  // Was 7
        private const uint ELITE_HP_MULTIPLIER_BEEFY_THRESHOLD = 100000;

        /// <summary>
        /// Called every ~5 seconds for Creatures
        /// </summary>
        public override void Heartbeat(double currentUnixTime)
        {
            var expireItems = new List<WorldObject>();

            // Process equipped object enchantments and lifespans
            foreach (var wo in EquippedObjects.Values.Where(i => i.EnchantmentManager.HasEnchantments || i.Lifespan.HasValue))
            {
                wo.EnchantmentManager.HeartBeat(CachedHeartbeatInterval);
                if (wo.IsLifespanSpent)
                    expireItems.Add(wo);
            }

            VitalHeartBeat();
            EmoteManager.HeartBeat();
            DamageHistory.TryPrune();

            // Update attack rate tracking
            if (numRecentAttacksReceived > 0)
            {
                attacksReceivedPerSecond = numRecentAttacksReceived / (float)CachedHeartbeatInterval;
                numRecentAttacksReceived = 0;
            }
            else if (attacksReceivedPerSecond > 0.0f)
                attacksReceivedPerSecond = 0.0f;

            // Clean up expired items
            foreach (var expireItem in expireItems)
            {
                expireItem.DeleteObject(this);
                if (this is Player player)
                    player.Session.Network.EnqueueSend(new GameMessageSystemChat($"Its lifespan finished, your {expireItem.Name} crumbles to dust.", ChatMessageType.Broadcast));
            }

            // === ELITE SYSTEM PROCESSING ===
            ProcessEliteDungeonManagement();
            ProcessWardedImmunities();
            ProcessEliteCombatMods();
            ProcessMirrorMobCleanup();
            ProcessEliteGeneration();

            base.Heartbeat(currentUnixTime);
        }

        #region Elite Dungeon Management
        
        private void ProcessEliteDungeonManagement()
        {
            // Update elite dungeon idle timer if mob is awake
            if (IsAwake && IsElite && Location.Indoors)
            {
                SetProperty(PropertyFloat.EliteDungeonIdleTime, Time.GetFutureUnixTime(3600));
            }

            // Return displaced elites to home position
            if (!IsAwake && Location != Home && IsElite && Location.Indoors)
            {
                MoveToHome();
            }

            // Remove elites that have been idle too long in dungeons
            if (!IsAwake && IsElite && Location.Indoors)
            {
                if (Time.GetUnixTime() > EliteDungeonIdleTime)
                {
                    EnqueueBroadcast(new GameMessageSystemChat($"[ELITE] {Name} has left dereth forever.", ChatMessageType.System), LocalBroadcastRangeSq, ChatMessageType.System);
                    DeathTreasureType = null;
                    Smite(this, true);
                    DeleteObject();
                }
            }
        }

        #endregion

        #region Warded Immunity System

        private void ProcessWardedImmunities()
        {
            if (!Warded || !PlayersInRange(96) || !IsAwake) return;

            var rng1 = ThreadSafeRandom.Next(1, 3);
            var rng2 = ThreadSafeRandom.Next(1, 2);

            // Initialize immunity if none are set
            if (!ToggleMis && !TogglePhys && !ToggleSpell)
            {
                SetRandomImmunity(rng1);
                return;
            }

            // 50% chance to switch immunity every 5 seconds
            var togglerng = ThreadSafeRandom.Next(1, 100);
            SetProperty(PropertyBool.ToggleRNG, togglerng >= 50);

            if (!ToggleRNG) return;

            // Switch immunities
            if (ToggleMis)
                SwitchFromMissile(rng2);
            else if (TogglePhys)
                SwitchFromMelee(rng2);
            else if (ToggleSpell)
                SwitchFromMagic(rng2);
        }

        private void SetRandomImmunity(int rng)
        {
            var immunityMessage = "";
            switch (rng)
            {
                case 1:
                    SetProperty(PropertyBool.TogglePhys, true);
                    immunityMessage = "Melee Attacks";
                    break;
                case 2:
                    SetProperty(PropertyBool.ToggleMis, true);
                    immunityMessage = "Missile Attacks";
                    break;
                case 3:
                    SetProperty(PropertyBool.ToggleSpell, true);
                    immunityMessage = "Magic Projectiles";
                    break;
            }
            
            if (!string.IsNullOrEmpty(immunityMessage))
            {
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to {immunityMessage}", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
        }

        private void SwitchFromMissile(int rng)
        {
            SetProperty(PropertyBool.ToggleMis, false);
            if (rng == 1)
            {
                SetProperty(PropertyBool.TogglePhys, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Melee Attacks", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
            else
            {
                SetProperty(PropertyBool.ToggleSpell, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Magic Projectiles", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
        }

        private void SwitchFromMelee(int rng)
        {
            SetProperty(PropertyBool.TogglePhys, false);
            if (rng == 1)
            {
                SetProperty(PropertyBool.ToggleMis, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Missile Attacks", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
            else
            {
                SetProperty(PropertyBool.ToggleSpell, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Magic Projectiles", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
        }

        private void SwitchFromMagic(int rng)
        {
            SetProperty(PropertyBool.ToggleSpell, false);
            if (rng == 1)
            {
                SetProperty(PropertyBool.ToggleMis, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Missile Attacks", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
            else
            {
                SetProperty(PropertyBool.TogglePhys, true);
                EnqueueBroadcast(new GameMessageSystemChat($"{Name} Switched its Immunity to Melee Attacks", ChatMessageType.System), LocalBroadcastRange, ChatMessageType.System);
            }
        }

        #endregion

        #region Elite Combat Mods

        private void ProcessEliteCombatMods()
        {
            var attackTarget = AttackTarget as Player;
            if (!PlayersInRange(96) || !IsElite || attackTarget == null || !IsAwake) return;

            if (DiscoMod) ProcessDiscoMod(attackTarget);
            if (MeteorMod) ProcessMeteorMod(attackTarget);
            if (NovaMod) ProcessNovaMod(attackTarget);
            if (MirrorMod) ProcessMirrorMod(attackTarget);
            if (SupportMod) ProcessSupportMod(attackTarget);
            if (TeleMod) ProcessTeleMod(attackTarget);
        }

        private void ProcessDiscoMod(Player target)
        {
            var procChance = ThreadSafeRandom.Next(1, 10);
            if (procChance > 7) return; // 70% chance

            var elementRoll = ThreadSafeRandom.Next(1, 6); // Roll for element type
SpellId spellId;

if (Level > 99)
{
    spellId = elementRoll switch
    {
        1 => SpellId.AcidArc5,
        2 => SpellId.FlameArc5,
        3 => SpellId.FrostArc5,
        4 => SpellId.LightningArc5,
        5 => SpellId.ForceArc5,
        _ => SpellId.AcidArc5 // fallback
    };
}
else
{
    spellId = elementRoll switch
    {
        1 => SpellId.AcidArc2,
        2 => SpellId.FlameArc2,
        3 => SpellId.FrostArc2,
        4 => SpellId.LightningArc2,
        5 => SpellId.ForceArc2,
        _ => SpellId.AcidArc2 // fallback
    };
}

var spell = new Server.Entity.Spell(spellId);

            var actionChain = new ActionChain();
            actionChain.AddDelaySeconds(2.5f);
            actionChain.AddAction(this, () => {
                if (spell != null && spell.NumProjectiles > 0)
                    CreateSpellProjectiles(spell, target, this);
            });
            actionChain.AddDelaySeconds(2.5f);
            actionChain.AddAction(this, () => {
                if (spell != null && spell.NumProjectiles > 0)
                    CreateSpellProjectiles(spell, target, this);
            });
            actionChain.EnqueueChain();
        }

        private void ProcessMeteorMod(Player target)
        {
            var procChance = ThreadSafeRandom.Next(1, 10);
            if (procChance > 5) return; // 50% chance

            var spellRoll = ThreadSafeRandom.Next(1, 5);
            var spellId = spellRoll switch
            {
                1 => SpellId.FrostStrike,
                2 => SpellId.FlameStrike,
                3 => SpellId.LightningStrike,
                4 => SpellId.BladeStrike,
                _ => SpellId.ForceStrike
            };

            var spell = new Server.Entity.Spell(spellId);
            if (spell != null && spell.NumProjectiles > 0)
                CreateSpellProjectiles(spell, target, this);
        }

        private void ProcessNovaMod(Player target)
        {
            var procChance = ThreadSafeRandom.Next(1, 10);
            if (procChance > 5) return; // 50% chance

            var spellRoll = ThreadSafeRandom.Next(1, 8);
            var spellId = spellRoll switch
            {
                1 => SpellId.StasisField,
                2 => SpellId.AcidRing,
                3 => SpellId.StaminaBolt7,
                4 => SpellId.FrostRing,
                5 => SpellId.FlameRing,
                6 => SpellId.ForceRing,
                7 => SpellId.BladeRing,
                _ => SpellId.ShockwaveRing
            };

            var spell = new Server.Entity.Spell(spellId);
            if (spell != null && spell.NumProjectiles > 0)
                CreateSpellProjectiles(spell, target, this);
        }

        private void ProcessSupportMod(Player target)
        {
            var procChance = ThreadSafeRandom.Next(1, 10);
            if (procChance > 5) return; // 50% chance

            var spellRoll = ThreadSafeRandom.Next(1, 17);
            var isHighLevel = Level > 99;
            
            ProcessSupportSpell(spellRoll, isHighLevel);
        }

        private void ProcessSupportSpell(int roll, bool isHighLevel)
        {
            if (isHighLevel)
            {
                if (roll == 1)
                    CastSpell(new Server.Entity.Spell(SpellId.VulnerabilityOther5));
                else if (roll == 2)
                    CastSpell(new Server.Entity.Spell(SpellId.LightningVulnerabilityOther5));
                else if (roll == 3)
                    CastSpell(new Server.Entity.Spell(SpellId.ColdVulnerabilityOther5));
                else if (roll == 4)
                    CastSpell(new Server.Entity.Spell(SpellId.FireVulnerabilityOther5));
                else if (roll == 5)
                    CastSpell(new Server.Entity.Spell(SpellId.AcidVulnerabilityOther5));
                else if (roll == 6)
                    CastSpell(new Server.Entity.Spell(SpellId.PiercingVulnerabilityOther5));
                else if (roll == 7)
                    CastSpell(new Server.Entity.Spell(SpellId.BludgeonVulnerabilityOther5));
                else if (roll == 8)
                    CastSpell(new Server.Entity.Spell(SpellId.BladeVulnerabilityOther5));
                else if (roll == 9)
                    CastSpell(new Server.Entity.Spell(SpellId.ImperilOther5));
                else if (roll == 10)
                    CastSpell(new Server.Entity.Spell(SpellId.MagicYieldOther5));
                else if (roll == 11)
                    CastSpell(new Server.Entity.Spell(SpellId.SlownessOther5));
                else if (roll == 12)
                    CastSpell(new Server.Entity.Spell(SpellId.WeaknessOther5));
                else if (roll == 13)
                    CastSpell(new Server.Entity.Spell(SpellId.FrailtyOther5));
                else if (roll == 14)
                    CastSpell(new Server.Entity.Spell(SpellId.ClumsinessOther5));
                else if (roll == 15)
                    CastSpell(new Server.Entity.Spell(SpellId.FesterOther5));
                else if (roll == 16)
                    CastSpell(new Server.Entity.Spell(SpellId.LifeMagicIneptitudeOther5));
                else if (roll == 17)
                    CastSpell(new Server.Entity.Spell(SpellId.CreatureEnchantmentIneptitudeOther5));
            }
            else
            {
                if (roll == 1)
                    CastSpell(new Server.Entity.Spell(SpellId.VulnerabilityOther2));
                else if (roll == 2)
                    CastSpell(new Server.Entity.Spell(SpellId.LightningVulnerabilityOther2));
                else if (roll == 3)
                    CastSpell(new Server.Entity.Spell(SpellId.ColdVulnerabilityOther2));
                else if (roll == 4)
                    CastSpell(new Server.Entity.Spell(SpellId.FireVulnerabilityOther2));
                else if (roll == 5)
                    CastSpell(new Server.Entity.Spell(SpellId.AcidVulnerabilityOther2));
                else if (roll == 6)
                    CastSpell(new Server.Entity.Spell(SpellId.PiercingVulnerabilityOther2));
                else if (roll == 7)
                    CastSpell(new Server.Entity.Spell(SpellId.BludgeonVulnerabilityOther2));
                else if (roll == 8)
                    CastSpell(new Server.Entity.Spell(SpellId.BladeVulnerabilityOther2));
                else if (roll == 9)
                    CastSpell(new Server.Entity.Spell(SpellId.ImperilOther2));
                else if (roll == 10)
                    CastSpell(new Server.Entity.Spell(SpellId.MagicYieldOther2));
                else if (roll == 11)
                    CastSpell(new Server.Entity.Spell(SpellId.SlownessOther2));
                else if (roll == 12)
                    CastSpell(new Server.Entity.Spell(SpellId.WeaknessOther2));
                else if (roll == 13)
                    CastSpell(new Server.Entity.Spell(SpellId.FrailtyOther2));
                else if (roll == 14)
                    CastSpell(new Server.Entity.Spell(SpellId.ClumsinessOther2));
                else if (roll == 15)
                    CastSpell(new Server.Entity.Spell(SpellId.FesterOther2));
                else if (roll == 16)
                    CastSpell(new Server.Entity.Spell(SpellId.LifeMagicIneptitudeOther2));
                else if (roll == 17)
                    CastSpell(new Server.Entity.Spell(SpellId.CreatureEnchantmentIneptitudeOther2));
            }
        }

        private void ProcessMirrorMod(Player target)
        {
            var procChance = ThreadSafeRandom.Next(1, 10);
            if (procChance > 5) return; // 50% chance

            var clone = CreateMirrorClone();
            if (clone != null)
            {
                clone.EnterWorld();
                MirrorMobCount += 1;
            }
        }

        private Creature CreateMirrorClone()
        {
            var clone = WorldObjectFactory.CreateNewWorldObject(WeenieClassId) as Creature;
            if (clone == null) return null;

            // Basic setup
            clone.Location = new Position(Location);
            clone.Name = Name;
            clone.SetProperty(PropertyBool.IsElite, true);
            clone.SetProperty(PropertyBool.MirrorMob, true);
            clone.SetProperty(PropertyBool.EliteTrigger, false);

            // Random chance for support abilities
            if (ThreadSafeRandom.Next(1, 10) <= 2)
            {
                clone.SetProperty(PropertyBool.SupportMod, true);
                var lifeMagic = clone.GetCreatureSkill(Skill.LifeMagic);
                lifeMagic.InitLevel += (uint)(lifeMagic.InitLevel > 100 && lifeMagic.InitLevel < 200 ? 30 : 50);
            }

            // Set duration and properties
            clone.SetProperty(PropertyFloat.MirrorCreationTime, Time.GetFutureUnixTime(6));
            clone.Health.StartingValue = 100u;
            
            // Copy stats but keep them current
            CopyStatsToClone(clone);
            
            // Set poor resistances
            SetCloneResistances(clone);

            // Configure behavior
            clone.ObjScale = ObjScale;
            clone.DeathTreasureType = null;
            clone.IgnoreCollisions = true;
            clone.Tolerance = Tolerance.None;

            return clone;
        }

        private void CopyStatsToClone(Creature clone)
        {
            clone.Strength.StartingValue = Strength.StartingValue;
            clone.Endurance.StartingValue = Endurance.StartingValue;
            clone.Coordination.StartingValue = Coordination.StartingValue;
            clone.Quickness.StartingValue = Quickness.StartingValue;
            clone.Focus.StartingValue = Focus.StartingValue;
            clone.Self.StartingValue = Self.StartingValue;
            
            clone.Health.StartingValue = clone.Health.MaxValue;
            clone.Stamina.StartingValue = clone.Stamina.MaxValue;
            clone.Mana.StartingValue = clone.Mana.MaxValue;
        }

        private void SetCloneResistances(Creature clone)
        {
            clone.ResistAcid = 2.5;
            clone.ResistFire = 2.5;
            clone.ResistCold = 2.5;
            clone.ResistElectric = 2.5;
            clone.ResistPierce = 2.5;
            clone.ResistBludgeon = 2.5;
            clone.ResistSlash = 2.5;
            clone.ResistNether = 2.5;
        }

        private void ProcessTeleMod(Player target)
        {
            var telePosition = new Position(target.Location);
            SetPosition(PositionType.Location, telePosition);
        }

        #endregion

        #region Mirror Mob Cleanup

        private void ProcessMirrorMobCleanup()
        {
            if (!MirrorMob || !IsElite) return;

            var expirationTime = GetProperty(PropertyFloat.MirrorCreationTime);
            if (expirationTime != null && Time.GetUnixTime() >= expirationTime)
            {
                DeleteObject(this);
            }
        }

        #endregion

        #region Elite Generation System

        private void ProcessEliteGeneration()
        {
            // Check if this creature is eligible for elite conversion
            if (!ShouldTriggerEliteGeneration()) return;

            // Roll for elite conversion
            if (!RollForEliteConversion()) 
            {
                SetProperty(PropertyBool.IsElite, false);
                SetProperty(PropertyBool.EliteTrigger, false);
                return;
            }

            // Convert to elite
            ConvertToElite();
        }

        private bool ShouldTriggerEliteGeneration()
        {
            return EliteTrigger && 
                   Attackable && 
                   PlayerKillerStatus != PlayerKillerStatus.RubberGlue;
        }

        private bool RollForEliteConversion()
        {
            var spawnRate = PropertyManager.GetDouble("elite_mob_spawn_rate").Item;
            return !Location.Indoors && ThreadSafeRandom.Next(0.0000f, 1.0000f) <= spawnRate;
        }

        private void ConvertToElite()
        {
            if (!IsValidEliteCandidate()) return;

            SetProperty(PropertyBool.IsElite, true);
            
            // Store original values
            var originalName = GetProperty(PropertyString.Name);
            
            // Apply elite modifications
            RandomizeResistances();
            BoostArmorValues();
            ConfigureVitalRates();
            RandomizeStats();
            
            var modInfo = RollAndAssignMods();
            AssignExperienceAndHealth(modInfo.ModCount);
            GenerateEliteName(originalName, modInfo.ModCount);
            
            FinalizeEliteConversion();
        }

        private bool IsValidEliteCandidate()
        {
            // Exclude specific creature types from becoming elite
            var excludedWeenieIds = new uint[] { 151001, 251011, 251010, 261010 };
            return !excludedWeenieIds.Contains(WeenieClassId);
        }

        private void RandomizeResistances()
        {
            // Reset all resistances to 0 first
            ResistAcid = ResistFire = ResistCold = ResistElectric = 0;
            ResistPierce = ResistBludgeon = ResistSlash = ResistNether = 0;

            // Apply random resistances
            ResistAcid += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistFire += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistCold += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistElectric += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistPierce += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistBludgeon += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistSlash += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);
            ResistNether += ThreadSafeRandom.Next(ELITE_RESISTANCE_MIN, ELITE_RESISTANCE_MAX);

            // Ensure at least one weakness exists
            EnsureMinimumWeakness();
            
            // Enforce minimum resistance floor
            EnforceResistanceFloor();
        }

        private void EnsureMinimumWeakness()
        {
            var weaknessCount = CountWeaknesses();
            if (weaknessCount < 1)
            {
                var weaknessType = ThreadSafeRandom.Next(1, 8);
                switch (weaknessType)
                {
                    case 1: ResistAcid = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 2: ResistFire = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 3: ResistCold = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 4: ResistElectric = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 5: ResistPierce = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 6: ResistSlash = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 7: ResistBludgeon = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                    case 8: ResistNether = ELITE_RESISTANCE_WEAKNESS_THRESHOLD; break;
                }
            }
        }

        private int CountWeaknesses()
        {
            int count = 0;
            if (ResistAcid <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistFire <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistCold <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistElectric <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistPierce <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistBludgeon <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistSlash <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            if (ResistNether <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) count++;
            return count;
        }

        private void EnforceResistanceFloor()
        {
            if (ResistAcid < ELITE_RESISTANCE_MIN_FLOOR) ResistAcid = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistFire < ELITE_RESISTANCE_MIN_FLOOR) ResistFire = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistCold < ELITE_RESISTANCE_MIN_FLOOR) ResistCold = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistElectric < ELITE_RESISTANCE_MIN_FLOOR) ResistElectric = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistPierce < ELITE_RESISTANCE_MIN_FLOOR) ResistPierce = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistBludgeon < ELITE_RESISTANCE_MIN_FLOOR) ResistBludgeon = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistSlash < ELITE_RESISTANCE_MIN_FLOOR) ResistSlash = ELITE_RESISTANCE_MIN_FLOOR;
            if (ResistNether < ELITE_RESISTANCE_MIN_FLOOR) ResistNether = ELITE_RESISTANCE_MIN_FLOOR;
        }

        private void BoostArmorValues()
        {
            var armorAcid = GetProperty(PropertyFloat.ArmorModVsAcid) ?? 0;
            var armorFire = GetProperty(PropertyFloat.ArmorModVsFire) ?? 0;
            var armorCold = GetProperty(PropertyFloat.ArmorModVsCold) ?? 0;
            var armorElectric = GetProperty(PropertyFloat.ArmorModVsElectric) ?? 0;
            var armorPierce = GetProperty(PropertyFloat.ArmorModVsPierce) ?? 0;
            var armorBludgeon = GetProperty(PropertyFloat.ArmorModVsBludgeon) ?? 0;
            var armorSlash = GetProperty(PropertyFloat.ArmorModVsSlash) ?? 0;

            ArmorModVsAcid = armorAcid + ELITE_ARMOR_BONUS;
            ArmorModVsFire = armorFire + ELITE_ARMOR_BONUS;
            ArmorModVsCold = armorCold + ELITE_ARMOR_BONUS;
            ArmorModVsElectric = armorElectric + ELITE_ARMOR_BONUS;
            ArmorModVsPierce = armorPierce + ELITE_ARMOR_BONUS;
            ArmorModVsBludgeon = armorBludgeon + ELITE_ARMOR_BONUS;
            ArmorModVsSlash = armorSlash + ELITE_ARMOR_BONUS;
        }

        private void ConfigureVitalRates()
        {
            SetProperty(PropertyInt.RadarBlipColor, (int)ACE.Entity.Enum.RadarColor.Green);
            
            HealthRate = NonProjectileMagicImmune ? ELITE_HEALTH_RATE_MAGIC_IMMUNE : ELITE_HEALTH_RATE_NORMAL;
            ManaRate = ELITE_MANA_RATE;
            StaminaRate = ELITE_STAMINA_RATE;
        }

        private void RandomizeStats()
        {
            bool isHighLevel = Level > 99;
            var minBonus = isHighLevel ? ELITE_STAT_BONUS_HIGH_MIN : ELITE_STAT_BONUS_LOW_MIN;
            var maxBonus = isHighLevel ? ELITE_STAT_BONUS_HIGH_MAX : ELITE_STAT_BONUS_LOW_MAX;

            Strength.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
            Endurance.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
            Quickness.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
            Coordination.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
            Focus.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
            Self.StartingValue += (uint)ThreadSafeRandom.Next(minBonus, maxBonus);
        }

        private (int ModCount, int OffenseMods, int DefenseMods) RollAndAssignMods()
        {
            var modInfo = (ModCount: 0, OffenseMods: 0, DefenseMods: 0);
            
            // Roll for initial mods (max 5)
            var rollValue = ThreadSafeRandom.Next(1, 1000);
            var modCountHidden = 0;

            // Define mod probabilities (improved distribution)
            var modProbabilities = new Dictionary<string, int>
            {
                ["disco"] = 650,    // Higher chance for primary combat mod
                ["beefy"] = 450,    // Defensive mod
                ["meteor"] = 500,   // Location dependent
                ["warded"] = 400,   // Defensive utility
                ["teleport"] = 350, // Mobility
                ["nova"] = 500,     // AOE combat
                ["support"] = 410   // Debuff utility
            };

            // Roll for each mod type
            foreach (var mod in modProbabilities)
            {
                if (rollValue <= mod.Value && modCountHidden < 5)
                {
                    AssignSpecificMod(mod.Key);
                    modCountHidden++;
                }
            }

            // Count assigned mods
            modInfo = CountAssignedMods();

            // Ensure minimum mod requirements
            EnsureMinimumMods(ref modInfo);

            // Handle rare mod (very low chance for high level outdoor elites)
            var rareRoll = ThreadSafeRandom.Next(1, 15000);
            if (rareRoll <= 1 && Level >= 150 && !Location.Indoors && modInfo.ModCount >= 5)
            {
                SetProperty(PropertyBool.IsRare, true);
                modInfo.ModCount++;
            }

            return modInfo;
        }

        private void AssignSpecificMod(string modType)
        {
            switch (modType)
            {
                case "disco":
                    SetProperty(PropertyBool.DiscoMod, true);
                    break;
                case "beefy":
                    SetProperty(PropertyBool.BeefyMod, true);
                    break;
                case "meteor":
                    if (Location.Indoors)
                        SetProperty(PropertyBool.DiscoMod, true); // Fallback for indoors
                    else
                        SetProperty(PropertyBool.MeteorMod, true);
                    break;
                case "warded":
                    SetProperty(PropertyBool.Warded, true);
                    break;
                case "teleport":
                    SetProperty(PropertyBool.TeleMod, true);
                    break;
                case "nova":
                    SetProperty(PropertyBool.NovaMod, true);
                    break;
                case "support":
                    SetProperty(PropertyBool.SupportMod, true);
                    break;
            }
        }

        private (int ModCount, int OffenseMods, int DefenseMods) CountAssignedMods()
        {
            int offenseMods = 0;
            int defenseMods = 0;

            if (DiscoMod) offenseMods++;
            if (MeteorMod) offenseMods++;
            if (NovaMod) offenseMods++;
            if (SupportMod) offenseMods++;
            if (MirrorMod) offenseMods++;

            if (SplitMod) defenseMods++;
            if (BeefyMod) defenseMods++;
            if (TeleMod) defenseMods++;
            if (Warded) defenseMods++;

            return (offenseMods + defenseMods, offenseMods, defenseMods);
        }

        private void EnsureMinimumMods(ref (int ModCount, int OffenseMods, int DefenseMods) modInfo)
        {
            var initGen = GetProperty(PropertyInt.InitGeneratedObjects);
            var maxGen = GetProperty(PropertyInt.MaxGeneratedObjects);

            // Ensure at least 1 offensive mod
            if (modInfo.OffenseMods < 1)
            {
                var offensiveMod = ThreadSafeRandom.Next(1, 4);
                switch (offensiveMod)
                {
                    case 1:
                        SetProperty(PropertyBool.DiscoMod, true);
                        break;
                    case 2:
                        if (!Location.Indoors)
                            SetProperty(PropertyBool.MeteorMod, true);
                        else
                            SetProperty(PropertyBool.DiscoMod, true);
                        break;
                    case 3:
                        SetProperty(PropertyBool.NovaMod, true);
                        break;
                    case 4:
                        SetProperty(PropertyBool.SupportMod, true);
                        break;
                }
                modInfo.OffenseMods++;
            }

            // Ensure at least 1 defensive mod
            if (modInfo.DefenseMods < 1)
            {
                var defensiveMod = ThreadSafeRandom.Next(1, 4);
                switch (defensiveMod)
                {
                    case 1:
                        // Only allow split if generator conditions are met
                        if (initGen <= 1 || maxGen <= 1 || initGen == null || maxGen == null)
                            SetProperty(PropertyBool.SplitMod, true);
                        else
                            SetProperty(PropertyBool.BeefyMod, true);
                        break;
                    case 2:
                        SetProperty(PropertyBool.BeefyMod, true);
                        break;
                    case 3:
                        SetProperty(PropertyBool.Warded, true);
                        break;
                    case 4:
                        SetProperty(PropertyBool.TeleMod, true);
                        break;
                }
                modInfo.DefenseMods++;
            }

            modInfo.ModCount = modInfo.OffenseMods + modInfo.DefenseMods;
        }

        private void AssignExperienceAndHealth(int modCount)
        {
            // Set XP based on level with reasonable modifiers
            var baseXP = Level > 100 ? ELITE_XP_HIGH_LEVEL : ELITE_XP_LOW_LEVEL;
            XpOverride = (int?)(baseXP * modCount); // Much more reasonable than original
            UseXpOverride = true;

            // Set HP multipliers with improved balance
            var hp = GetCreatureVital(PropertyAttribute2nd.Health);
            
            if (BeefyMod)
            {
                if (Level > 99)
                {
                    var multiplier = hp.StartingValue > ELITE_HP_MULTIPLIER_BEEFY_THRESHOLD ? 
                        15 : ELITE_HP_MULTIPLIER_BEEFY_HIGH;
                    hp.StartingValue *= multiplier;
                }
                else
                {
                    hp.StartingValue *= ELITE_HP_MULTIPLIER_BEEFY_LOW;
                }
                hp.Current = hp.MaxValue;
            }
            else
            {
                var multiplier = Level > 99 ? ELITE_HP_MULTIPLIER_HIGH : ELITE_HP_MULTIPLIER_LOW;
                hp.StartingValue *= multiplier;
                hp.Current = hp.MaxValue;
            }

            // Ensure vitals are at max after stat changes
            var stamina = GetCreatureVital(PropertyAttribute2nd.Stamina);
            var mana = GetCreatureVital(PropertyAttribute2nd.Mana);
            mana.Current = mana.MaxValue;
            stamina.Current = stamina.MaxValue;
        }

        private void GenerateEliteName(string originalName, int modCount)
        {
            if (string.IsNullOrEmpty(originalName)) return;

            // Generate resistance indicators
            var resistanceIndicators = GenerateResistanceIndicators();
            
            // Generate mod list
            var modList = GenerateModList(modCount);

            // Set elite name with resistance indicators
            SetProperty(PropertyString.Name, $"Elite {originalName} {resistanceIndicators}");

            // Set mod template
            SetProperty(PropertyString.Template, modList);
        }

        private string GenerateResistanceIndicators()
        {
            var indicators = new List<string>();
            
            if (ResistAcid <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+a]");
            if (ResistFire <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+f]");
            if (ResistCold <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+c]");
            if (ResistElectric <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+e]");
            if (ResistPierce <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+p]");
            if (ResistBludgeon <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+b]");
            if (ResistSlash <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+s]");
            if (ResistNether <= ELITE_RESISTANCE_WEAKNESS_THRESHOLD) indicators.Add("[+n]");

            return string.Join("", indicators);
        }

        private string GenerateModList(int modCount)
        {
            var mods = new List<string>();
            var useAbbreviations = modCount >= 5;

            if (DiscoMod) mods.Add(useAbbreviations ? "Disc" : "Disco");
            if (SplitMod) mods.Add(useAbbreviations ? "Spl" : "Split");
            if (IsRare) mods.Add(useAbbreviations ? "Rar" : "Rare");
            if (BeefyMod) mods.Add(useAbbreviations ? "Beef" : "Beefy");
            if (Warded) mods.Add("Ward");
            if (MeteorMod) mods.Add(useAbbreviations ? "Met" : "Meteor");
            if (TeleMod) mods.Add(useAbbreviations ? "Tel" : "Tele");
            if (NovaMod) mods.Add(useAbbreviations ? "Nov" : "Nova");
            if (SupportMod) mods.Add(useAbbreviations ? "Sup" : "Support");
            if (MirrorMod) mods.Add(useAbbreviations ? "Mirr" : "Mirror");

            return string.Join(",", mods);
        }

        private void FinalizeEliteConversion()
        {
            // Enhance magic skills for relevant mods
            if (DiscoMod || MeteorMod || NovaMod)
            {
                var warMagic = GetCreatureSkill(Skill.WarMagic);
                var bonus = warMagic.InitLevel > 100 && warMagic.InitLevel < 200 ? 30u : 45u;
                warMagic.InitLevel += bonus;
            }

            if (SupportMod)
            {
                var lifeMagic = GetCreatureSkill(Skill.LifeMagic);
                var creatureMagic = GetCreatureSkill(Skill.CreatureEnchantment);
                
                var lifeBonus = lifeMagic.InitLevel > 100 && lifeMagic.InitLevel < 200 ? 30u : 50u;
                var creatureBonus = creatureMagic.InitLevel > 100 && creatureMagic.InitLevel < 200 ? 30u : 50u;

                lifeMagic.InitLevel += lifeBonus;
                creatureMagic.InitLevel += creatureBonus;
            }

            // Allow identification of elite stats
            var deception = GetCreatureSkill(Skill.Deception);
            if (deception.InitLevel > 0)
                deception.InitLevel = 0;

            // Enable rare generation
            CanGenerateRare = true;

            // Scale level for display (cosmetic only)
            Level += 15;
            Level *= 2;

            // Configure dungeon behavior
            if (Location.Indoors)
            {
                Tolerance = Tolerance.Retaliate;
                VisualAwarenessRange = 0;
                MoveToHome();
                IsAwake = false;
                SetProperty(PropertyFloat.EliteDungeonIdleTime, Time.GetFutureUnixTime(3600));
            }

            // Broadcast elite spawn
            var modCountForBroadcast = CountAssignedMods().ModCount;
            EnqueueBroadcast(new GameMessageSystemChat($"[ELITE] {Name} has spawned as an elite near you with {modCountForBroadcast} Mods. {Location.GetMapCoordStr()}", ChatMessageType.System), LocalBroadcastRangeSq, ChatMessageType.System);

            if (IsRare)
                PlayerManager.BroadcastToAll(new GameMessageSystemChat($"[ELITE] An elite monster with the RARE mod has spawned at {Location.GetMapCoordStr()}", ChatMessageType.Broadcast));

            SetProperty(PropertyBool.EliteTrigger, false);
            EnqueueBroadcastUpdateObject();
        }

        #endregion
    }
}
