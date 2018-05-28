-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 21 2018 г., 17:09
-- Версия сервера: 10.1.29-MariaDB-6
-- Версия PHP: 7.2.4-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab7`
--

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` int(11) UNSIGNED NOT NULL,
  `teacher_id` int(11) UNSIGNED DEFAULT NULL,
  `subject_id` int(11) UNSIGNED DEFAULT NULL,
  `stud_group_id` int(11) UNSIGNED DEFAULT NULL,
  `lesson_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `teacher_id`, `subject_id`, `stud_group_id`, `lesson_date`) VALUES
(1, 1, 1, 1, '2018-05-10'),
(2, 3, 3, 1, '2018-05-16'),
(3, 4, 4, 1, '2018-05-03'),
(4, 2, 3, 2, '2018-05-01'),
(5, 4, 2, 2, '2018-05-05'),
(6, 3, 4, 3, '2018-05-09');

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) UNSIGNED NOT NULL,
  `student_id` int(11) UNSIGNED DEFAULT NULL,
  `lesson_id` int(11) UNSIGNED DEFAULT NULL,
  `rating_value` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rating`
--

INSERT INTO `rating` (`rating_id`, `student_id`, `lesson_id`, `rating_value`) VALUES
(1, 1, 2, 5),
(2, 2, 2, 4),
(3, 3, 3, 5),
(4, 4, 1, 2),
(5, 10, 2, 4),
(6, 6, 3, 2),
(7, 7, 1, 3),
(8, 8, 3, 2),
(9, 9, 1, 5),
(10, 12, 4, 5),
(11, 17, 5, 3),
(12, 13, 4, 3),
(13, 14, 5, 3),
(14, 17, 4, 4),
(15, 18, 6, 5),
(16, 19, 6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `student_id` int(11) UNSIGNED NOT NULL,
  `student_last_name` varchar(255) NOT NULL,
  `stud_group_id` int(11) UNSIGNED DEFAULT NULL,
  `student_birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`student_id`, `student_last_name`, `stud_group_id`, `student_birth_date`) VALUES
(1, 'Иванов', 1, '2018-05-02'),
(2, 'Петров', 1, '2018-05-12'),
(3, 'Сидоров', 1, '2018-05-08'),
(4, 'Косаткин', 1, '2018-05-13'),
(5, 'Рыбаков', 1, '2018-05-01'),
(6, 'Морковкин', 1, '2018-05-08'),
(7, 'Хрюнин', 1, '2018-05-11'),
(8, 'Слепов', 1, '2018-05-11'),
(9, 'Глебов', 1, '2018-05-07'),
(10, 'Марков', 1, '2018-05-06'),
(11, 'Синусов', 1, '2018-05-05'),
(12, 'Косинусов', 2, '2018-05-04'),
(13, 'Тангенсов', 2, '2018-05-02'),
(14, 'Котангенсов', 2, '2018-05-01'),
(15, 'Арктангенсов', 2, '2018-05-12'),
(16, 'Вазгенов', 2, '2018-05-20'),
(17, 'Неонов', 2, '2018-05-16'),
(18, 'Мудров', 3, '2018-05-12'),
(19, 'Глухов', 3, '2018-05-06'),
(20, 'Глазов', 3, '2018-05-18');

-- --------------------------------------------------------

--
-- Структура таблицы `stud_group`
--

CREATE TABLE `stud_group` (
  `stud_group_id` int(11) UNSIGNED NOT NULL,
  `stud_group_title` varchar(255) NOT NULL,
  `captain_id` int(11) UNSIGNED DEFAULT NULL,
  `group_spec_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `stud_group`
--

INSERT INTO `stud_group` (`stud_group_id`, `stud_group_title`, `captain_id`, `group_spec_title`) VALUES
(1, 'ПС-11', 6, 'ПС'),
(2, 'ИВТ-11', 14, 'ИВТ'),
(3, 'ВМ-11', 19, 'ВМ');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) UNSIGNED NOT NULL,
  `subject_title` varchar(255) NOT NULL,
  `subject_duration` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_title`, `subject_duration`) VALUES
(1, 'Математика', 56),
(2, 'Русский', 78),
(3, 'История', 33),
(4, 'БД', 60);

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) UNSIGNED NOT NULL,
  `teacher_last_name` varchar(255) NOT NULL,
  `teacher_position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `teacher_last_name`, `teacher_position`) VALUES
(1, 'Учитель1', 'Декан'),
(2, 'Учитель2', 'Завхоз'),
(3, 'Учитель3', 'Охранник'),
(4, 'Учитель4', 'Завкаф');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `stud_group_id` (`stud_group_id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `stud_group_id` (`stud_group_id`);

--
-- Индексы таблицы `stud_group`
--
ALTER TABLE `stud_group`
  ADD PRIMARY KEY (`stud_group_id`),
  ADD KEY `captain_id` (`captain_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `stud_group`
--
ALTER TABLE `stud_group`
  MODIFY `stud_group_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`stud_group_id`) REFERENCES `stud_group` (`stud_group_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`stud_group_id`) REFERENCES `stud_group` (`stud_group_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `stud_group`
--
ALTER TABLE `stud_group`
  ADD CONSTRAINT `stud_group_ibfk_1` FOREIGN KEY (`captain_id`) REFERENCES `student` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
