DELETE FROM `weenie` WHERE `class_Id` = 50075;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50075, 'chestglitternewbielocked', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50075,   1,        512) /* ItemType - Container */
     , (50075,   5,       9000) /* EncumbranceVal */
     , (50075,   6,         -1) /* ItemsCapacity */
     , (50075,   7,         -1) /* ContainersCapacity */
     , (50075,   8,       3000) /* Mass */
     , (50075,  16,         48) /* ItemUseable - ViewedRemote */
     , (50075,  19,        200) /* Value */
     , (50075,  37,         30) /* ResistItemAppraisal */
     , (50075,  38,         40) /* ResistLockpick */
     , (50075,  81,          1) /* MaxGeneratedObjects */
     , (50075,  82,          1) /* InitGeneratedObjects */
     , (50075,  83,          2) /* ActivationResponse - Use */
     , (50075,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50075,  96,        500) /* EncumbranceCapacity */
     , (50075, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50075,   1, True ) /* Stuck */
     , (50075,   2, False) /* Open */
     , (50075,   3, True ) /* Locked */
     , (50075,  12, True ) /* ReportCollisions */
     , (50075,  13, False) /* Ethereal */
     , (50075,  33, False) /* ResetMessagePending */
     , (50075,  34, False) /* DefaultOpen */
     , (50075,  35, True ) /* DefaultLocked */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50075,  41,     600) /* RegenerationInterval */
     , (50075,  43,       1) /* GeneratorRadius */
     , (50075,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50075,   1, 'Chest') /* Name */
     , (50075,  12, 'nokey') /* LockCode */
     , (50075,  14, 'Use this item to open it and see its contents.') /* Use */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50075,   1, 0x0200007C) /* Setup */
     , (50075,   2, 0x09000004) /* MotionTable */
     , (50075,   3, 0x20000021) /* SoundTable */
     , (50075,   8, 0x06001020) /* Icon */
     , (50075,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50075, 1, 18, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T1_Chest_Money(T1) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
