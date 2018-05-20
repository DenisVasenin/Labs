-- Подготовьте SQL запрос для получения списка DVD дисков, которые в настоящее время находятся у клиентов.

SELECT dvd.title, offer.return_date
FROM dvd
JOIN offer ON dvd.dvd_id = offer.dvd_id
WHERE NOW() BETWEEN offer.offer_date AND offer.return_date;
