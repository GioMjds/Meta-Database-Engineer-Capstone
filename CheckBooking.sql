CREATE PROCEDURE CheckBooking (IN BookingDate DATE, IN TableNumber INT)
SELECT BookingDate, TableNumber
WHERE EXISTS (SELECT * FROM Booking WHERE Date = BookingDate AND TableNumber = TableNumber);