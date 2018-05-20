-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Мар 31 2018 г., 20:17
-- Версия сервера: 10.1.29-MariaDB-6
-- Версия PHP: 7.2.3-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab3_3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `artist`
--

INSERT INTO `artist` (`artist_id`, `name`, `surname`) VALUES
(1, 'Eric', 'Bana'),
(2, 'Lou', 'Ferrigno'),
(3, 'Jennifer', 'Connelly'),
(4, 'Robert', 'Downey'),
(5, 'Gwyneth', 'Paltrow'),
(6, 'Leslie', 'Bibb'),
(7, 'Jon', 'Favreau'),
(8, 'Liv', 'Tyler');

-- --------------------------------------------------------

--
-- Структура таблицы `cast`
--

CREATE TABLE `cast` (
  `cast_id` int(11) UNSIGNED NOT NULL,
  `film_id` int(11) UNSIGNED DEFAULT NULL,
  `artist_id` int(11) UNSIGNED DEFAULT NULL,
  `role_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cast`
--

INSERT INTO `cast` (`cast_id`, `film_id`, `artist_id`, `role_id`) VALUES
(1, 2, 8, 1),
(2, 1, 1, 2),
(3, 2, 1, 2),
(4, 1, 2, 3),
(5, 2, 2, 3),
(6, 3, 4, 5),
(7, 4, 4, 5),
(8, 5, 4, 5),
(9, 1, 3, 1),
(10, 3, 5, 4),
(11, 4, 5, 4),
(12, 5, 5, 4),
(13, 3, 6, 6),
(14, 4, 6, 6),
(15, 3, 7, 7),
(16, 4, 7, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `film_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `year` smallint(4) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`film_id`, `title`, `year`, `country`) VALUES
(1, 'Hulk', 2003, 'USA'),
(2, 'The Incredible Hulk', 2008, 'USA'),
(3, 'Iron Man', 2008, 'USA'),
(4, 'Iron Man 2', 2010, 'USA'),
(5, 'Iron Man 3', 2013, 'USA');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `role_id` int(11) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'Betty Ross'),
(2, 'Bruce Banner'),
(3, 'Security Guard'),
(4, 'Pepper Potts'),
(5, 'Tony Stark'),
(6, 'Christine Everhart'),
(7, 'Hogan');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD UNIQUE KEY `artist_id` (`artist_id`);

--
-- Индексы таблицы `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`cast_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `artist_id` (`artist_id`) USING BTREE,
  ADD KEY `role_id` (`role_id`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`),
  ADD UNIQUE KEY `film_id` (`film_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `cast`
--
ALTER TABLE `cast`
  MODIFY `cast_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cast`
--
ALTER TABLE `cast`
  ADD CONSTRAINT `cast_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cast_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cast_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
