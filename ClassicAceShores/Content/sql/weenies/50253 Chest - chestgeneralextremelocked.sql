DELETE FROM `weenie` WHERE `class_Id` = 50253;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50253, 'chestgeneralextremelocked', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50253,   1,        512) /* ItemType - Container */
     , (50253,   5,       9000) /* EncumbranceVal */
     , (50253,   6,         -1) /* ItemsCapacity */
     , (50253,   7,         -1) /* ContainersCapacity */
     , (50253,   8,       3000) /* Mass */
     , (50253,  16,         48) /* ItemUseable - ViewedRemote */
     , (50253,  19,       2500) /* Value */
     , (50253,  37,         30) /* ResistItemAppraisal */
     , (50253,  38,        400) /* ResistLockpick */
     , (50253,  81,          1) /* MaxGeneratedObjects */
     , (50253,  82,          1) /* InitGeneratedObjects */
     , (50253,  83,          2) /* ActivationResponse - Use */
     , (50253,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50253,  96,        500) /* EncumbranceCapacity */
     , (50253, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50253,   1, True ) /* Stuck */
     , (50253,   2, False) /* Open */
     , (50253,   3, True ) /* Locked */
     , (50253,  12, True ) /* ReportCollisions */
     , (50253,  13, False) /* Ethereal */
     , (50253,  33, False) /* ResetMessagePending */
     , (50253,  34, False) /* DefaultOpen */
     , (50253,  35, True ) /* DefaultLocked */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50253,  41,     600) /* RegenerationInterval */
     , (50253,  43,       1) /* GeneratorRadius */
     , (50253,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50253,   1, 'Chest') /* Name */
     , (50253,  12, 'nokey') /* LockCode */
     , (50253,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50253,   1, 0x0200007C) /* Setup */
     , (50253,   2, 0x09000004) /* MotionTable */
     , (50253,   3, 0x20000021) /* SoundTable */
     , (50253,   8, 0x06001020) /* Icon */
     , (50253,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50253, 1, 452, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_General(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
