DELETE FROM `weenie` WHERE `class_Id` = 50148;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50148, 'chesthidden5', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50148,   1,        512) /* ItemType - Container */
     , (50148,   5,       9000) /* EncumbranceVal */
     , (50148,   6,         -1) /* ItemsCapacity */
     , (50148,   7,         -1) /* ContainersCapacity */
     , (50148,   8,       3000) /* Mass */
     , (50148,  16,         48) /* ItemUseable - ViewedRemote */
     , (50148,  19,       2500) /* Value */
     , (50148,  38,        400) /* ResistLockpick */
     , (50148,  81,          3) /* MaxGeneratedObjects */
     , (50148,  82,          3) /* InitGeneratedObjects */
     , (50148,  83,          2) /* ActivationResponse - Use */
     , (50148,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50148,  96,        500) /* EncumbranceCapacity */
     , (50148, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50148,   1, True ) /* Stuck */
     , (50148,   2, False) /* Open */
     , (50148,  12, False) /* ReportCollisions */
     , (50148,  13, True ) /* Ethereal */
     , (50148,  18, True ) /* Visibility */
     , (50148,  33, False) /* ResetMessagePending */
     , (50148,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50148,  41,     600) /* RegenerationInterval */
     , (50148,  43,       1) /* GeneratorRadius */
     , (50148,  54,       1) /* UseRadius */
     , (50148,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50148,   1, 'Hidden Chest') /* Name */
     , (50148,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50148,   1, 0x0200007C) /* Setup */
     , (50148,   2, 0x09000004) /* MotionTable */
     , (50148,   3, 0x20000021) /* SoundTable */
     , (50148,   8, 0x06001020) /* Icon */
     , (50148,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50148, -1, 452, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_General(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
