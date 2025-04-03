DELETE FROM `weenie` WHERE `class_Id` = 50248;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50248, 'corpsehidden3', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50248,   1,        512) /* ItemType - Container */
     , (50248,   5,       3000) /* EncumbranceVal */
     , (50248,   6,         -1) /* ItemsCapacity */
     , (50248,   7,         -1) /* ContainersCapacity */
     , (50248,   8,        130) /* Mass */
     , (50248,  16,         48) /* ItemUseable - ViewedRemote */
     , (50248,  19,          0) /* Value */
     , (50248,  81,          3) /* MaxGeneratedObjects */
     , (50248,  82,          3) /* InitGeneratedObjects */
     , (50248,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50248,  96,        500) /* EncumbranceCapacity */
     , (50248, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50248,   1, True ) /* Stuck */
     , (50248,   2, False) /* Open */
     , (50248,  12, False) /* ReportCollisions */
     , (50248,  13, True ) /* Ethereal */
     , (50248,  14, True ) /* GravityStatus */
     , (50248,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50248,  41,     600) /* RegenerationInterval */
     , (50248,  43,       1) /* GeneratorRadius */
     , (50248,  54,       1) /* UseRadius */
     , (50248,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50248,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50248,   1, 0x02000889) /* Setup */
     , (50248,   3, 0x20000014) /* SoundTable */
     , (50248,   8, 0x06001070) /* Icon */
     , (50248,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50248, -1, 450, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T3_General(T3) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
