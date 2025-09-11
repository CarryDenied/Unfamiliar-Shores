DELETE FROM `weenie` WHERE `class_Id` = 50308;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50308, 'runedcorpseuber', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50308,   1,        512) /* ItemType - Container */
     , (50308,   5,       3000) /* EncumbranceVal */
     , (50308,   6,         -1) /* ItemsCapacity */
     , (50308,   7,         -1) /* ContainersCapacity */
     , (50308,   8,        130) /* Mass */
     , (50308,  16,         48) /* ItemUseable - ViewedRemote */
     , (50308,  19,          0) /* Value */
     , (50308,  81,          1) /* MaxGeneratedObjects */
     , (50308,  82,          1) /* InitGeneratedObjects */
     , (50308,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (50308,  96,        500) /* EncumbranceCapacity */
     , (50308, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50308,   1, True ) /* Stuck */
     , (50308,   2, False) /* Open */
     , (50308,  12, True ) /* ReportCollisions */
     , (50308,  13, True ) /* Ethereal */
     , (50308,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50308,  41,     600) /* RegenerationInterval */
     , (50308,  43,       1) /* GeneratorRadius */
     , (50308,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50308,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50308,   1, 0x02000889) /* Setup */
     , (50308,   3, 0x20000014) /* SoundTable */
     , (50308,   8, 0x06001070) /* Icon */
     , (50308,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50308, -1, 1006, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_RunedChest(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
