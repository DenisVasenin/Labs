-- 1
-- LEFT JOIN двух таблиц + WHERE по 1 атрибуту
SELECT artist.artist_id, `name`, `surname`, `year`, `cast_id` 
FROM `artist`
LEFT JOIN `cast`
ON artist.artist_id = cast.artist_id
WHERE artist.year < 1980;


-- 2
-- RIGHT JOIN двух таблиц, получить те же записи как в 4.1.
SELECT artist.artist_id, `name`, `surname`, `year`, `cast_id` 
FROM `cast`
RIGHT JOIN `artist`
ON cast.artist_id = artist.artist_id
WHERE artist.year < 1980;


-- 3
-- LEFT JOIN двух таблиц + WHERE по 2 атрибутам из 1 таблицы
SELECT artist.artist_id, `name`, `surname`, `year`, `cast_id` 
FROM `artist`
LEFT JOIN `cast`
ON artist.artist_id = cast.artist_id
WHERE artist.year < 1980 AND artist.artist_id > 4;


-- 4
-- LEFT JOIN двух таблиц + WHERE по 1 атрибуту из каждой таблицы
SELECT artist.artist_id, `name`, `surname`, `year`, `cast_id`, `role_id` 
FROM `artist`
LEFT JOIN `cast`
ON artist.artist_id = cast.artist_id
WHERE artist.year < 1980 AND cast.role_id = 2;


-- 5
-- LEFT JOIN трех таблиц + WHERE по 1 атрибуту из каждой таблицы
SELECT cast.cast_id, artist.name, artist.surname, role.role
FROM `cast`
LEFT JOIN `artist`
ON cast.artist_id = artist.artist_id
LEFT JOIN `role`
ON cast.role_id = role.role_id
WHERE (cast.cast_id BETWEEN 1 AND 5) AND (artist.year > 1970) AND (role.role = 'Betty Ross');