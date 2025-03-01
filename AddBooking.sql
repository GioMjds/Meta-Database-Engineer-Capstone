CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN BookingDate DATE)
BEGIN
    INSERT INTO Booking (BookingID, CustomerID, TableNumber, BookingDate)
    VALUES (BookingID, CustomerID, TableNumber, BookingDate);
END;