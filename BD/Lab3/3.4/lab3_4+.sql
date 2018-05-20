use db_lab3_3;


-- 1.1
SELECT `name`, `surname` 
FROM `artist`
ORDER BY `name`;

-- 1.2
SELECT `name`, `surname` 
FROM `artist`
ORDER BY `name` DESC;

-- 1.3
SELECT `name`, `surname` 
FROM `artist`
ORDER BY `surname`, `name`;

-- 1.4
SELECT `name`, `surname` 
FROM `artist`
ORDER BY 1;


-- 2.1
SELECT MIN(year) 
FROM `artist`;

-- 2.2
SELECT MAX(year) 
FROM `artist`;

-- 2.3
SELECT AVG(year) 
FROM `artist`;

-- 2.4
SELECT SUM(year) 
FROM `artist`;


-- 3.1
-- 
SELECT `year`, COUNT(year) AS artist_count
FROM `artist`
GROUP BY `year`;

-- 3.2
-- то же самое, но вывожу только с суммой больше 2000
SELECT SUM(year) 
FROM `artist`
GROUP BY `year`;
HAVING SUM(year) > 2000;
