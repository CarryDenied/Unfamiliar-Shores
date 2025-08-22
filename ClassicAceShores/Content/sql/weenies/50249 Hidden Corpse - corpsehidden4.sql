DELETE FROM `weenie` WHERE `class_Id` = 50249;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50249, 'corpsehidden4', 21, '2023-01-19 10:00:00') /* Container */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50249,   1,        512) /* ItemType - Container */
     , (50249,   5,       3000) /* EncumbranceVal */
     , (50249,   6,         -1) /* ItemsCapacity */
     , (50249,   7,         -1) /* ContainersCapacity */
     , (50249,   8,        130) /* Mass */
     , (50249,  16,         48) /* ItemUseable - ViewedRemote */
     , (50249,  19,          0) /* Value */
     , (50249,  81,          3) /* MaxGeneratedObjects */
     , (50249,  82,          3) /* InitGeneratedObjects */
     , (50249,  93,       1044) /* PhysicsState - Ethereal, IgnoreCollisions, Gravity */
     , (50249,  96,        500) /* EncumbranceCapacity */
     , (50249, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50249,   1, True ) /* Stuck */
     , (50249,   2, False) /* Open */
     , (50249,  12, False) /* ReportCollisions */
     , (50249,  13, True ) /* Ethereal */
     , (50249,  14, True ) /* GravityStatus */
     , (50249,  18, True ) /* Visibility */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50249,  41,     600) /* RegenerationInterval */
     , (50249,  43,       1) /* GeneratorRadius */
     , (50249,  54,       1) /* UseRadius */
     , (50249,  76,     0.5) /* Translucency */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50249,   1, 'Hidden Corpse') /* Name */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50249,   1, 0x02000889) /* Setup */
     , (50249,   3, 0x20000014) /* SoundTable */
     , (50249,   8, 0x06001070) /* Icon */
     , (50249,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50249, -1, 448, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T4_General(T4) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
