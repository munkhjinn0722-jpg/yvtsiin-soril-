CREATE DATABASE hotel_db;
USE hotel_db;

CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('Single', 'Double', 'Suite') NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL
);


CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


INSERT INTO guests (first_name, last_name, email) VALUES 
('Bat', 'Bold', 'bat@example.com'),
('Saraa', 'Gua', 'saraa@example.com'),
('Tumur', 'Bagana', 'tumur@example.com');

INSERT INTO rooms (room_number, room_type, price_per_night) VALUES 
('101', 'Single', 50000),
('202', 'Double', 80000),
('303', 'Suite', 150000);

INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date) VALUES 
(1, 1, '2024-03-01', '2024-03-03'),
(2, 2, '2024-03-05', '2024-03-07'),
(1, 3, '2024-03-10', '2024-03-12');

INSERT INTO payments (booking_id, amount) VALUES (1, 100000), (2, 160000), (3, 300000);


SELECT g.first_name, g.last_name, r.room_number, b.check_in_date 
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;


SELECT r.room_number, COUNT(b.booking_id) as booking_count
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_number;


SELECT room_id, COUNT(*) as count 
FROM bookings 
GROUP BY room_id 
ORDER BY count DESC 
LIMIT 1;

SELECT g.first_name, g.last_name, COUNT(b.booking_id) as total_bookings
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.guest_id
HAVING total_bookings >= 2;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPassword123!';
GRANT ALL PRIVILEGES ON hotel_db.* TO 'admin_user'@'localhost';

CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'ReportPassword123!';
GRANT SELECT ON hotel_db.* TO 'report_user'@'localhost';

SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'report_user'@'localhost';