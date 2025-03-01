CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
    DELETE FROM Booking
    WHERE BookingID = BookingID;
END;