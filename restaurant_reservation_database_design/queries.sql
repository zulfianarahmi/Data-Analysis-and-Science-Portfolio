
use restaurant_reservation;

-- Fake Scenario:
-- In the "Foodie Delight" restaurant database, the tables include Menu Table, Table, Customer Table, Reservation Table, Order Detail Table, and Employee Table. The structure of each table includes various columns to store information about menus, tables, customers, reservations, order details, and employees.

-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- Display a list of all menu items priced below Rp50,000.
SELECT * FROM `Menu Table`
WHERE `price` < 50000;

-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- How many tables are currently available for reservation?
SELECT COUNT(*) FROM `Table` WHERE `table_status` = 'available';


-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- Who is the customer with the highest number of reservations?
SELECT `customer_name`, COUNT(`id_reservation`) AS `reservation_count`
FROM `Customer Table`
JOIN `Reservation Table` ON `Customer Table`.`idCustomer` = `Reservation Table`.`id_customer`
GROUP BY `customer_name`
ORDER BY `reservation_count` DESC
LIMIT 1;


-- -----------------------------------------------------
-- Question: xxx
-- -----------------------------------------------------
-- Show a list of menu items that have been ordered along with the total quantity ordered for each menu.
SELECT `menu_name`, SUM(`quantity`) AS `total_quantity_ordered`
FROM `Menu Table`
JOIN `Order Detail Table` ON `Menu Table`.`id_menu` = `Order Detail Table`.`id_menu`
GROUP BY `menu_name`;


-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- Which tables are currently empty and available for immediate reservation?
SELECT * FROM `Table` WHERE `table_status` = 'available' AND `idTable` NOT IN (SELECT DISTINCT `id_table` FROM `Reservation Table`);

-- -----------------------------------------------------
-- Question: xxxx
-- -----------------------------------------------------
-- What is the total revenue generated from completed reservations this month?
SELECT SUM(`subtotal`) AS `total_revenue`
FROM `Order Detail Table`
JOIN `Reservation Table` ON `Order Detail Table`.`id_reservation` = `Reservation Table`.`id_reservation`
WHERE `reservation_status` = 'completed'
AND MONTH(`reservation_date`) = MONTH(CURRENT_DATE());


-- -----------------------------------------------------
-- Question: xxx
-- -----------------------------------------------------
-- Display a list of the most frequently ordered menu items.
SELECT `menu_name`, COUNT(`id_order_detail`) AS `order_count`
FROM `Menu Table`
JOIN `Order Detail Table` ON `Menu Table`.`id_menu` = `Order Detail Table`.`id_menu`
GROUP BY `menu_name`
ORDER BY `order_count` DESC;


-- -----------------------------------------------------
-- Question: xxx
-- -----------------------------------------------------
-- Who are the customers that have never made a reservation?
SELECT `customer_name`
FROM `Customer Table`
LEFT JOIN `Reservation Table` ON `Customer Table`.`idCustomer` = `Reservation Table`.`id_customer`
WHERE `id_reservation` IS NULL;


-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- List the menu items with prices above the average.
SELECT * FROM `Menu Table` WHERE `price` > (SELECT AVG(`price`) FROM `Menu Table`);

-- -----------------------------------------------------
-- Question:
-- -----------------------------------------------------
-- Display a list of employees along with their positions.
SELECT * FROM `Employee Table`;
