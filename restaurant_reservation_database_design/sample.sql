-- Insert data into Menu Table
INSERT INTO `restaurant_reservation`.`Menu Table` (`id_menu`, `menu_name`, `description`, `price`) 
VALUES (1, 'Satay', 'These tasty meat skewers cook up over coals so hot they need fans to waft the smoke away.', 40.55),
       (2, 'Bakso', 'The meatballs – springy or rubbery, the size of golf balls or bigger – are made from chicken, beef, pork or some amorphous combination of them all.', 35.79),
       (3, 'Soto', 'This traditional meat soup comprises a broth and ingredients that vary across the archipelago.', 45.96),
       (4, 'Nasi goreng', 'Considered Indonesia’s national dish, this take on Asian fried rice is often made with sweet, thick soy sauce called kecap (pronounced ketchup) and garnished with acar, pickled cucumber and carrots. ', 25.79),
       (5, 'Gado-gado', 'Literally “mix-mix,” the term gado-gado is often used to describe situations that are all mixed up – Jakarta, for instance, is a gado-gado city..', 32.96),
       (6, 'Nasi uduk', 'A perennial favorite among native Betawi, nasi uduk is rice cooked in coconut milk and includes a pinwheel of various meat and vegetable accoutrements. ', 19.96),
       (7, 'Nasi padang', 'Nasi padang is a meal with steamed rice accompanied by more than a dozen dishes – goopy curries with floating fish heads or rubbery cow’s feet – stacked up on the table.', 27.79);

-- Insert data into Table
INSERT INTO `restaurant_reservation`.`Table` (`idTable`, `table_number`, `table_capacity`, `table_status`) 
VALUES (1, 25, 4, 'available'),
       (2, 26, 2, 'reserved'),
       (3, 27, 6, 'occupied'),
       (4, 28, 4, 'available'),
       (5, 29, 2, 'reserved'),
       (7, 30, 6, 'occupied'),
       (8, 31, 4, 'available'),
       (9, 32, 2, 'reserved'),
       (10, 33, 6, 'occupied');

-- Insert data into Customer Table
INSERT INTO `restaurant_reservation`.`Customer Table` (`idCustomer`, `customer_name`, `phone_number`, `address`) 
VALUES  (1, 'Budi Setiawan', '0812-3456-7890', 'Jl. Merdeka No. 123'),
		(2, 'Anita Permata', '0813-4567-8901', 'Jl. Pahlawan No. 456'),
		(3, 'Cahya Nugraha', '0814-5678-9012', 'Jl. Kusuma No. 789'),
		(4, 'Dewi Anggraeni', '0815-6789-0123', 'Jl. Maju No. 234'),
		(5, 'Eko Prasetyo', '0816-7890-1234', 'Jl. Damai No. 567'),
		(6, 'Fitri Indah', '0817-8901-2345', 'Jl. Bahagia No. 678'),
		(7, 'Gatot Subroto', '0818-9012-3456', 'Jl. Mandiri No. 789'),
		(8, 'Hani Rahayu', '0819-0123-4567', 'Jl. Sejahtera No. 890'),
		(9, 'Iwan Santoso', '0820-1234-5678', 'Jl. Berkah No. 123'),
		(10, 'Jihan Pradipta', '0821-2345-6789', 'Jl. Cemerlang No. 456'),
		(11, 'Kusuma Wardhani', '0822-3456-7890', 'Jl. Harmoni No. 789'),
		(12, 'Lukman Hakim', '0823-4567-8901', 'Jl. Rukun No. 234'),
		(13, 'Mira Susanti', '0824-5678-9012', 'Jl. Damai No. 567'),
		(14, 'Nanda Pratama', '0825-6789-0123', 'Jl. Indah No. 890'),
		(15, 'Oscar Simanjuntak', '0826-7890-1234', 'Jl. Ceria No. 123');

-- Insert data into Reservation Table
INSERT INTO `restaurant_reservation`.`Reservation Table` (`id_reservation`, `id_customer`, `id_table`, `reservation_date`, `reservation_status`) 
VALUES (1, 1, 2, '2024-03-10 18:00:00', 'reserved'),
		(2, 2, 1, '2024-03-11 19:30:00', 'prepared'),
		(3, 3, 3, '2024-03-12 20:15:00', 'completed'),
		(4, 4, 2, '2024-03-13 17:45:00', 'reserved'),
		(5, 5, 1, '2024-03-14 18:30:00', 'prepared'),
		(6, 6, 3, '2024-03-15 21:00:00', 'completed'),
		(7, 7, 1, '2024-03-16 19:45:00', 'reserved'),
		(8, 8, 2, '2024-03-17 18:15:00', 'prepared'),
		(9, 9, 3, '2024-03-18 20:30:00', 'completed'),
		(10, 10, 1, '2024-03-19 17:00:00', 'reserved'),
		(11, 11, 2, '2024-03-20 18:45:00', 'prepared'),
		(12, 12, 3, '2024-03-21 19:15:00', 'completed'),
		(13, 13, 1, '2024-03-22 20:00:00', 'reserved'),
		(14, 14, 2, '2024-03-23 21:30:00', 'prepared'),
		(15, 15, 3, '2024-03-24 17:30:00', 'completed');

-- Insert data into Order Detail Table
INSERT INTO `restaurant_reservation`.`Order Detail Table` (`id_order_detail`, `id_reservation`, `id_menu`, `quantity`, `unit_price`, `subtotal`) 
VALUES 
    (1, 1, 1, 2, 40.55, 81.10),
    (2, 1, 3, 1, 45.96, 45.96),
    (3, 2, 2, 3, 35.79, 107.37),
    (4, 3, 4, 2, 25.79, 51.58),
    (5, 4, 5, 1, 32.96, 32.96),
    (6, 5, 1, 2, 40.55, 81.10),
    (7, 6, 3, 1, 45.96, 45.96),
    (8, 7, 2, 3, 35.79, 107.37),
    (9, 8, 4, 2, 25.79, 51.58),
    (10, 9, 5, 1, 32.96, 32.96),
    (11, 10, 1, 2, 40.55, 81.10),
    (12, 11, 3, 1, 45.96, 45.96),
    (13, 12, 2, 3, 35.79, 107.37),
    (14, 13, 4, 2, 25.79, 51.58),
    (15, 14, 5, 1, 32.96, 32.96);

-- Insert data into Employee Table
INSERT INTO `restaurant_reservation`.`Employee Table` (`id_employee`, `employee_name`, `position`) 
VALUES (1, 'Iwan Santoso', 'Waiter'),
    (2, 'Budi Setiawan', 'Chef'),
    (3, 'Cahya Nugraha', 'Cashier'),
    (4, 'Dewi Anggraeni', 'Server'),
    (5, 'Eko Prasetyo', 'Waiter'),
    (6, 'Fitri Indah', 'Chef'),
    (7, 'Gatot Subroto', 'Cashier'),
    (8, 'Hani Rahayu', 'Server');
