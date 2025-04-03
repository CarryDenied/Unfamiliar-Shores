DELETE FROM `weenie` WHERE `class_Id` = 50259;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50259, 'runedcorpsehigh', 21, '2005-02-09 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50259,   1,        512) /* ItemType - Container */
     , (50259,   5,       3000) /* EncumbranceVal */
     , (50259,   6,         -1) /* ItemsCapacity */
     , (50259,   7,         -1) /* ContainersCapacity */
     , (50259,   8,        130) /* Mass */
     , (50259,  16,         48) /* ItemUseable - ViewedRemote */
     , (50259,  19,          0) /* Value */
     , (50259,  81,          1) /* MaxGeneratedObjects */
     , (50259,  82,          1) /* InitGeneratedObjects */
     , (50259,  93,       1052) /* PhysicsState - Ethereal, ReportCollisions, IgnoreCollisions, Gravity */
     , (50259,  96,        500) /* EncumbranceCapacity */
     , (50259, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50259,   1, True ) /* Stuck */
     , (50259,   2, False) /* Open */
     , (50259,  12, True ) /* ReportCollisions */
     , (50259,  13, True ) /* Ethereal */
     , (50259,  14, True ) /* GravityStatus */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50259,  41,     600) /* RegenerationInterval */
     , (50259,  43,       1) /* GeneratorRadius */
     , (50259,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50259,   1, 'Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50259,   1, 0x0200088B) /* Setup */
     , (50259,   3, 0x20000014) /* SoundTable */
     , (50259,   8, 0x06001070) /* Icon */
     , (50259,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50259, -1, 412, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T4_RunedChest(T4) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
