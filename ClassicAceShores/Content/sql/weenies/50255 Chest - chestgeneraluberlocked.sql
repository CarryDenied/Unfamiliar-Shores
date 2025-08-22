DELETE FROM `weenie` WHERE `class_Id` = 50255;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50255, 'chestgeneraluberlocked', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50255,   1,        512) /* ItemType - Container */
     , (50255,   5,       9000) /* EncumbranceVal */
     , (50255,   6,         -1) /* ItemsCapacity */
     , (50255,   7,         -1) /* ContainersCapacity */
     , (50255,   8,       3000) /* Mass */
     , (50255,  16,         48) /* ItemUseable - ViewedRemote */
     , (50255,  19,       2500) /* Value */
     , (50255,  37,         30) /* ResistItemAppraisal */
     , (50255,  38,        450) /* ResistLockpick */
     , (50255,  81,          1) /* MaxGeneratedObjects */
     , (50255,  82,          1) /* InitGeneratedObjects */
     , (50255,  83,          2) /* ActivationResponse - Use */
     , (50255,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50255,  96,        500) /* EncumbranceCapacity */
     , (50255, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50255,   1, True ) /* Stuck */
     , (50255,   2, False) /* Open */
     , (50255,   3, True ) /* Locked */
     , (50255,  12, True ) /* ReportCollisions */
     , (50255,  13, False) /* Ethereal */
     , (50255,  33, False) /* ResetMessagePending */
     , (50255,  34, False) /* DefaultOpen */
     , (50255,  35, True ) /* DefaultLocked */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50255,  41,     600) /* RegenerationInterval */
     , (50255,  43,       1) /* GeneratorRadius */
     , (50255,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50255,   1, 'Chest') /* Name */
     , (50255,  12, 'nokey') /* LockCode */
     , (50255,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50255,   1, 0x0200007C) /* Setup */
     , (50255,   2, 0x09000004) /* MotionTable */
     , (50255,   3, 0x20000021) /* SoundTable */
     , (50255,   8, 0x06001020) /* Icon */
     , (50255,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50255, 1, 449, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_General(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
