DELIMITER $$

-- Reorder Goods when Quantity is Low
CREATE PROCEDURE ReorderGoods()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE gID INT;
    DECLARE cur CURSOR FOR SELECT Goods_ID FROM Goods WHERE Quantity < 50;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO gID;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Log the reordering process
        UPDATE Goods SET Quantity = Quantity + 100 WHERE Goods_ID = gID;

        INSERT INTO Error_Log (ErrorMessage)
        VALUES (CONCAT('Reordered 100 units of Goods ID: ', gID));
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;
