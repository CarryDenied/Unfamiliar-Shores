DELETE FROM `weenie` WHERE `class_Id` = 50246;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50246, 'corpsehidden1', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50246,   1,        512) /* ItemType - Container */
     , (50246,   5,       3000) /* EncumbranceVal */
     , (50246,   6,         -1) /* ItemsCapacity */
     , (50246,   7,         -1) /* ContainersCapacity */
     , (50246,   8,        130) /* Mass */
     , (50246,  16,         48) /* ItemUseable - ViewedRemote */
     , (50246,  19,          0) /* Value */
     , (50246,  81,          3) /* MaxGeneratedObjects */
     , (50246,  82,          3) /* InitGeneratedObjects */
     , (50246,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50246,  96,        500) /* EncumbranceCapacity */
     , (50246, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50246,   1, True ) /* Stuck */
     , (50246,   2, False) /* Open */
     , (50246,  12, False) /* ReportCollisions */
     , (50246,  13, True ) /* Ethereal */
     , (50246,  14, True ) /* GravityStatus */
     , (50246,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50246,  41,     600) /* RegenerationInterval */
     , (50246,  43,       1) /* GeneratorRadius */
     , (50246,  54,       1) /* UseRadius */
     , (50246,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50246,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50246,   1, 0x02000889) /* Setup */
     , (50246,   3, 0x20000014) /* SoundTable */
     , (50246,   8, 0x06001070) /* Icon */
     , (50246,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50246, -1, 453, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T1_General(T1) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
