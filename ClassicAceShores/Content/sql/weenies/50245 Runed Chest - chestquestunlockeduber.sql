DELETE FROM `weenie` WHERE `class_Id` = 50245;

INSERT INTO `weenie` (`class_Id`, `class_Name`, `type`, `last_Modified`)
VALUES (50245, 'chestquestunlockeduber', 20, '2005-02-09 10:00:00') /* Chest */;

INSERT INTO `weenie_properties_int` (`object_Id`, `type`, `value`)
VALUES (50245,   1,        512) /* ItemType - Container */
     , (50245,   5,       9000) /* EncumbranceVal */
     , (50245,   6,         -1) /* ItemsCapacity */
     , (50245,   7,         -1) /* ContainersCapacity */
     , (50245,   8,       3000) /* Mass */
     , (50245,  16,         48) /* ItemUseable - ViewedRemote */
     , (50245,  19,       2500) /* Value */
     , (50245,  81,          1) /* MaxGeneratedObjects */
     , (50245,  82,          1) /* InitGeneratedObjects */
     , (50245,  83,          2) /* ActivationResponse - Use */
     , (50245,  93,       1048) /* PhysicsState - ReportCollisions, IgnoreCollisions, Gravity */
     , (50245, 100,          1) /* GeneratorType - Relative */;

INSERT INTO `weenie_properties_bool` (`object_Id`, `type`, `value`)
VALUES (50245,   1, True ) /* Stuck */
     , (50245,   2, False) /* Open */
     , (50245,  12, True ) /* ReportCollisions */
     , (50245,  13, False) /* Ethereal */
     , (50245,  33, False) /* ResetMessagePending */
     , (50245,  34, False) /* DefaultOpen */;

INSERT INTO `weenie_properties_float` (`object_Id`, `type`, `value`)
VALUES (50245,  41,    3600) /* RegenerationInterval */
     , (50245,  43,       1) /* GeneratorRadius */
     , (50245,  54,       1) /* UseRadius */;

INSERT INTO `weenie_properties_string` (`object_Id`, `type`, `value`)
VALUES (50245,   1, 'Runed Chest') /* Name */
     , (50245,  14, 'Use this item to open it and see its contents.') /* Use */
     , (50245,  16, 'A heavy iron chest. There are strange runes carved around the lid.') /* LongDesc */;

INSERT INTO `weenie_properties_d_i_d` (`object_Id`, `type`, `value`)
VALUES (50245,   1, 0x02000E4F) /* Setup */
     , (50245,   2, 0x09000004) /* MotionTable */
     , (50245,   3, 0x20000021) /* SoundTable */
     , (50245,   8, 0x06001020) /* Icon */
     , (50245,  22, 0x3400002B) /* PhysicsEffectTable */;

INSERT INTO `weenie_properties_generator` (`object_Id`, `probability`, `weenie_Class_Id`, `delay`, `init_Create`, `max_Create`, `when_Create`, `where_Create`, `stack_Size`, `palette_Id`, `shade`, `obj_Cell_Id`, `origin_X`, `origin_Y`, `origin_Z`, `angles_W`, `angles_X`, `angles_Y`, `angles_Z`)
VALUES (50245, -1, 1006, 0, 1, 1, 2, 72, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0) /* Generate DeathTreasureType: T6_RunedChest(T6) - (x1 up to max of 1) - Regenerate upon PickUp - Location to (re)Generate: ContainTreasure */;
