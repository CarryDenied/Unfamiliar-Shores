DELETE FROM `weenie` WHERE `class_Id` = 50252;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50252, 'chestgeneralextreme', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50252,   1,        512) /* ItemType - Container */
     , (50252,   5,       9000) /* EncumbranceVal */
     , (50252,   6,         -1) /* ItemsCapacity */
     , (50252,   7,         -1) /* ContainersCapacity */
     , (50252,   8,       3000) /* Mass */
     , (50252,  16,         48) /* ItemUseable - ViewedRemote */
     , (50252,  19,       2500) /* Value */
     , (50252,  81,          1) /* MaxGeneratedObjects */
     , (50252,  82,          1) /* InitGeneratedObjects */
     , (50252,  83,          2) /* ActivationResponse - Use */
     , (50252,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50252,  96,        500) /* EncumbranceCapacity */
     , (50252, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50252,   1, True ) /* Stuck */
     , (50252,   2, False) /* Open */
     , (50252,  12, True ) /* ReportCollisions */
     , (50252,  13, False) /* Ethereal */
     , (50252,  33, False) /* ResetMessagePending */
     , (50252,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50252,  41,     600) /* RegenerationInterval */
     , (50252,  43,       1) /* GeneratorRadius */
     , (50252,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50252,   1, 'Chest') /* Name */
     , (50252,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50252,   1, 0x0200007C) /* Setup */
     , (50252,   2, 0x09000004) /* MotionTable */
     , (50252,   3, 0x20000021) /* SoundTable */
     , (50252,   8, 0x06001020) /* Icon */
     , (50252,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50252, 1, 452, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_General(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
