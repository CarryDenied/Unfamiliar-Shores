DELETE FROM `weenie` WHERE `class_Id` = 50241;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50241, 'rottingcorpseextreme', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50241,   1,        512) /* ItemType - Container */
     , (50241,   5,       3000) /* EncumbranceVal */
     , (50241,   6,         -1) /* ItemsCapacity */
     , (50241,   7,         -1) /* ContainersCapacity */
     , (50241,   8,        130) /* Mass */
     , (50241,  16,         48) /* ItemUseable - ViewedRemote */
     , (50241,  19,          0) /* Value */
     , (50241,  81,          1) /* MaxGeneratedObjects */
     , (50241,  82,          1) /* InitGeneratedObjects */
     , (50241,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (50241,  96,        500) /* EncumbranceCapacity */
     , (50241, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50241,   1, True ) /* Stuck */
     , (50241,   2, False) /* Open */
     , (50241,  12, True ) /* ReportCollisions */
     , (50241,  13, True ) /* Ethereal */
     , (50241,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50241,  41,     600) /* RegenerationInterval */
     , (50241,  43,       1) /* GeneratorRadius */
     , (50241,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50241,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50241,   1, 0x02000889) /* Setup */
     , (50241,   3, 0x20000014) /* SoundTable */
     , (50241,   8, 0x06001070) /* Icon */
     , (50241,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50241, -1, 452, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_General(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
