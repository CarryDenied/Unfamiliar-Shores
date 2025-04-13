DELETE FROM `weenie` WHERE `class_Id` = 50207;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50207, 'chesttreasure1', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50207,   1,        512) /* ItemType - Container */
     , (50207,   5,       9000) /* EncumbranceVal */
     , (50207,   6,         -1) /* ItemsCapacity */
     , (50207,   7,         -1) /* ContainersCapacity */
     , (50207,   8,       3000) /* Mass */
     , (50207,  16,         48) /* ItemUseable - ViewedRemote */
     , (50207,  19,       2500) /* Value */
     , (50207,  38,         60) /* ResistLockpick */
     , (50207,  81,          3) /* MaxGeneratedObjects */
     , (50207,  82,          3) /* InitGeneratedObjects */
     , (50207,  83,          2) /* ActivationResponse - Use */
     , (50207,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50207,  96,        500) /* EncumbranceCapacity */
     , (50207, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50207,   1, True ) /* Stuck */
     , (50207,   2, False) /* Open */
     , (50207,  12, True ) /* ReportCollisions */
     , (50207,  13, False) /* Ethereal */
     , (50207,  33, False) /* ResetMessagePending */
     , (50207,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50207,  41,     600) /* RegenerationInterval */
     , (50207,  43,       1) /* GeneratorRadius */
     , (50207,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50207,   1, 'Treasure Chest') /* Name */
     , (50207,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50207,   1, 0x0200007C) /* Setup */
     , (50207,   2, 0x09000004) /* MotionTable */
     , (50207,   3, 0x20000021) /* SoundTable */
     , (50207,   8, 0x06001020) /* Icon */
     , (50207,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50207, -1, 1000, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T1_TreasureChest(T1) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
