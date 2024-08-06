 USE little_lemon_db;
  DROP PROCEDURE IF EXISTS UpdateBooking; 
 DELIMITER $$
 
CREATE PROCEDURE UpdateBooking(IN p_Booking_DetailsID INT, IN p_BookingDate DATE)
BEGIN
DECLARE Updatedbooking INT;

START TRANSACTION;


UPDATE booking_detail 
SET 
    Booking_DetailsID = p_Booking_DetailsID
        AND BookingDate = p_BookingDate > 0
WHERE
    Booking_DetailsID = p_Booking_DetailsID;

SELECT 
    COUNT(*)
INTO Updatedbooking FROM
    booking_detail
WHERE
    Booking_DetailsID = p_Booking_DetailsID > 0
        AND BookingDate = p_bookingDate;

    IF Updatedbooking > 0 THEN
        SELECT CONCAT('This ID No: ', p_Booking_DetailsID, ' ',' and this date: ', ' ' , p_BookingDate, 'has been changed') AS 'Confirmation Status';
    ELSE
        SELECT CONCAT('This ID No: ', p_Booking_DetailsID, ' ',' and this date: ', ' ' , p_BookingDate, 'has not been changed') AS 'Confirmation Status';
    END IF;

COMMIT;
END$$
DELIMITER ;
