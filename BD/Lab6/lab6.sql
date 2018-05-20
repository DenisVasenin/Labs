-- 2) Выдать информацию о клиентах гостиницы “Алтай”, проживающих в номерах категории “люкс”

SELECT client.client_first_name, client.client_last_name, client.client_phone, room_kind.room_kind_category, hotel.hotel_name
FROM client
JOIN booking ON booking.client_id = client.client_id
JOIN reserved_room ON booking.booking_id = reserved_room.booking_id
JOIN room ON reserved_room.room_id = room.room_id
JOIN hotel ON room.hotel_id = hotel.hotel_id
JOIN room_kind ON room.room_kind_id = room_kind.room_kind_id
WHERE hotel.hotel_name = 'Алтай' AND room_kind.room_kind_category = 'lux' AND (NOW() NOT BETWEEN reserved_room.arrival_date AND reserved_room.departure_date)
GROUP BY client.client_id;

-- 3) Дать список свободных номеров всех гостиниц на 2018.05.30

SELECT room.room_number, hotel.hotel_name, room_kind.room_kind_category, reserved_room.departure_date
FROM room
RIGHT JOIN reserved_room ON room.room_id = reserved_room.room_id
JOIN hotel ON room.hotel_id = hotel.hotel_id
JOIN room_kind ON room.room_kind_id = room_kind.room_kind_id
WHERE ('2018-05-30' NOT BETWEEN reserved_room.arrival_date AND reserved_room.reserved_date) OR reserved_room.room_id = NULL
GROUP BY room.room_id;

-- 4) Дать количество проживающих в гостинице “Восток” на 25.05.18 по каждому номеру

SELECT COUNT(reserved_room.room_id) as 'count', room.room_number, hotel.hotel_name 
FROM reserved_room
JOIN room ON reserved_room.room_id = room.room_id
JOIN hotel ON room.hotel_id = hotel.hotel_id
WHERE hotel.hotel_name = 'Восток' AND ('2018-05-25' BETWEEN reserved_room.arrival_date AND reserved_room.departure_date)
GROUP BY reserved_room.room_id;

-- 5) Дать список последних проживавших клиентов по всем комнатам гостиницы “Космос”, выехавшим '2018-05'-'2018-10' с указанием даты выезда.

CREATE TEMPORARY TABLE last_clients AS (
  SELECT reserved_room.room_id AS 'room_id', reserved_room.booking_id AS 'booking_id', MAX(reserved_room.departure_date) AS 'departure_date', hotel.hotel_name AS 'hotel_name'
  FROM reserved_room
  JOIN room ON reserved_room.room_id = room.room_id
  JOIN hotel ON room.hotel_id = hotel.hotel_id
  WHERE hotel.hotel_name = 'Космос' AND (reserved_room.departure_date BETWEEN "2018-05-01" AND "2018-10-31")
  GROUP BY reserved_room.room_id
);
SELECT room.room_number, client.client_first_name, client.client_last_name, last_clients.departure_date, last_clients.hotel_name
FROM last_clients
JOIN booking ON last_clients.booking_id = booking.booking_id
JOIN room ON last_clients.room_id = room.room_id
JOIN client ON booking.client_id = client.client_id

-- 6) Продлить до 2018.12.30 дату проживания в гостинице “Сокол” всем клиентам комнат категории “люкс”, которые заселились до 2017.05.15, а выезжают до 2018.10.28

UPDATE reserved_room
JOIN room ON reserved_room.room_id = room.room_id
JOIN hotel ON room.hotel_id = hotel.hotel_id
JOIN room_kind ON room.room_kind_id = room_kind.room_kind_id
SET reserved_room.departure_date = '2018-12-12'
WHERE hotel.hotel_name = 'Сокол' AND room_kind.room_kind_category = 'lux' AND reserved_room.arrival_date < '2017-05-15' AND reserved_room.departure_date < '2018-10-18';

-- 7) Привести пример транзакции при создании брони

START TRANSACTION;
INSERT INTO client VALUES (NULL, 'AAAAAAAAA', 'BBBBBBBBBBBB', "010101");
SET @new_client_id := LAST_INSERT_ID();
INSERT INTO booking VALUES (NULL, @new_client_id, NOW());
SET @new_booking_id := LAST_INSERT_ID();
INSERT INTO reserved_room VALUES (NULL, 50, @new_booking_id, NOW(), "2050-01-01");
COMMIT;
