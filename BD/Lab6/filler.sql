-- mysql -u user -p lab6 < ./filler.sql

DROP FUNCTION IF EXISTS GetRandomNumber;
DELIMITER $$
CREATE FUNCTION GetRandomNumber(startNum INT, lastNum INT) RETURNS INT 
    RETURN FLOOR(RAND() * (lastNum + 1 - startNum)) + startNum$$
DELIMITER ;

DROP FUNCTION IF EXISTS GetRandomDate;
DELIMITER $$
CREATE FUNCTION GetRandomDate(startYear INT, lastYear INT) RETURNS DATE
    RETURN MAKEDATE(GetRandomNumber(startYear, lastYear), GetRandomNumber(1, 365))$$
DELIMITER ;

DROP FUNCTION IF EXISTS GetRandomString;
DELIMITER $$
CREATE FUNCTION GetRandomString(stringLength INT) RETURNS VARCHAR(255) 
BEGIN
    SET @str := '';
    SET @symbolCounter := 0;
    WHILE (@symbolCounter < stringLength) DO
        SET @str := CONCAT(@str, SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', GetRandomNumber(1, 26), 1));
        SET @symbolCounter := @symbolCounter + 1;
    END WHILE;
    RETURN @str;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS GetRandomCategory;
DELIMITER $$
CREATE FUNCTION GetRandomCategory() RETURNS VARCHAR(255) 
BEGIN
    SET @category = '';
    SET @rnd = GetRandomNumber(1, 2);
    CASE @rnd
      WHEN 1 THEN SET @category = 'lux';
      WHEN 2 THEN SET @category = 'econom';
      ELSE SET @category = 'error';
    END CASE;
    RETURN @category;
END$$
DELIMITER ;

-- ############################################################################

-- 1) Отели: hotel
-- hotel_id
-- hotel_name
-- hotel_stars
-- hotel_address

DROP PROCEDURE IF EXISTS FillHotelTable;
DELIMITER $$
CREATE PROCEDURE FillHotelTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO hotel
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomNumber(1, 5), 
            GetRandomString(12)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 2) Категории номеров: room_kind
-- room_kind_id
-- room_kind_kategory (lux, econom)
-- room_kind_space

DROP PROCEDURE IF EXISTS FillRoomKindTable;
DELIMITER $$
CREATE PROCEDURE FillRoomKindTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO room_kind
        VALUES (
            NULL, 
            GetRandomCategory(), 
            GetRandomNumber(20, 500)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 3) Комнаты: room
-- room_id
-- hotel_id
-- room_kind_id
-- room_number
-- room_price

DROP PROCEDURE IF EXISTS FillRoomTable;
DELIMITER $$
CREATE PROCEDURE FillRoomTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO room
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomNumber(1, 100), 
            @recordCounter, 
            GetRandomNumber(100, 1000)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 4) Клиенты: client
-- client_id
-- client_first_name
-- client_last_name
-- client_phone

DROP PROCEDURE IF EXISTS FillClientTable;
DELIMITER $$
CREATE PROCEDURE FillClientTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO client
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomString(6), 
            GetRandomNumber(111111, 999999)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 5) Бронь: booking
-- booking_id
-- client_id
-- booking_date

DROP PROCEDURE IF EXISTS FillBookingTable;
DELIMITER $$
CREATE PROCEDURE FillBookingTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO booking
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomDate(2016, 2016)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 6) Комната в номере: reserved_room
-- reserved_room_id, 
-- room_id
-- booking_id
-- arrival_date
-- departure_date

DROP PROCEDURE IF EXISTS FillReservedRoomTable;
DELIMITER $$
CREATE PROCEDURE FillReservedRoomTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO reserved_room
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomNumber(1, 100), 
            GetRandomDate(2017, 2017), 
            GetRandomDate(2018, 2018)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- ############################################################################

-- Отели:
DELETE FROM hotel;
ALTER TABLE hotel AUTO_INCREMENT = 1;
CALL FillHotelTable(100);

-- Категории номеров:
DELETE FROM room_kind;
ALTER TABLE room_kind AUTO_INCREMENT = 1;
CALL FillRoomKindTable(100);

-- Комнаты:
DELETE FROM room;
ALTER TABLE room AUTO_INCREMENT = 1;
CALL FillRoomTable(100);

-- Клиенты:
DELETE FROM client;
ALTER TABLE client AUTO_INCREMENT = 1;
CALL FillClientTable(100);

-- Бронь:
DELETE FROM booking;
ALTER TABLE booking AUTO_INCREMENT = 1;
CALL FillBookingTable(100);

-- Комната в номере:
DELETE FROM reserved_room;
ALTER TABLE reserved_room AUTO_INCREMENT = 1;
CALL FillReservedRoomTable(100);
