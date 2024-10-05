-- Unit Test for ReorderGoods Procedure
-- Expected: Adds 100 units to the quantity of goods with less than 50 units in stock

-- Before calling the procedure
SELECT Goods_ID, Quantity FROM Goods WHERE Goods_ID = 1;

-- Call the ReorderGoods procedure
CALL ReorderGoods();

-- After calling the procedure, the quantity should have increased by 100 units
SELECT Goods_ID, Quantity FROM Goods WHERE Goods_ID = 1;

-- The output should show that 100 units have been added

-- Unit Test for Trigger MoveToWaste
-- Expected: Goods with expired dates should be moved to the Waste table, and their quantity should be set to 0

-- Before updating the goods to be expired
SELECT Goods_ID, Quantity FROM Goods WHERE Goods_ID = 2;

-- Update the Expiration_Date of the goods to simulate expiration
UPDATE Goods SET Expiration_Date = '2023-01-01' WHERE Goods_ID = 2;

-- After the update, the trigger should move the goods to the Waste table and set the quantity to 0
SELECT Goods_ID, Quantity FROM Goods WHERE Goods_ID = 2;
SELECT Goods_ID, Quantity_Wasted FROM Waste WHERE Goods_ID = 2;

-- The output should show that the goods have been moved to the Waste table, and their quantity is set to 0.
