DELETE FROM `weenie` WHERE `class_Id` = 4381;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (4381, 'rottingcorpsemid', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (4381,   1,        512) /* ItemType - Container */
     , (4381,   5,       3000) /* EncumbranceVal */
     , (4381,   6,         -1) /* ItemsCapacity */
     , (4381,   7,         -1) /* ContainersCapacity */
     , (4381,   8,        130) /* Mass */
     , (4381,  16,         48) /* ItemUseable - ViewedRemote */
     , (4381,  19,          0) /* Value */
     , (4381,  81,          1) /* MaxGeneratedObjects */
     , (4381,  82,          1) /* InitGeneratedObjects */
     , (4381,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (4381,  96,        500) /* EncumbranceCapacity */
     , (4381, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (4381,   1, True ) /* Stuck */
     , (4381,   2, False) /* Open */
     , (4381,  12, True ) /* ReportCollisions */
     , (4381,  13, True ) /* Ethereal */
     , (4381,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (4381,  41,     600) /* RegenerationInterval */
     , (4381,  43,       1) /* GeneratorRadius */
     , (4381,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (4381,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (4381,   1, 0x0200088A) /* Setup */
     , (4381,   3, 0x20000014) /* SoundTable */
     , (4381,   8, 0x06001070) /* Icon */
     , (4381,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (4381, -1, 450, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T3_General(T3) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
