DELETE FROM `weenie` WHERE `class_Id` = 50147;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50147, 'chesthidden4', 20, '2023-01-19 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50147,   1,        512) /* ItemType - Container */
     , (50147,   5,       9000) /* EncumbranceVal */
     , (50147,   6,         -1) /* ItemsCapacity */
     , (50147,   7,         -1) /* ContainersCapacity */
     , (50147,   8,       3000) /* Mass */
     , (50147,  16,         48) /* ItemUseable - ViewedRemote */
     , (50147,  19,       2500) /* Value */
     , (50147,  38,        300) /* ResistLockpick */
     , (50147,  81,          3) /* MaxGeneratedObjects */
     , (50147,  82,          3) /* InitGeneratedObjects */
     , (50147,  83,          2) /* ActivationResponse - Use */
     , (50147,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50147,  96,        500) /* EncumbranceCapacity */
     , (50147, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50147,   1, True ) /* Stuck */
     , (50147,   2, False) /* Open */
     , (50147,  12, False) /* ReportCollisions */
     , (50147,  13, True ) /* Ethereal */
     , (50147,  18, True ) /* Visibility */
     , (50147,  33, False) /* ResetMessagePending */
     , (50147,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50147,  41,     600) /* RegenerationInterval */
     , (50147,  43,       1) /* GeneratorRadius */
     , (50147,  54,       1) /* UseRadius */
     , (50147,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50147,   1, 'Hidden Chest') /* Name */
     , (50147,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50147,   1, 0x0200007C) /* Setup */
     , (50147,   2, 0x09000004) /* MotionTable */
     , (50147,   3, 0x20000021) /* SoundTable */
     , (50147,   8, 0x06001020) /* Icon */
     , (50147,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50147, -1, 448, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T4_General(T4) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
