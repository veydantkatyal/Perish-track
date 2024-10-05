DELIMITER $$

-- Trigger to Move Expired Goods to Waste
CREATE TRIGGER MoveToWaste
AFTER UPDATE ON Goods
FOR EACH ROW
BEGIN
    IF NEW.Expiration_Date < CURRENT_DATE AND NEW.Quantity > 0 THEN
        -- Move expired goods to Waste table
        INSERT INTO Waste (Goods_ID, Quantity_Wasted)
        VALUES (NEW.Goods_ID, NEW.Quantity);

        -- Set the Quantity to 0
        UPDATE Goods SET Quantity = 0 WHERE Goods_ID = NEW.Goods_ID;

        -- Log the expiration
        INSERT INTO Error_Log (ErrorMessage)
        VALUES (CONCAT('Moved ', NEW.Quantity, ' units of Goods ID: ', NEW.Goods_ID, ' to Waste'));
    END IF;
END$$

DELIMITER ;
