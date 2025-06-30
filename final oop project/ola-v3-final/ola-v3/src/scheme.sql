-- Create the Users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('Rider', 'Driver', 'Admin') NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Vehicles table
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT,
    vehicle_type ENUM('Car', 'Bike', 'Auto') NOT NULL,
    model VARCHAR(100) NOT NULL,
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    status ENUM('Available', 'Unavailable') DEFAULT 'Available',
    FOREIGN KEY (driver_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Create the Trips table
CREATE TABLE trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    rider_id INT,
    driver_id INT,
    pickup_location VARCHAR(255) NOT NULL,
    destination_location VARCHAR(255) NOT NULL,
    vehicle_id INT,
    vehicle_type VARCHAR(255),
    fare DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rider_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE CASCADE
);

-- Create the Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash') NOT NULL,
    payment_status ENUM('Paid', 'Pending') DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trip_id) REFERENCES trips(trip_id) ON DELETE CASCADE
);

-- Insert sample users
INSERT INTO users (name, email, password, role, phone) VALUES
('John Doe', 'john.rider@example.com', 'rider123', 'Rider', '123-456-7890'),
('Jane Smith', 'jane.driver@example.com', 'driver123', 'Driver', '321-654-0987'),
('Admin User', 'admin@example.com', 'admin123', 'Admin', '999-888-7777');

-- Insert sample vehicles
INSERT INTO vehicles (driver_id, vehicle_type, model, registration_number, status) VALUES
(2, 'Car', 'Toyota Prius', 'ABC-1234', 'Available'),
(2, 'Bike', 'Yamaha R15', 'XYZ-5678', 'Available');

-- Insert sample trips
INSERT INTO trips (rider_id, driver_id, pickup_location, destination_location, vehicle_id, vehicle_type, fare, status) VALUES
(1, 2, 'Main Street', 'Central Park', 1, 'Car',20.50, 'Completed'),
(1, 2, 'Elm Street', 'Downtown Plaza', 2, 'Bike',10.00, 'Pending'),
(1, 3, 'Elm Street', 'Downtown Plaza', 2, 'Auto',10.00, 'Pending'),
(1, 4, 'Elm Street', 'Downtown Plaza', 2, 'Car',10.00, 'Pending');

-- Insert sample payments
INSERT INTO payments (trip_id, amount, payment_method, payment_status) VALUES
(1, 20.50, 'Credit Card', 'Paid'),
(2, 10.00, 'Cash', 'Pending');