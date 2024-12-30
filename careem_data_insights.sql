CREATE TABLE Careem (
    date DATE,
    time TIME,
    booking_id VARCHAR(20),
    booking_status VARCHAR(50),
    customer_id INT,
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(255),
    drop_location VARCHAR(255),
    avg_vtat DECIMAL(5, 2),
    avg_ctat DECIMAL(5, 2),
    cancelled_by_customer_reason VARCHAR(255),
    cancelled_by_driver_reason VARCHAR(255),
    incomplete_rides_reason VARCHAR(255),
    booking_value DECIMAL(10, 2),
    ride_distance DECIMAL(5, 2),
    driver_ratings DECIMAL(3, 2),
    customer_rating DECIMAL(3, 2)
);

SELECT * FROM Careem;

-- SQL Questions:

-- Q1: Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT *
FROM Careem
WHERE booking_status = 'Success';

-- Answer:
SELECT * FROM Successful_Bookings;

-- Q2: Find the average ride distance for each vehicle type:
CREATE VIEW Avg_Ride_Distance_By_Vehicle AS
SELECT 
    vehicle_type,
    AVG(ride_distance) AS avg_ride_distance
FROM Careem
GROUP BY vehicle_type;

-- Answer:
SELECT * FROM Avg_Ride_Distance_By_Vehicle;

-- Q3: Get the total number of rides cancelled by customers:
CREATE VIEW Cancelled_Rides_By_Customers AS
SELECT 
    COUNT(*) AS total_cancelled_rides
FROM Careem
WHERE booking_status = 'Cancelled by Customer';

-- Answer:
SELECT * FROM Cancelled_Rides_By_Customers;

-- Q4: List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT s
    customer_id,
    COUNT(booking_id) AS total_rides
FROM Careem
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- Answer:
SELECT * FROM Top_5_Customers;

-- Q5: Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Cancelled_By_Drivers_Personal_Car_Issues AS
SELECT 
    COUNT(*) AS total_rides_cancelled
FROM Careem
WHERE cancelled_by_driver_reason = 'Personal & Car related issues';

-- Answer:
SELECT * FROM Rides_Cancelled_By_Drivers_Personal_Car_Issues;

-- Q6: Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Ratings_Prime_Sedan AS
SELECT 
    MAX(driver_ratings) AS max_driver_rating,
    MIN(driver_ratings) AS min_driver_rating
FROM Careem
WHERE vehicle_type = 'Prime Sedan';

-- Answer:
SELECT * FROM Max_Min_Driver_Ratings_Prime_Sedan;

-- Q7: Retrieve all rides where payment was made using cash:
CREATE VIEW Rides_Using_Cash AS
SELECT *
FROM Careem
WHERE payment_method = 'Cash';

-- Answer:
SELECT * FROM Rides_Using_Cash;

-- Q8: Find the average customer rating per vehicle type:
CREATE VIEW Avg_Customer_Rating_By_Vehicle_Type AS
SELECT
    vehicle_type,
    AVG(customer_rating) AS avg_customer_rating
FROM Careem
GROUP BY vehicle_type;

-- Answer:
SELECT * FROM Avg_Customer_Rating_By_Vehicle_Type;

-- Q9: Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_Booking_Value_Successful_Rides AS
SELECT
    SUM(booking_value) AS total_successful_value
FROM Careem
WHERE booking_status = 'Success';

-- Answer:
SELECT * FROM Total_Booking_Value_Successful_Rides;

-- Q10: List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_With_Reason AS
SELECT
    booking_id,
    incomplete_rides_reason
FROM Careem
WHERE booking_status = 'Incomplete';

-- Answer:
SELECT * FROM Incomplete_Rides_With_Reason;
