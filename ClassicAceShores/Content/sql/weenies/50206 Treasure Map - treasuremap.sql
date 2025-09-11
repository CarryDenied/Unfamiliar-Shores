DELETE FROM `weenie` WHERE `class_Id` = 50206;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50206, 'treasuremap', 75, '2023-06-24 10:00:00') /* TreasureMap */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50206,   1,       8192) /* ItemType - Writable */
     , (50206,   5,         25) /* EncumbranceVal */
     , (50206,   8,          5) /* Mass */
     , (50206,  16,          8) /* ItemUseable - Contained */
     , (50206,  19,       2500) /* Value */
     , (50206,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50206, 280,       1004) /* SharedCooldown */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50206,  22, True ) /* Inscribable */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50206,  39,       1) /* DefaultScale */
     , (50206, 167,       5) /* CooldownDuration */
     , (50206, 10009,       1) /* Tier */
     , (50206, 10017,       0) /* NSCoordinates */
     , (50206, 10018,       0) /* EWCoordinates */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50206,   1, 'Treasure Map') /* Name */
     , (50206,  14, 'Use this item to analyze it.') /* Use */
     , (50206,  16, 'A map with an X indicating where a treasure chest has been buried.

Beware! Digging for treasure will attract the attention of nearby creatures!') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50206,   1, 0x02000158) /* Setup */
     , (50206,   3, 0x20000014) /* SoundTable */
     , (50206,   6, 0x040008B4) /* PaletteBase */
     , (50206,   7, 0x100003B1) /* ClothingBase */
     , (50206,   8, 0x0600262C) /* Icon */
     , (50206,  22, 0x3400002B) /* PhysicsEffectTable */;
