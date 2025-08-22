DELETE FROM `weenie` WHERE `class_Id` = 50208;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50208, 'chesttreasure2', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50208,   1,        512) /* ItemType - Container */
     , (50208,   5,       9000) /* EncumbranceVal */
     , (50208,   6,         -1) /* ItemsCapacity */
     , (50208,   7,         -1) /* ContainersCapacity */
     , (50208,   8,       3000) /* Mass */
     , (50208,  16,         48) /* ItemUseable - ViewedRemote */
     , (50208,  19,       2500) /* Value */
     , (50208,  38,        100) /* ResistLockpick */
     , (50208,  81,          3) /* MaxGeneratedObjects */
     , (50208,  82,          3) /* InitGeneratedObjects */
     , (50208,  83,          2) /* ActivationResponse - Use */
     , (50208,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50208,  96,        500) /* EncumbranceCapacity */
     , (50208, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50208,   1, True ) /* Stuck */
     , (50208,   2, False) /* Open */
     , (50208,  12, True ) /* ReportCollisions */
     , (50208,  13, False) /* Ethereal */
     , (50208,  33, False) /* ResetMessagePending */
     , (50208,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50208,  41,     600) /* RegenerationInterval */
     , (50208,  43,       1) /* GeneratorRadius */
     , (50208,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50208,   1, 'Treasure Chest') /* Name */
     , (50208,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50208,   1, 0x0200007C) /* Setup */
     , (50208,   2, 0x09000004) /* MotionTable */
     , (50208,   3, 0x20000021) /* SoundTable */
     , (50208,   8, 0x06001020) /* Icon */
     , (50208,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50208, -1, 1001, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T2_TreasureChest(T2) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
