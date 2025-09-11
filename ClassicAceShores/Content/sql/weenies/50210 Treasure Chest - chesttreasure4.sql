DELETE FROM `weenie` WHERE `class_Id` = 50210;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50210, 'chesttreasure4', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50210,   1,        512) /* ItemType - Container */
     , (50210,   5,       9000) /* EncumbranceVal */
     , (50210,   6,         -1) /* ItemsCapacity */
     , (50210,   7,         -1) /* ContainersCapacity */
     , (50210,   8,       3000) /* Mass */
     , (50210,  16,         48) /* ItemUseable - ViewedRemote */
     , (50210,  19,       2500) /* Value */
     , (50210,  38,        300) /* ResistLockpick */
     , (50210,  81,          3) /* MaxGeneratedObjects */
     , (50210,  82,          3) /* InitGeneratedObjects */
     , (50210,  83,          2) /* ActivationResponse - Use */
     , (50210,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50210,  96,        500) /* EncumbranceCapacity */
     , (50210, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50210,   1, True ) /* Stuck */
     , (50210,   2, False) /* Open */
     , (50210,  12, True ) /* ReportCollisions */
     , (50210,  13, False) /* Ethereal */
     , (50210,  33, False) /* ResetMessagePending */
     , (50210,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50210,  41,     600) /* RegenerationInterval */
     , (50210,  43,       1) /* GeneratorRadius */
     , (50210,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50210,   1, 'Treasure Chest') /* Name */
     , (50210,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50210,   1, 0x0200007C) /* Setup */
     , (50210,   2, 0x09000004) /* MotionTable */
     , (50210,   3, 0x20000021) /* SoundTable */
     , (50210,   8, 0x06001020) /* Icon */
     , (50210,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50210, -1, 1003, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T4_TreasureChest(T4) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
