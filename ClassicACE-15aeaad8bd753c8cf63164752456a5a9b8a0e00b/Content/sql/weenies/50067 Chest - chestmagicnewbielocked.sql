DELETE FROM `weenie` WHERE `class_Id` = 50067;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50067, 'chestmagicnewbielocked', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50067,   1,        512) /* ItemType - Container */
     , (50067,   5,       9000) /* EncumbranceVal */
     , (50067,   6,         -1) /* ItemsCapacity */
     , (50067,   7,         -1) /* ContainersCapacity */
     , (50067,   8,       3000) /* Mass */
     , (50067,  16,         48) /* ItemUseable - ViewedRemote */
     , (50067,  19,        200) /* Value */
     , (50067,  37,         30) /* ResistItemAppraisal */
     , (50067,  38,         40) /* ResistLockpick */
     , (50067,  81,          1) /* MaxGeneratedObjects */
     , (50067,  82,          1) /* InitGeneratedObjects */
     , (50067,  83,          2) /* ActivationResponse - Use */
     , (50067,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50067,  96,        500) /* EncumbranceCapacity */
     , (50067, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50067,   1, True ) /* Stuck */
     , (50067,   2, False) /* Open */
     , (50067,   3, True ) /* Locked */
     , (50067,  12, True ) /* ReportCollisions */
     , (50067,  13, False) /* Ethereal */
     , (50067,  33, False) /* ResetMessagePending */
     , (50067,  34, False) /* DefaultOpen */
     , (50067,  35, True ) /* DefaultLocked */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50067,  41,     600) /* RegenerationInterval */
     , (50067,  43,       1) /* GeneratorRadius */
     , (50067,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50067,   1, 'Chest') /* Name */
     , (50067,  12, 'nokey') /* LockCode */
     , (50067,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50067,   1, 0x0200007C) /* Setup */
     , (50067,   2, 0x09000004) /* MotionTable */
     , (50067,   3, 0x20000021) /* SoundTable */
     , (50067,   8, 0x06001020) /* Icon */
     , (50067,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50067, 1, 465, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T1_Magic(T1) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
