DELETE FROM `weenie` WHERE `class_Id` = 50145;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50145, 'chesthidden2', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50145,   1,        512) /* ItemType - Container */
     , (50145,   5,       9000) /* EncumbranceVal */
     , (50145,   6,         -1) /* ItemsCapacity */
     , (50145,   7,         -1) /* ContainersCapacity */
     , (50145,   8,       3000) /* Mass */
     , (50145,  16,         48) /* ItemUseable - ViewedRemote */
     , (50145,  19,       2500) /* Value */
     , (50145,  38,        100) /* ResistLockpick */
     , (50145,  81,          3) /* MaxGeneratedObjects */
     , (50145,  82,          3) /* InitGeneratedObjects */
     , (50145,  83,          2) /* ActivationResponse - Use */
     , (50145,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50145,  96,        500) /* EncumbranceCapacity */
     , (50145, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50145,   1, True ) /* Stuck */
     , (50145,   2, False) /* Open */
     , (50145,  12, False) /* ReportCollisions */
     , (50145,  13, True ) /* Ethereal */
     , (50145,  18, True ) /* Visibility */
     , (50145,  33, False) /* ResetMessagePending */
     , (50145,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50145,  41,     600) /* RegenerationInterval */
     , (50145,  43,       1) /* GeneratorRadius */
     , (50145,  54,       1) /* UseRadius */
     , (50145,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50145,   1, 'Hidden Chest') /* Name */
     , (50145,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50145,   1, 0x0200007C) /* Setup */
     , (50145,   2, 0x09000004) /* MotionTable */
     , (50145,   3, 0x20000021) /* SoundTable */
     , (50145,   8, 0x06001020) /* Icon */
     , (50145,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50145, -1, 451, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T2_General(T2) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
