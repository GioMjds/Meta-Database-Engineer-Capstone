CREATE PROCEDURE CancelOrder (IN OrderID INT)
DELETE FROM Orders;