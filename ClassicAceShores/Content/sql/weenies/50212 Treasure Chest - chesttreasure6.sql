DELETE FROM `weenie` WHERE `class_Id` = 50212;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50212, 'chesttreasure6', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50212,   1,        512) /* ItemType - Container */
     , (50212,   5,       9000) /* EncumbranceVal */
     , (50212,   6,         -1) /* ItemsCapacity */
     , (50212,   7,         -1) /* ContainersCapacity */
     , (50212,   8,       3000) /* Mass */
     , (50212,  16,         48) /* ItemUseable - ViewedRemote */
     , (50212,  19,       2500) /* Value */
     , (50212,  38,        450) /* ResistLockpick */
     , (50212,  81,          3) /* MaxGeneratedObjects */
     , (50212,  82,          3) /* InitGeneratedObjects */
     , (50212,  83,          2) /* ActivationResponse - Use */
     , (50212,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50212,  96,        500) /* EncumbranceCapacity */
     , (50212, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50212,   1, True ) /* Stuck */
     , (50212,   2, False) /* Open */
     , (50212,  12, True ) /* ReportCollisions */
     , (50212,  13, False) /* Ethereal */
     , (50212,  33, False) /* ResetMessagePending */
     , (50212,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50212,  41,     600) /* RegenerationInterval */
     , (50212,  43,       1) /* GeneratorRadius */
     , (50212,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50212,   1, 'Treasure Chest') /* Name */
     , (50212,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50212,   1, 0x0200007C) /* Setup */
     , (50212,   2, 0x09000004) /* MotionTable */
     , (50212,   3, 0x20000021) /* SoundTable */
     , (50212,   8, 0x06001020) /* Icon */
     , (50212,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50212, -1, 1005, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_TreasureChest(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
