DELETE FROM `weenie` WHERE `class_Id` = 50209;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50209, 'chesttreasure3', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50209,   1,        512) /* ItemType - Container */
     , (50209,   5,       9000) /* EncumbranceVal */
     , (50209,   6,         -1) /* ItemsCapacity */
     , (50209,   7,         -1) /* ContainersCapacity */
     , (50209,   8,       3000) /* Mass */
     , (50209,  16,         48) /* ItemUseable - ViewedRemote */
     , (50209,  19,       2500) /* Value */
     , (50209,  38,        200) /* ResistLockpick */
     , (50209,  81,          3) /* MaxGeneratedObjects */
     , (50209,  82,          3) /* InitGeneratedObjects */
     , (50209,  83,          2) /* ActivationResponse - Use */
     , (50209,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50209,  96,        500) /* EncumbranceCapacity */
     , (50209, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50209,   1, True ) /* Stuck */
     , (50209,   2, False) /* Open */
     , (50209,  12, True ) /* ReportCollisions */
     , (50209,  13, False) /* Ethereal */
     , (50209,  33, False) /* ResetMessagePending */
     , (50209,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50209,  41,     600) /* RegenerationInterval */
     , (50209,  43,       1) /* GeneratorRadius */
     , (50209,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50209,   1, 'Treasure Chest') /* Name */
     , (50209,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50209,   1, 0x0200007C) /* Setup */
     , (50209,   2, 0x09000004) /* MotionTable */
     , (50209,   3, 0x20000021) /* SoundTable */
     , (50209,   8, 0x06001020) /* Icon */
     , (50209,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50209, -1, 1002, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T3_TreasureChest(T3) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
