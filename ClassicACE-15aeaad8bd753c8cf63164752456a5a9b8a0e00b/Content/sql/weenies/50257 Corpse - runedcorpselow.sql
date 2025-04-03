DELETE FROM `weenie` WHERE `class_Id` = 50257;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50257, 'runedcorpselow', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50257,   1,        512) /* ItemType - Container */
     , (50257,   5,       3000) /* EncumbranceVal */
     , (50257,   6,         -1) /* ItemsCapacity */
     , (50257,   7,         -1) /* ContainersCapacity */
     , (50257,   8,        130) /* Mass */
     , (50257,  16,         48) /* ItemUseable - ViewedRemote */
     , (50257,  19,          0) /* Value */
     , (50257,  81,          1) /* MaxGeneratedObjects */
     , (50257,  82,          1) /* InitGeneratedObjects */
     , (50257,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (50257,  96,        500) /* EncumbranceCapacity */
     , (50257, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50257,   1, True ) /* Stuck */
     , (50257,   2, False) /* Open */
     , (50257,  12, True ) /* ReportCollisions */
     , (50257,  13, True ) /* Ethereal */
     , (50257,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50257,  41,     600) /* RegenerationInterval */
     , (50257,  43,       1) /* GeneratorRadius */
     , (50257,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50257,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50257,   1, 0x02000889) /* Setup */
     , (50257,   3, 0x20000014) /* SoundTable */
     , (50257,   8, 0x06001070) /* Icon */
     , (50257,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50257, -1, 410, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T2_RunedChest(T2) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
