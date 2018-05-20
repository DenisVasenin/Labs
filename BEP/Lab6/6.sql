-- Напишите SQL запрос для получения списка клиентов, которые брали какие-либо DVD диски в текущем году. В результатах запроса необходимо также отразить какие диски брали клиенты.

SELECT customer.first_name, customer.last_name, dvd.title, offer.offer_date
FROM offer
JOIN customer ON offer.customer_id = customer.customer_id
JOIN dvd ON offer.dvd_id = dvd.dvd_id
WHERE YEAR(offer.offer_date) = YEAR(NOW());
