DELETE FROM `weenie` WHERE `class_Id` = 50211;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50211, 'chesttreasure5', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50211,   1,        512) /* ItemType - Container */
     , (50211,   5,       9000) /* EncumbranceVal */
     , (50211,   6,         -1) /* ItemsCapacity */
     , (50211,   7,         -1) /* ContainersCapacity */
     , (50211,   8,       3000) /* Mass */
     , (50211,  16,         48) /* ItemUseable - ViewedRemote */
     , (50211,  19,       2500) /* Value */
     , (50211,  38,        400) /* ResistLockpick */
     , (50211,  81,          3) /* MaxGeneratedObjects */
     , (50211,  82,          3) /* InitGeneratedObjects */
     , (50211,  83,          2) /* ActivationResponse - Use */
     , (50211,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50211,  96,        500) /* EncumbranceCapacity */
     , (50211, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50211,   1, True ) /* Stuck */
     , (50211,   2, False) /* Open */
     , (50211,  12, True ) /* ReportCollisions */
     , (50211,  13, False) /* Ethereal */
     , (50211,  33, False) /* ResetMessagePending */
     , (50211,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50211,  41,     600) /* RegenerationInterval */
     , (50211,  43,       1) /* GeneratorRadius */
     , (50211,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50211,   1, 'Treasure Chest') /* Name */
     , (50211,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50211,   1, 0x0200007C) /* Setup */
     , (50211,   2, 0x09000004) /* MotionTable */
     , (50211,   3, 0x20000021) /* SoundTable */
     , (50211,   8, 0x06001020) /* Icon */
     , (50211,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50211, -1, 1004, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_TreasureChest(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
