-- Подготовьте SQL запрос получения списка всех DVD, год выпуска которых 2010, отсортированных в алфавитном порядке по названию DVD.

SELECT title, production_year 
FROM dvd
WHERE production_year = '2010'
GROUP BY title;
