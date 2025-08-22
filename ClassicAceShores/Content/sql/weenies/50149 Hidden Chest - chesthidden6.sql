DELETE FROM `weenie` WHERE `class_Id` = 50149;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50149, 'chesthidden6', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50149,   1,        512) /* ItemType - Container */
     , (50149,   5,       9000) /* EncumbranceVal */
     , (50149,   6,         -1) /* ItemsCapacity */
     , (50149,   7,         -1) /* ContainersCapacity */
     , (50149,   8,       3000) /* Mass */
     , (50149,  16,         48) /* ItemUseable - ViewedRemote */
     , (50149,  19,       2500) /* Value */
     , (50149,  38,        450) /* ResistLockpick */
     , (50149,  81,          3) /* MaxGeneratedObjects */
     , (50149,  82,          3) /* InitGeneratedObjects */
     , (50149,  83,          2) /* ActivationResponse - Use */
     , (50149,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50149,  96,        500) /* EncumbranceCapacity */
     , (50149, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50149,   1, True ) /* Stuck */
     , (50149,   2, False) /* Open */
     , (50149,  12, False) /* ReportCollisions */
     , (50149,  13, True ) /* Ethereal */
     , (50149,  18, True ) /* Visibility */
     , (50149,  33, False) /* ResetMessagePending */
     , (50149,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50149,  41,     600) /* RegenerationInterval */
     , (50149,  43,       1) /* GeneratorRadius */
     , (50149,  54,       1) /* UseRadius */
     , (50149,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50149,   1, 'Hidden Chest') /* Name */
     , (50149,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50149,   1, 0x0200007C) /* Setup */
     , (50149,   2, 0x09000004) /* MotionTable */
     , (50149,   3, 0x20000021) /* SoundTable */
     , (50149,   8, 0x06001020) /* Icon */
     , (50149,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50149, -1, 449, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_General(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
