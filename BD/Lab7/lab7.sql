-- 2) Выдать оценки студентов по математике если они обучаются/обучались данному предмету. Оформить выдачу данных с использованием view.
-- ++

CREATE OR REPLACE VIEW math_lessons AS 
SELECT stud_group.stud_group_id AS stud_group_id, subject.subject_title AS subject_title
FROM lesson
JOIN stud_group ON stud_group.stud_group_id = lesson.stud_group_id
JOIN subject ON subject.subject_id = lesson.subject_id
WHERE subject.subject_title = "Математика";

SELECT student.student_last_name, rating.rating_value, math_lessons.subject_title 
FROM math_lessons
JOIN stud_group ON stud_group.stud_group_id = math_lessons.stud_group_id
JOIN student ON student.stud_group_id = stud_group.stud_group_id
LEFT JOIN rating ON rating.student_id = student.student_id;

-- 3) Дать информацию о должниках с указанием фамилии студента и названия предмета. Должниками считаются студенты, не имеющие оценки по предмету, который ведется в группе. Оформить в виде процедуры, на вход название группы.
-- redo

DROP PROCEDURE IF EXISTS GetDebtors;
DELIMITER $$
CREATE PROCEDURE GetDebtors($groupTitle VARCHAR(255))
BEGIN
  SELECT student.student_last_name, t.subject_title 
  FROM student 
  INNER JOIN (
    SELECT student.student_id, SUM(rating.rating_value) AS rating_value, stud_group.stud_group_title, subject.subject_title
    FROM lesson 
    JOIN stud_group ON stud_group.stud_group_id = lesson.stud_group_id
    JOIN subject ON subject.subject_id = lesson.subject_id
    JOIN student ON student.stud_group_id = stud_group.stud_group_id
    LEFT JOIN rating ON rating.student_id = student.student_id
    GROUP BY student.student_id, subject.subject_title
  ) AS t USING(student_id)
  WHERE t.rating_value IS NULL AND t.stud_group_title = $groupTitle;
END $$
DELIMITER ;

CALL GetDebtors("ПС-11");

-- 4) Дать среднюю оценку студентов по каждому предмету для тех предметов, по которым занимается не менее 10 студентов.
-- todo

CREATE TEMPORARY TABLE subjects AS (
  SELECT subject.subject_id AS subject_id, subject.subject_title AS subject_title, COUNT(student.student_id) AS student_count
  FROM lesson
  JOIN subject ON subject.subject_id = lesson.subject_id
  JOIN stud_group ON stud_group.stud_group_id = lesson.stud_group_id
  JOIN student ON student.stud_group_id = stud_group.stud_group_id
  GROUP BY lesson.subject_id
);

SELECT subjects.subject_title, AVG(rating.rating_value)
FROM subjects
JOIN lesson ON lesson.subject_id = subjects.subject_id
JOIN rating ON rating.lesson_id = lesson.lesson_id
GROUP BY lesson.lesson_id
WHERE subjects.student_count > 9;

-- 5) Дать оценки студентов специальности ВМ по всем проводимым предметам с указанием группы, фамилии, предмета, даты. При отсутствии оценки заполнить значениями NULL поля оценки и даты.
-- --

SELECT stud_group.stud_group_title, student.student_last_name, subject.subject_title, lesson.lesson_date, rating.rating_value
FROM student
LEFT JOIN rating ON student.student_id = rating.student_id
LEFT JOIN lesson ON lesson.stud_group_id = lesson.stud_group_id
JOIN subject ON subject.subject_id = lesson.subject_id
JOIN stud_group ON stud_group.stud_group_id = student.stud_group_id
WHERE stud_group.group_spec_title = 'ВМ';

-- 6) Всем студентам специальности ИВТ, получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл.
-- --

SET SQL_SAFE_UPDATES = 0;
UPDATE rating 
JOIN lesson ON lesson.lesson_id = rating.lesson_id
JOIN stud_group ON stud_group.stud_group_id = lesson.stud_group_id
JOIN subject ON subject.subject_id = lesson.subject_id
SET rating.rating_value = rating.rating_value + 1
WHERE subject.subject_title = 'БД' AND rating.rating_value < 5 AND lesson.lesson_date < '2018.05.12' AND stud_group.group_spec_title = 'ИВТ';