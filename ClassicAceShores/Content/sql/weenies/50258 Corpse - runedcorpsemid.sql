DELETE FROM `weenie` WHERE `class_Id` = 50258;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50258, 'runedcorpsemid', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50258,   1,        512) /* ItemType - Container */
     , (50258,   5,       3000) /* EncumbranceVal */
     , (50258,   6,         -1) /* ItemsCapacity */
     , (50258,   7,         -1) /* ContainersCapacity */
     , (50258,   8,        130) /* Mass */
     , (50258,  16,         48) /* ItemUseable - ViewedRemote */
     , (50258,  19,          0) /* Value */
     , (50258,  81,          1) /* MaxGeneratedObjects */
     , (50258,  82,          1) /* InitGeneratedObjects */
     , (50258,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (50258,  96,        500) /* EncumbranceCapacity */
     , (50258, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50258,   1, True ) /* Stuck */
     , (50258,   2, False) /* Open */
     , (50258,  12, True ) /* ReportCollisions */
     , (50258,  13, True ) /* Ethereal */
     , (50258,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50258,  41,     600) /* RegenerationInterval */
     , (50258,  43,       1) /* GeneratorRadius */
     , (50258,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50258,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50258,   1, 0x0200088A) /* Setup */
     , (50258,   3, 0x20000014) /* SoundTable */
     , (50258,   8, 0x06001070) /* Icon */
     , (50258,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50258, -1, 411, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T3_RunedChest(T3) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
