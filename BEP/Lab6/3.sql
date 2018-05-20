-- mysql -u user -p rental < ./3.sql

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

-- ############################################################################

-- 1) Таблица dvd
-- dvd_id - уникальный ключ записи
-- title - название DVD диска
-- production_year - год выпуска DVD диска

DROP PROCEDURE IF EXISTS FillDvdTable;
DELIMITER $$
CREATE PROCEDURE FillDvdTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO dvd
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomNumber(1950, 2050)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 2) Таблица customer
-- customer_id
-- first_name
-- last_name
-- passport_code - код в паспорте
-- registration_date - дата регистрации клиента в системе

DROP PROCEDURE IF EXISTS FillCustomerTable;
DELIMITER $$
CREATE PROCEDURE FillCustomerTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO customer
        VALUES (
            NULL, 
            GetRandomString(8), 
            GetRandomString(12), 
            @recordCounter, 
            GetRandomDate(1980, 2020)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- 3) Таблица offer для хранение информации о заказах клиентов:
-- offer_id
-- dvd_id - идентификатор DVD диска из таблицы dvd
-- customer_id - идентификатор клиента из таблицы customer
-- offer_date - дата, когда клиент взял DVD диск
-- return_date  - дата, когда клиент вернул DVD диск

DROP PROCEDURE IF EXISTS FillOfferTable;
DELIMITER $$
CREATE PROCEDURE FillOfferTable(recordCount INT) 
BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO offer
        VALUES (
            NULL, 
            GetRandomNumber(1, 10), 
            GetRandomNumber(1, 10), 
            GetRandomDate(1980, 2000), 
            GetRandomDate(2000, 2020)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$
DELIMITER ;

-- ############################################################################

DELETE FROM dvd;
ALTER TABLE dvd AUTO_INCREMENT = 1;
CALL FillDvdTable(100);

DELETE FROM customer;
ALTER TABLE customer AUTO_INCREMENT = 1;
CALL FillCustomerTable(100);

DELETE FROM offer;
ALTER TABLE offer AUTO_INCREMENT = 1;
CALL FillOfferTable(100);
