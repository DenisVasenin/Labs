-- SCRIPT CREATED BY I.EGOSHIN

-- FILL COMPANY TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillCompany;
DELIMITER //
CREATE PROCEDURE fillCompany()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO company
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand()*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1),substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed)*36+1, 1)), 
      FLOOR(1980 + RAND()*37));
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;

-- FILL DEALER TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillDealer;
DELIMITER //
CREATE PROCEDURE fillDealer()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO dealer
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99),
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      concat('79', substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1)));
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;

-- FILL DRUG TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillDrug;
DELIMITER //
CREATE PROCEDURE fillDrug()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO drug
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      FLOOR(1 + RAND()*70));
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;

-- FILL PHARMACY TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillPharmacy;
DELIMITER //
CREATE PROCEDURE fillPharmacy()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO pharmacy
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)));
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;

-- FILL CONSIGNMENT TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillConsignment;
DELIMITER  //
CREATE PROCEDURE fillConsignment()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO consignment
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99),
      FLOOR(1 + RAND()*99),
      FLOOR(1 + RAND()*8000),
      FLOOR(1 + RAND()*200));
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;

-- FILL DRUG_ORDER TABLE PROCEDURE
DROP PROCEDURE IF EXISTS fillDrugOrder;
DELIMITER //
CREATE PROCEDURE fillDrugOrder()
BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO drug_order
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*6000), 
      NOW() - INTERVAL FLOOR(RAND() * 10) YEAR - INTERVAL FLOOR(RAND() * 3) MONTH - INTERVAL FLOOR(RAND() * 14) DAY);
    SET @counter = @counter + 1;
  END WHILE;
END//
DELIMITER ;


--
DELETE FROM company;
ALTER TABLE company AUTO_INCREMENT = 1;
CALL fillCompany();

DELETE FROM dealer;
ALTER TABLE dealer AUTO_INCREMENT = 1;
CALL fillDealer();

DELETE FROM drug;
ALTER TABLE drug AUTO_INCREMENT = 1;
CALL fillDrug();

DELETE FROM pharmacy;
ALTER TABLE pharmacy AUTO_INCREMENT = 1;
CALL fillPharmacy();

DELETE FROM consignment;
ALTER TABLE consignment AUTO_INCREMENT = 1;
CALL fillConsignment();

DELETE FROM drug_order;
ALTER TABLE drug_order AUTO_INCREMENT = 1;
CALL fillDrugOrder();