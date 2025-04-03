DELETE FROM `weenie` WHERE `class_Id` = 50251;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50251, 'corpsehidden6', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50251,   1,        512) /* ItemType - Container */
     , (50251,   5,       3000) /* EncumbranceVal */
     , (50251,   6,         -1) /* ItemsCapacity */
     , (50251,   7,         -1) /* ContainersCapacity */
     , (50251,   8,        130) /* Mass */
     , (50251,  16,         48) /* ItemUseable - ViewedRemote */
     , (50251,  19,          0) /* Value */
     , (50251,  81,          3) /* MaxGeneratedObjects */
     , (50251,  82,          3) /* InitGeneratedObjects */
     , (50251,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50251,  96,        500) /* EncumbranceCapacity */
     , (50251, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50251,   1, True ) /* Stuck */
     , (50251,   2, False) /* Open */
     , (50251,  12, False) /* ReportCollisions */
     , (50251,  13, True ) /* Ethereal */
     , (50251,  14, True ) /* GravityStatus */
     , (50251,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50251,  41,     600) /* RegenerationInterval */
     , (50251,  43,       1) /* GeneratorRadius */
     , (50251,  54,       1) /* UseRadius */
     , (50251,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50251,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50251,   1, 0x02000889) /* Setup */
     , (50251,   3, 0x20000014) /* SoundTable */
     , (50251,   8, 0x06001070) /* Icon */
     , (50251,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50251, -1, 449, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_General(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
