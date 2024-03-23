-- Trigger to add an entry to the log every time data is inserted into the Reservation Table
DELIMITER //
CREATE TRIGGER reservation_insert_trigger
AFTER INSERT ON `restaurant_reservation`.`Reservation Table`
FOR EACH ROW
BEGIN
    INSERT INTO reservation_log (event_type, event_description, event_timestamp)
    VALUES ('Insert', CONCAT('New reservation added - ID: ', NEW.id_reservation), NOW());
END//
DELIMITER ;

-- Trigger to update the table status to 'occupied' when a new reservation is made
DELIMITER //
CREATE TRIGGER update_table_status_trigger
AFTER INSERT ON `restaurant_reservation`.`Reservation Table`
FOR EACH ROW
BEGIN
    UPDATE `restaurant_reservation`.`Table`
    SET `table_status` = 'occupied'
    WHERE `idTable` = NEW.id_table;
END//
DELIMITER ;

-- Trigger to decrement table capacity when a new reservation is made
DELIMITER //
CREATE TRIGGER update_table_capacity_trigger
AFTER INSERT ON `restaurant_reservation`.`Reservation Table`
FOR EACH ROW
BEGIN
    UPDATE `restaurant_reservation`.`Table`
    SET `table_capacity` = `table_capacity` - 1
    WHERE `idTable` = NEW.id_table;
END//
DELIMITER ;
