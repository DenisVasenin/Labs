use db_lab3_3;


-- 1.1
INSERT INTO `artist` 
VALUES (9, 'John', 'Doe');

-- 1.2
INSERT INTO `artist` (artist_id, name, surname) 
VALUES (10, 'Anna', 'Semenovich');

-- 1.3
INSERT INTO `test` (id, name, surname)
SELECT `artist_id`, `name`, `surname`
FROM `artist`;


-- 2.1
DELETE FROM `test`;

-- 2.2
INSERT INTO `test` (id, name, surname) SELECT `artist_id`, `name`, `surname` FROM `artist`;
DELETE FROM `test`
WHERE `id` BETWEEN 2 AND 6;

-- 2.3
TRUNCATE TABLE `test`;


-- 3.1
INSERT INTO `test` (id, name, surname) SELECT `artist_id`, `name`, `surname` FROM `artist`;
UPDATE `test`
SET `name` = 'Vasya';

-- 3.2
UPDATE `test`
SET `name` = 'Petya'
WHERE `id` = 2;

-- 3.3
UPDATE `test`
SET `name` = 'Ivan', `surname` = 'Ivanov'
WHERE `id` BETWEEN 1 AND 5;


-- 4.1
SELECT `name`, `surname` 
FROM `test`;

-- 4.2
SELECT * 
FROM `test`;

-- 4.3
SELECT * 
FROM `test`
WHERE `surname` = 'Bibb';
