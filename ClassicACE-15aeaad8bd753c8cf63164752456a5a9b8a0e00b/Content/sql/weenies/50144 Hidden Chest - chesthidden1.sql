DELETE FROM `weenie` WHERE `class_Id` = 50144;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50144, 'chesthidden1', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50144,   1,        512) /* ItemType - Container */
     , (50144,   5,       9000) /* EncumbranceVal */
     , (50144,   6,         -1) /* ItemsCapacity */
     , (50144,   7,         -1) /* ContainersCapacity */
     , (50144,   8,       3000) /* Mass */
     , (50144,  16,         48) /* ItemUseable - ViewedRemote */
     , (50144,  19,       2500) /* Value */
     , (50144,  38,         60) /* ResistLockpick */
     , (50144,  81,          3) /* MaxGeneratedObjects */
     , (50144,  82,          3) /* InitGeneratedObjects */
     , (50144,  83,          2) /* ActivationResponse - Use */
     , (50144,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50144,  96,        500) /* EncumbranceCapacity */
     , (50144, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50144,   1, True ) /* Stuck */
     , (50144,   2, False) /* Open */
     , (50144,  12, False) /* ReportCollisions */
     , (50144,  13, True ) /* Ethereal */
     , (50144,  18, True ) /* Visibility */
     , (50144,  33, False) /* ResetMessagePending */
     , (50144,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50144,  41,     600) /* RegenerationInterval */
     , (50144,  43,       1) /* GeneratorRadius */
     , (50144,  54,       1) /* UseRadius */
     , (50144,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50144,   1, 'Hidden Chest') /* Name */
     , (50144,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50144,   1, 0x0200007C) /* Setup */
     , (50144,   2, 0x09000004) /* MotionTable */
     , (50144,   3, 0x20000021) /* SoundTable */
     , (50144,   8, 0x06001020) /* Icon */
     , (50144,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50144, -1, 453, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T1_General(T1) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
