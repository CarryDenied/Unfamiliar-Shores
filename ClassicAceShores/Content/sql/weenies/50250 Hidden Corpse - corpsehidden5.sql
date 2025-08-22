DELETE FROM `weenie` WHERE `class_Id` = 50250;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50250, 'corpsehidden5', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50250,   1,        512) /* ItemType - Container */
     , (50250,   5,       3000) /* EncumbranceVal */
     , (50250,   6,         -1) /* ItemsCapacity */
     , (50250,   7,         -1) /* ContainersCapacity */
     , (50250,   8,        130) /* Mass */
     , (50250,  16,         48) /* ItemUseable - ViewedRemote */
     , (50250,  19,          0) /* Value */
     , (50250,  81,          3) /* MaxGeneratedObjects */
     , (50250,  82,          3) /* InitGeneratedObjects */
     , (50250,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50250,  96,        500) /* EncumbranceCapacity */
     , (50250, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50250,   1, True ) /* Stuck */
     , (50250,   2, False) /* Open */
     , (50250,  12, False) /* ReportCollisions */
     , (50250,  13, True ) /* Ethereal */
     , (50250,  14, True ) /* GravityStatus */
     , (50250,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50250,  41,     600) /* RegenerationInterval */
     , (50250,  43,       1) /* GeneratorRadius */
     , (50250,  54,       1) /* UseRadius */
     , (50250,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50250,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50250,   1, 0x02000889) /* Setup */
     , (50250,   3, 0x20000014) /* SoundTable */
     , (50250,   8, 0x06001070) /* Icon */
     , (50250,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50250, -1, 452, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T5_General(T5) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
