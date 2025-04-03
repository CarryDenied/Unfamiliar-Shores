DELETE FROM `weenie` WHERE `class_Id` = 50247;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50247, 'corpsehidden2', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50247,   1,        512) /* ItemType - Container */
     , (50247,   5,       3000) /* EncumbranceVal */
     , (50247,   6,         -1) /* ItemsCapacity */
     , (50247,   7,         -1) /* ContainersCapacity */
     , (50247,   8,        130) /* Mass */
     , (50247,  16,         48) /* ItemUseable - ViewedRemote */
     , (50247,  19,          0) /* Value */
     , (50247,  81,          3) /* MaxGeneratedObjects */
     , (50247,  82,          3) /* InitGeneratedObjects */
     , (50247,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50247,  96,        500) /* EncumbranceCapacity */
     , (50247, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50247,   1, True ) /* Stuck */
     , (50247,   2, False) /* Open */
     , (50247,  12, False) /* ReportCollisions */
     , (50247,  13, True ) /* Ethereal */
     , (50247,  14, True ) /* GravityStatus */
     , (50247,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50247,  41,     600) /* RegenerationInterval */
     , (50247,  43,       1) /* GeneratorRadius */
     , (50247,  54,       1) /* UseRadius */
     , (50247,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50247,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50247,   1, 0x02000889) /* Setup */
     , (50247,   3, 0x20000014) /* SoundTable */
     , (50247,   8, 0x06001070) /* Icon */
     , (50247,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50247, -1, 451, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T2_General(T2) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
