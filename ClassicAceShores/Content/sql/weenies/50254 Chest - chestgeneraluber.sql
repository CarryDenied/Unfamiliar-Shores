DELETE FROM `weenie` WHERE `class_Id` = 50254;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50254, 'chestgeneraluber', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50254,   1,        512) /* ItemType - Container */
     , (50254,   5,       9000) /* EncumbranceVal */
     , (50254,   6,         -1) /* ItemsCapacity */
     , (50254,   7,         -1) /* ContainersCapacity */
     , (50254,   8,       3000) /* Mass */
     , (50254,  16,         48) /* ItemUseable - ViewedRemote */
     , (50254,  19,       2500) /* Value */
     , (50254,  81,          1) /* MaxGeneratedObjects */
     , (50254,  82,          1) /* InitGeneratedObjects */
     , (50254,  83,          2) /* ActivationResponse - Use */
     , (50254,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50254,  96,        500) /* EncumbranceCapacity */
     , (50254, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50254,   1, True ) /* Stuck */
     , (50254,   2, False) /* Open */
     , (50254,  12, True ) /* ReportCollisions */
     , (50254,  13, False) /* Ethereal */
     , (50254,  33, False) /* ResetMessagePending */
     , (50254,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50254,  41,     600) /* RegenerationInterval */
     , (50254,  43,       1) /* GeneratorRadius */
     , (50254,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50254,   1, 'Chest') /* Name */
     , (50254,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50254,   1, 0x0200007C) /* Setup */
     , (50254,   2, 0x09000004) /* MotionTable */
     , (50254,   3, 0x20000021) /* SoundTable */
     , (50254,   8, 0x06001020) /* Icon */
     , (50254,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50254, 1, 449, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_General(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
