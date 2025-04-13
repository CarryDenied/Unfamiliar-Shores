DELETE FROM `treasure_death`
WHERE `treasure_Type` in (1000,1001,1002,1003,1004,1005);

INSERT INTO `treasure_death`(`treasure_Type`,`tier`,`loot_Quality_Mod`,`unknown_Chances`,`item_Chance`,`item_Min_Amount`,`item_Max_Amount`,`item_Treasure_Type_Selection_Chances`,`magic_Item_Chance`,`magic_Item_Min_Amount`,`magic_Item_Max_Amount`,`magic_Item_Treasure_Type_Selection_Chances`,`mundane_Item_Chance`,`mundane_Item_Min_Amount`,`mundane_Item_Max_Amount`,`mundane_Item_Type_Selection_Chances`,`last_Modified`) VALUES 
(1000,1,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:03'),
(1001,2,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:08'),
(1002,3,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:08'),
(1003,4,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:08'),
(1004,5,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:09'),
(1005,6,0.4,19,100,4,8,11,100,12,16,11,100,8,12,9,'2024-12-08 17:04:09');