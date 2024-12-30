# Careem Data Analysis with SQL

This project includes SQL queries to analyze Careem booking data. The queries focus on retrieving insights such as successful bookings, average ride distances, top customers, and more.

## Table Schema
The `careem` table includes the following columns:
- `Date` (DATE): Booking date.
- `Time` (TIME): Booking time.
- `Booking_ID` (VARCHAR): Unique ID for each booking.
- `Booking_Status` (VARCHAR): Status of the booking (e.g., Success, Cancelled).
- `Customer_ID` (INT): Unique ID for customers.
- `Vehicle_Type` (VARCHAR): Type of vehicle booked.
- `Pickup_Location` (VARCHAR): Starting point of the ride.
- `Drop_Location` (VARCHAR): Destination of the ride.
- `Avg_VTAT` (DECIMAL): Average vehicle turnaround time.
- `Avg_CTAT` (DECIMAL): Average customer turnaround time.
- `Cancelled_Rides_by_Customer_Reason` (VARCHAR): Reason for cancellation by customer.
- `Cancelled_Rides_by_Driver_Reason` (VARCHAR): Reason for cancellation by driver.
- `Incomplete_Rides_Reason` (VARCHAR): Reason for incomplete rides.
- `Booking_Value` (DECIMAL): Value of the booking.
- `Ride_Distance` (DECIMAL): Distance covered in the ride.
- `Driver_Ratings` (DECIMAL): Rating given by the driver.
- `Customer_Rating` (DECIMAL): Rating given by the customer.

## SQL Queries
### Q1: Retrieve all successful bookings
```sql
CREATE VIEW Successful_Booking AS
SELECT * FROM careem
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Booking;
```

