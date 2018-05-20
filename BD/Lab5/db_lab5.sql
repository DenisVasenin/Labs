-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 25 2018 г., 19:35
-- Версия сервера: 10.1.29-MariaDB-6
-- Версия PHP: 7.2.4-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab5`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`user`@`localhost` PROCEDURE `fillCompany` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO company
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand()*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed:=round(rand(@seed)*4294967296))*36+1, 1),substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', rand(@seed)*36+1, 1)), 
      FLOOR(1980 + RAND()*37));
    SET @counter = @counter + 1;
  END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `fillConsignment` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO consignment
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99),
      FLOOR(1 + RAND()*99),
      FLOOR(1 + RAND()*8000),
      FLOOR(1 + RAND()*200));
    SET @counter = @counter + 1;
  END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `fillDealer` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO dealer
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99),
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      concat('79', substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1), substring('0123456789', FLOOR(1 + RAND()*10), 1)));
    SET @counter = @counter + 1;
  END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `fillDrug` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO drug
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      FLOOR(1 + RAND()*70));
    SET @counter = @counter + 1;
  END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `fillDrugOrder` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO drug_order
    VALUES
      (NULL,
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*99), 
      FLOOR(1 + RAND()*6000), 
      NOW() - INTERVAL FLOOR(RAND() * 10) YEAR - INTERVAL FLOOR(RAND() * 3) MONTH - INTERVAL FLOOR(RAND() * 14) DAY);
    SET @counter = @counter + 1;
  END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `fillPharmacy` ()  BEGIN
  SET @counter = 0;
  WHILE (@counter < 100) DO
    INSERT INTO pharmacy
    VALUES
      (NULL,
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)),
      concat(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1), substring('abcdefghijklmnopqestuvwxyz', FLOOR(1 + RAND()*26), 1)));
    SET @counter = @counter + 1;
  END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE `company` (
  `company_id` int(11) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `foundation_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `foundation_year`) VALUES
(1, 'Фарма', 1983),
(2, 'Гедеон Рихтер', 2004),
(3, 'DQCJ9TYY', 1995),
(4, 'MPKDR5NN', 1983),
(5, '7VNIX4HH', 1980),
(6, 'SZFVQIMM', 1997),
(7, '5FKULBWW', 2005),
(8, '4BCZYDBB', 2009),
(9, 'CCH56JCC', 2013),
(10, 'D3V32EXX', 2013),
(11, 'UY2HGYFF', 1987),
(12, 'XCO0YOKK', 2011),
(13, '1HGCISPP', 1988),
(14, 'U70IF0LL', 2000),
(15, 'KYK64RLL', 2002),
(16, 'Z70JVOOO', 1994),
(17, 'Аргус', 1988),
(18, '9IIX4PZZ', 2013),
(19, 'YI5GJTJJ', 2012),
(20, 'ZDJLV199', 1994),
(21, 'ZC7OCDTT', 2010),
(22, 'USLFXX88', 1985),
(23, 'ZPC641CC', 1999),
(24, '26EZNSNN', 2009),
(25, 'C28Q3S33', 1992),
(26, 'KPCILDHH', 1981),
(27, 'O1T65CEE', 2011),
(28, '9U2UGN88', 2013),
(29, 'OD0SO9ZZ', 1990),
(30, '8X7MCG11', 1996),
(31, 'HWQXCTJJ', 2007),
(32, 'SZS799', 2015),
(33, 'YFNZKW88', 2007),
(34, 'VYF764EE', 2001),
(35, 'D98DR00', 1982),
(36, '2DFQET22', 1980),
(37, 'B9YQR4EE', 1998),
(38, 'HKJM9SSS', 2005),
(39, 'Y03MK3RR', 1995),
(40, 'DZDZPAPP', 2013),
(41, '5PZYJCWW', 2001),
(42, 'JIHYCFF', 2001),
(43, 'I1K3B599', 2015),
(44, '0C88DH55', 1985),
(45, 'EYYW9BQQ', 1980),
(46, 'JV2QRHBB', 1984),
(47, 'BO84G4KK', 1989),
(48, 'QIJUCKUU', 1999),
(49, '1XWJVE22', 2008),
(50, 'TJSFTGVV', 2012),
(51, 'K6RBIWKK', 2006),
(52, 'WFGIRD88', 2000),
(53, '5R04R2VV', 1994),
(54, 'W9LYL3CC', 1987),
(55, 'WUXK2000', 1991),
(56, 'VNBY033', 2016),
(57, 'BRW33PWW', 1983),
(58, 'I05YC4LL', 2009),
(59, '52ELO5MM', 1998),
(60, '0RLDJGXX', 1988),
(61, '6Y43L411', 2012),
(62, '2N5E21VV', 2004),
(63, '757K2WHH', 1996),
(64, 'XG4RFA66', 2003),
(65, 'PE65UPSS', 1983),
(66, 'NLJRE9FF', 1988),
(67, 'CDYI2MGG', 1994),
(68, 'KOAM10NN', 1989),
(69, 'CBC7Q00', 1992),
(70, '5USHQZFF', 1992),
(71, 'MO1S222', 1986),
(72, 'LYAOGHXX', 1988),
(73, 'ODBMYHZZ', 2002),
(74, 'I1KSKTDD', 2008),
(75, 'FYC5FSII', 2012),
(76, '789XA1NN', 1983),
(77, 'N1096KTT', 2004),
(78, 'BNBPZGBB', 2001),
(79, '2NW4INTT', 1990),
(80, 'BWNE74QQ', 1989),
(81, 'LWXO86VV', 1984),
(82, 'SNNCP9', 2015),
(83, 'LWEOG2MM', 2015),
(84, 'DR77T8AA', 2009),
(85, 'B7GM6166', 1999),
(86, 'PK6NRX66', 2013),
(87, 'SIBUO2CC', 1992),
(88, 'P7NDQ3QQ', 1990),
(89, 'ZM32MR88', 1986),
(90, 'L8B1U799', 1982),
(91, 'BFKVJCC', 1996),
(92, '9CL314NN', 2015),
(93, '9TERFF', 1990),
(94, 'BM0JEXUU', 2001),
(95, 'RL7I2444', 2003),
(96, 'ZM5699QQ', 1981),
(97, 'SVUQD133', 1980),
(98, 'CVEJ19MM', 2003),
(99, 'HFB16YTT', 1985),
(100, 'C6P4ZPEE', 2013);

-- --------------------------------------------------------

--
-- Структура таблицы `consignment`
--

CREATE TABLE `consignment` (
  `consignment_id` int(11) UNSIGNED NOT NULL,
  `company_id` int(11) UNSIGNED NOT NULL,
  `drug_id` int(11) UNSIGNED NOT NULL,
  `drug_price` int(11) UNSIGNED NOT NULL,
  `drug_rating` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `consignment`
--

INSERT INTO `consignment` (`consignment_id`, `company_id`, `drug_id`, `drug_price`, `drug_rating`) VALUES
(1, 65, 78, 7618, 85),
(2, 26, 3, 2672, 121),
(3, 3, 30, 3258, 31),
(4, 54, 25, 5011, 77),
(5, 3, 97, 6596, 37),
(6, 45, 68, 403, 44),
(7, 94, 6, 3716, 30),
(8, 34, 25, 1737, 70),
(9, 10, 43, 6799, 194),
(10, 29, 55, 7211, 169),
(11, 50, 96, 2610, 149),
(12, 73, 42, 7136, 43),
(13, 40, 34, 3963, 94),
(14, 84, 84, 5271, 155),
(15, 88, 10, 6730, 183),
(16, 4, 45, 1160, 74),
(17, 42, 96, 4628, 200),
(18, 26, 29, 5267, 88),
(19, 21, 71, 7599, 123),
(20, 21, 22, 3544, 115),
(21, 52, 91, 7859, 36),
(22, 94, 18, 596, 167),
(23, 92, 15, 7610, 64),
(24, 72, 68, 1912, 29),
(25, 1, 58, 7224, 154),
(26, 13, 35, 2837, 145),
(27, 56, 63, 3755, 92),
(28, 86, 97, 2203, 90),
(29, 42, 73, 3472, 192),
(30, 50, 61, 4341, 179),
(31, 83, 49, 7527, 49),
(32, 38, 18, 6029, 47),
(33, 89, 79, 2154, 194),
(34, 4, 29, 2467, 138),
(35, 51, 50, 7689, 62),
(36, 65, 32, 5179, 57),
(37, 47, 52, 1506, 75),
(38, 31, 41, 1046, 85),
(39, 72, 36, 4774, 185),
(40, 81, 30, 472, 80),
(41, 81, 86, 6971, 155),
(42, 26, 97, 747, 109),
(43, 44, 54, 3334, 91),
(44, 1, 67, 2822, 149),
(45, 65, 4, 1739, 197),
(46, 26, 35, 7879, 173),
(47, 37, 26, 1429, 24),
(48, 6, 92, 3727, 110),
(49, 34, 8, 2631, 86),
(50, 16, 50, 289, 135),
(51, 27, 30, 5751, 137),
(52, 27, 29, 5045, 59),
(53, 56, 95, 517, 94),
(54, 14, 30, 455, 81),
(55, 83, 94, 2036, 86),
(56, 37, 56, 5518, 155),
(57, 80, 67, 7682, 158),
(58, 6, 92, 3724, 109),
(59, 32, 96, 6884, 83),
(60, 48, 18, 3522, 134),
(61, 2, 7, 2398, 59),
(62, 57, 96, 1073, 153),
(63, 42, 79, 5721, 40),
(64, 83, 58, 3229, 56),
(65, 17, 99, 3952, 96),
(66, 90, 9, 5716, 64),
(67, 45, 28, 484, 93),
(68, 13, 25, 6936, 118),
(69, 33, 89, 3720, 131),
(70, 86, 37, 1979, 27),
(71, 91, 19, 1466, 72),
(72, 24, 11, 6522, 153),
(73, 38, 58, 6283, 37),
(74, 55, 19, 2469, 195),
(75, 94, 81, 1702, 127),
(76, 52, 70, 7584, 128),
(77, 34, 78, 7249, 36),
(78, 17, 30, 89, 30),
(79, 71, 11, 3308, 148),
(80, 46, 6, 7416, 92),
(81, 52, 20, 3624, 134),
(82, 96, 83, 2279, 183),
(83, 71, 83, 169, 122),
(84, 96, 2, 1268, 152),
(85, 32, 32, 4999, 36),
(86, 1, 50, 3899, 187),
(87, 21, 23, 4170, 185),
(88, 6, 49, 2292, 194),
(89, 97, 99, 305, 41),
(90, 90, 90, 6662, 88),
(91, 68, 12, 4371, 74),
(92, 20, 90, 7359, 177),
(93, 66, 64, 2026, 66),
(94, 87, 39, 2724, 105),
(95, 60, 41, 2171, 24),
(96, 78, 56, 3761, 132),
(97, 87, 38, 2224, 52),
(98, 46, 52, 1893, 123),
(99, 36, 93, 4992, 62),
(100, 66, 37, 6950, 48);

-- --------------------------------------------------------

--
-- Структура таблицы `dealer`
--

CREATE TABLE `dealer` (
  `dealer_id` int(11) UNSIGNED NOT NULL,
  `company_id` int(11) UNSIGNED NOT NULL,
  `dealer_surname` varchar(255) NOT NULL,
  `dealer_phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dealer`
--

INSERT INTO `dealer` (`dealer_id`, `company_id`, `dealer_surname`, `dealer_phone_number`) VALUES
(1, 78, 'Emxeaqde', '79999630001'),
(2, 44, 'Wbpyuenc', '79924476996'),
(3, 46, 'Jkzqhmqe', '79552641508'),
(4, 3, 'Ouemanqp', '79172998794'),
(5, 33, 'Kawgsvxb', '79570013245'),
(6, 17, 'Hxswcymm', '79939800980'),
(7, 85, 'Cwbedumb', '79772055074'),
(8, 3, 'Uwzgkgcq', '79845316780'),
(9, 86, 'Bqcmdepj', '79035486826'),
(10, 58, 'Yzblxhel', '79299049598'),
(11, 49, 'Yedbvcxi', '79966190697'),
(12, 16, 'Jkzqhnex', '79447734299'),
(13, 71, 'Vcwcwzju', '79945195919'),
(14, 38, 'Ynschffi', '79002112663'),
(15, 68, 'Kzqiqezj', '79946809760'),
(16, 25, 'Dapwqnuj', '79389450771'),
(17, 82, 'Ojdngtxg', '79511318848'),
(18, 79, 'Mbuuewiz', '79029361602'),
(19, 19, 'Dbynvneg', '79707887310'),
(20, 63, 'Ahgmojfx', '79903636105'),
(21, 85, 'Mwvngocu', '79603690355'),
(22, 20, 'Jeumbtqz', '79900358310'),
(23, 44, 'Enbtpuby', '79517373805'),
(24, 87, 'Piwizbhf', '79245277767'),
(25, 84, 'Amigegee', '79356641291'),
(26, 64, 'Widpqiua', '79617476153'),
(27, 5, 'Gamguhzb', '79377488917'),
(28, 33, 'Lfsyqjwh', '79708302997'),
(29, 24, 'Vjinqsos', '79791910939'),
(30, 66, 'Nnehvjhl', '79310566428'),
(31, 41, 'Oqkcjmhb', '79357284685'),
(32, 12, 'Xgmpnxyx', '79714943545'),
(33, 66, 'Otbbbgze', '79919378919'),
(34, 14, 'Yiuatpsv', '79910939794'),
(35, 59, 'Meypeaqb', '79414754539'),
(36, 87, 'Nxybmhxe', '79605336355'),
(37, 47, 'Nhwklymp', '79584062397'),
(38, 77, 'Rcmcatec', '79414748740'),
(39, 89, 'Heotaztu', '79604753160'),
(40, 2, 'Abgbnmwx', '79985397938'),
(41, 34, 'Ckutijvb', '79776788697'),
(42, 74, 'Omwtgahm', '79480545523'),
(43, 17, 'Sdmyiuat', '79735532866'),
(44, 50, 'Lezzwkjq', '79188676018'),
(45, 57, 'Kijynvne', '79267619902'),
(46, 36, 'Yozfdddj', '79495904093'),
(47, 20, 'Vqpajvap', '79879436172'),
(48, 92, 'Zahhpdwz', '79362262503'),
(49, 67, 'Ipzcpqja', '79964290494'),
(50, 47, 'Ykbdlxbe', '79218852794'),
(51, 22, 'Wtbdlwzj', '79931400893'),
(52, 92, 'Ozgkdmbu', '79860035782'),
(53, 58, 'Ffmulxgm', '79666990369'),
(54, 82, 'Jghqjyqi', '79793780753'),
(55, 2, 'Dsdmzlif', '79231513400'),
(56, 98, 'Uyitxfki', '79401355923'),
(57, 19, 'Ujmiduma', '79590407431'),
(58, 66, 'Zvgufqov', '79491062433'),
(59, 77, 'Uexpeeie', '79885244957'),
(60, 16, 'Ndemvqua', '79637749263'),
(61, 93, 'Oyahkfvo', '79246950395'),
(62, 84, 'Plnfmvqe', '79435322625'),
(63, 3, 'Kwcyjazu', '79096243551'),
(64, 19, 'Lptxfmqv', '79120238250'),
(65, 76, 'Omsesbee', '79780572729'),
(66, 9, 'Melsetgz', '79219396415'),
(67, 31, 'Vgugugwn', '79943192329'),
(68, 2, 'Ggkjnmve', '79847361544'),
(69, 90, 'Goycsgdy', '79379264355'),
(70, 3, 'Oqnszuas', '79565905586'),
(71, 80, 'Autngsuw', '79872878144'),
(72, 20, 'Nydwyduq', '79658539655'),
(73, 18, 'Hwnzkzsp', '79972781304'),
(74, 93, 'Iyemkoeq', '79224361733'),
(75, 92, 'Mpoalfqq', '79227812488'),
(76, 46, 'Wyecvyhn', '79701702905'),
(77, 54, 'Zjxkjosy', '79570977748'),
(78, 95, 'Fhsusevp', '79449446291'),
(79, 85, 'Wsbepmoj', '79171357976'),
(80, 8, 'Lzqdwvqq', '79363839828'),
(81, 24, 'Tdjjuxdx', '79062228299'),
(82, 84, 'Jimltnfq', '79447210894'),
(83, 34, 'Hmmzosxi', '79017290533'),
(84, 66, 'Fbqbimle', '79152512644'),
(85, 88, 'Ankpsvzj', '79961094360'),
(86, 20, 'Xzewwtdm', '79925910742'),
(87, 71, 'Wfjgdxdx', '79193769713'),
(88, 45, 'Dgxudknm', '79747376851'),
(89, 94, 'Jyqiuzmm', '79803946846'),
(90, 69, 'Qblymnfn', '79925798132'),
(91, 24, 'Khgkfwtd', '79475506834'),
(92, 93, 'Likzenlt', '79409623154'),
(93, 44, 'Xdbykfvp', '79452519586'),
(94, 75, 'Shiuxfiy', '79829863964'),
(95, 36, 'Jvanpmpm', '79665864343'),
(96, 47, 'Ekmfqowe', '79756566431'),
(97, 61, 'Txheosyn', '79727216850'),
(98, 69, 'Ggkgajtq', '79978130036'),
(99, 22, 'Ctlylkec', '79544958796'),
(100, 31, 'Qgjzxmvp', '79590559061');

-- --------------------------------------------------------

--
-- Структура таблицы `drug`
--

CREATE TABLE `drug` (
  `drug_id` int(11) UNSIGNED NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `treatment_duration` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `drug`
--

INSERT INTO `drug` (`drug_id`, `drug_name`, `treatment_duration`) VALUES
(1, 'aGERERER', 17),
(2, 'Gocsjpza', 8),
(3, 'Olmcdhcq', 61),
(4, 'Lpenohsq', 11),
(5, 'Vsaytuuo', 26),
(6, 'Eumbwdcb', 69),
(7, 'Tvvteszs', 52),
(8, 'Nhyxsvbu', 55),
(9, 'Mczqhnsb', 12),
(10, 'Qpceethg', 24),
(11, 'Xozjtshi', 58),
(12, 'Cbaxnwsz', 58),
(13, 'Dgvledol', 34),
(14, 'Cbzttona', 29),
(15, 'Axjfxzbm', 8),
(16, 'Djlavato', 37),
(17, 'Zkzqjuyh', 46),
(18, 'Jxlksipw', 48),
(19, 'Spucgwqn', 45),
(20, 'Soswehzc', 28),
(21, 'Slcchcpu', 3),
(22, 'Wfnxycop', 22),
(23, 'Tusdolnf', 40),
(24, 'Edemvukq', 69),
(25, 'Zbfyahja', 63),
(26, 'Mtiispvi', 15),
(27, 'Alfqpaiq', 8),
(28, 'Rzzvicmd', 20),
(29, 'Yyufesnl', 52),
(30, 'Кордерон', 7),
(31, 'Vxcebgdy', 23),
(32, 'Ttnhyudg', 66),
(33, 'Xuemxcsj', 48),
(34, 'Hiuzpyah', 30),
(35, 'Ftbcgyxv', 27),
(36, 'Kynsbcgb', 35),
(37, 'Haewtdke', 10),
(38, 'Ryqlhbmd', 23),
(39, 'Eycebjqz', 4),
(40, 'Ikencyll', 54),
(41, 'Omezyqli', 25),
(42, 'Tqwnannc', 64),
(43, 'Gmqtwcwc', 59),
(44, 'Xyzewxwp', 32),
(45, 'Ltooanof', 21),
(46, 'Xeovknmw', 62),
(47, 'Ugwoddgw', 35),
(48, 'Xboeqfbe', 11),
(49, 'Undemyfe', 19),
(50, 'Vhywpgme', 66),
(51, 'Rnpkfujn', 38),
(52, 'Btpqlhbm', 13),
(53, 'Mxdxbsgf', 18),
(54, 'Rnespxee', 18),
(55, 'Iucaxmol', 37),
(56, 'Hwkjtqzx', 44),
(57, 'Kbetdncy', 32),
(58, 'Kpxqnsaw', 28),
(59, 'Ilgwqneu', 65),
(60, 'Gnvnfnvs', 1),
(61, 'Xocshjwg', 43),
(62, 'Jxnxyyyu', 13),
(63, 'Nbtqysvx', 10),
(64, 'Xctonyfc', 64),
(65, 'Gmquaehk', 18),
(66, 'Ajuveazw', 32),
(67, 'Pqitvxal', 12),
(68, 'Lebhfhsu', 51),
(69, 'Gezmlsgb', 40),
(70, 'Qouhblcd', 29),
(71, 'Qxstpuel', 54),
(72, 'Lxficktn', 32),
(73, 'Peqdvpqh', 40),
(74, 'Zexaipah', 31),
(75, 'Hcpsuunh', 64),
(76, 'Qmlsilhd', 51),
(77, 'Hecwapzz', 5),
(78, 'Ikbbcihn', 55),
(79, 'Ifcxfhud', 23),
(80, 'Evexnxwp', 31),
(81, 'Ktmcdjmh', 69),
(82, 'Adqvfobt', 43),
(83, 'Twaqadth', 9),
(84, 'Uomqtwcx', 15),
(85, 'Izxeqblz', 43),
(86, 'Cshgjbgd', 63),
(87, 'Alfsvdba', 56),
(88, 'Znplndek', 42),
(89, 'Txjaclwc', 54),
(90, 'Pqjyozfd', 1),
(91, 'Qgfjevnd', 5),
(92, 'Zqgivguc', 14),
(93, 'Rvaeipaj', 50),
(94, 'Mgvhcmfp', 30),
(95, 'Gyzevpnt', 13),
(96, 'Saxnvppc', 49),
(97, 'Etgblavc', 4),
(98, 'Ynvqpbon', 67),
(99, 'Fhsuuqen', 41),
(100, 'Iysskvbs', 33);

-- --------------------------------------------------------

--
-- Структура таблицы `drug_order`
--

CREATE TABLE `drug_order` (
  `drug_order_id` int(11) UNSIGNED NOT NULL,
  `consignment_id` int(11) UNSIGNED NOT NULL,
  `dealer_id` int(11) UNSIGNED NOT NULL,
  `pharmacy_id` int(11) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL,
  `drug_order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `drug_order`
--

INSERT INTO `drug_order` (`drug_order_id`, `consignment_id`, `dealer_id`, `pharmacy_id`, `quantity`, `drug_order_date`) VALUES
(1, 59, 24, 41, 1944, '2014-04-12'),
(2, 71, 66, 17, 5148, '2011-03-18'),
(3, 39, 44, 4, 5245, '2016-03-20'),
(4, 10, 29, 16, 5496, '2017-02-16'),
(5, 3, 7, 24, 52, '2015-03-25'),
(6, 30, 42, 19, 4267, '2009-02-12'),
(7, 44, 32, 28, 2594, '2015-03-15'),
(8, 82, 77, 40, 4058, '2017-02-12'),
(9, 9, 57, 57, 976, '2018-02-17'),
(10, 96, 9, 53, 2293, '2015-03-17'),
(11, 59, 4, 41, 5618, '2014-03-25'),
(12, 76, 68, 11, 3093, '2016-02-16'),
(13, 38, 85, 12, 139, '2011-02-19'),
(14, 22, 60, 35, 5664, '2012-03-18'),
(15, 29, 73, 79, 4580, '2014-02-21'),
(16, 94, 65, 42, 1015, '2013-03-23'),
(17, 60, 55, 97, 1388, '2016-03-20'),
(18, 66, 17, 85, 4683, '2015-04-17'),
(19, 23, 21, 34, 518, '2014-02-14'),
(20, 55, 39, 27, 1143, '2017-04-22'),
(21, 92, 81, 28, 5895, '2018-03-16'),
(22, 26, 27, 54, 5448, '2009-02-16'),
(23, 67, 35, 75, 4314, '2015-03-20'),
(24, 67, 10, 46, 5933, '2013-02-12'),
(25, 87, 58, 26, 3324, '2009-04-17'),
(26, 9, 60, 75, 5645, '2014-03-12'),
(27, 34, 87, 35, 719, '2013-03-21'),
(28, 39, 1, 86, 1696, '2010-04-24'),
(29, 51, 29, 89, 3767, '2014-03-21'),
(30, 68, 41, 1, 4625, '2010-02-23'),
(31, 7, 80, 81, 3841, '2011-02-21'),
(32, 76, 89, 19, 1557, '2011-02-23'),
(33, 19, 45, 69, 729, '2013-04-16'),
(34, 76, 71, 27, 1152, '2017-04-16'),
(35, 56, 84, 56, 1454, '2013-02-21'),
(36, 71, 55, 59, 1969, '2010-04-25'),
(37, 6, 27, 16, 20, '2013-02-14'),
(38, 13, 9, 9, 891, '2014-04-17'),
(39, 87, 62, 49, 3613, '2013-02-17'),
(40, 42, 34, 43, 920, '2014-02-12'),
(41, 31, 56, 88, 4490, '2018-04-17'),
(42, 65, 34, 74, 4248, '2015-03-24'),
(43, 22, 82, 45, 4894, '2011-04-19'),
(44, 9, 96, 54, 4802, '2015-03-17'),
(45, 44, 31, 22, 1170, '2015-02-14'),
(46, 38, 35, 60, 5692, '2009-02-16'),
(47, 66, 29, 46, 2682, '2010-02-14'),
(48, 51, 10, 93, 2232, '2018-04-13'),
(49, 77, 22, 75, 811, '2014-03-13'),
(50, 63, 48, 47, 5492, '2017-04-25'),
(51, 88, 30, 84, 1911, '2018-03-18'),
(52, 62, 53, 76, 1401, '2010-02-14'),
(53, 15, 19, 48, 5043, '2011-04-21'),
(54, 63, 22, 16, 782, '2017-03-22'),
(55, 51, 83, 62, 3691, '2016-04-19'),
(56, 59, 63, 36, 5502, '2013-02-22'),
(57, 12, 73, 34, 2855, '2015-03-25'),
(58, 79, 92, 25, 2675, '2014-04-22'),
(59, 80, 26, 87, 3710, '2014-03-14'),
(60, 89, 94, 2, 1611, '2016-03-22'),
(61, 53, 79, 39, 3341, '2012-03-22'),
(62, 3, 33, 58, 5590, '2009-02-12'),
(63, 66, 38, 90, 2216, '2017-03-16'),
(64, 60, 89, 69, 4590, '2011-03-24'),
(65, 1, 76, 80, 4414, '2016-04-14'),
(66, 78, 41, 71, 2044, '2013-02-24'),
(67, 41, 65, 1, 508, '2014-02-17'),
(68, 65, 49, 49, 27, '2013-02-14'),
(69, 17, 27, 83, 2128, '2016-03-12'),
(70, 83, 22, 57, 1350, '2015-04-20'),
(71, 3, 92, 54, 5706, '2017-02-18'),
(72, 18, 39, 40, 4917, '2009-04-15'),
(73, 48, 15, 28, 5731, '2009-02-20'),
(74, 45, 6, 92, 2805, '2013-03-22'),
(75, 23, 30, 81, 1019, '2014-03-20'),
(76, 48, 18, 45, 4339, '2016-04-15'),
(77, 58, 55, 2, 2459, '2018-02-23'),
(78, 24, 72, 90, 2245, '2017-03-17'),
(79, 21, 21, 44, 3361, '2014-02-22'),
(80, 96, 14, 75, 2340, '2012-04-25'),
(81, 61, 90, 69, 4547, '2011-04-24'),
(82, 65, 6, 30, 1897, '2012-03-16'),
(83, 57, 94, 99, 869, '2011-04-25'),
(84, 49, 32, 11, 3446, '2013-04-17'),
(85, 89, 64, 53, 4233, '2009-03-22'),
(86, 31, 85, 36, 1208, '2009-04-15'),
(87, 41, 78, 71, 1204, '2010-02-25'),
(88, 87, 36, 19, 5018, '2012-03-22'),
(89, 24, 55, 2, 2536, '2018-04-21'),
(90, 13, 79, 58, 3033, '2011-03-13'),
(91, 7, 68, 20, 5733, '2017-04-17'),
(92, 99, 11, 58, 3338, '2018-03-16'),
(93, 82, 2, 58, 5165, '2013-04-18'),
(94, 93, 7, 51, 2215, '2015-03-21'),
(95, 32, 59, 99, 1089, '2009-04-13'),
(96, 92, 3, 34, 3740, '2017-03-13'),
(97, 69, 66, 25, 1582, '2013-04-18'),
(98, 40, 48, 19, 2994, '2009-04-23'),
(99, 31, 2, 15, 4085, '2009-02-25'),
(100, 70, 47, 24, 4786, '2016-02-12');

-- --------------------------------------------------------

--
-- Структура таблицы `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) UNSIGNED NOT NULL,
  `pharmacy_name` varchar(255) NOT NULL,
  `pharmacy_addres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_id`, `pharmacy_name`, `pharmacy_addres`) VALUES
(1, 'Dhaimncw', 'Aqzcokjp'),
(2, 'Yxeeipbn', 'Jfctkvzl'),
(3, 'Fuihixoz', 'Hmncattm'),
(4, 'Byoxwofl', 'Omumyjbb'),
(5, 'Fxwnbusf', 'Aioujlby'),
(6, 'Ozhnqpdw', 'Yajsnjhi'),
(7, 'Uykeokhg', 'Kesbetdk'),
(8, 'Qxeejuuq', 'Widqvhvi'),
(9, 'Cnjgebwd', 'Ccdkqwmu'),
(10, 'Nhxepywp', 'Hsqdtkee'),
(11, 'Xzgegeqb', 'Njhkdkeb'),
(12, 'Jsjsoobs', 'Jefdzlhe'),
(13, 'Zldmwzgh', 'Stniclas'),
(14, 'Ldiezkdi', 'Iovmxbnn'),
(15, 'Anofjdez', 'Wjgfiyud'),
(16, 'Fqeitqaf', 'Ajtsjeew'),
(17, 'Xwqmpmpn', 'Vpnukqbg'),
(18, 'Ffnxyage', 'Bvaqconx'),
(19, 'Xwofkkut', 'Imkmgudj'),
(20, 'Mfohston', 'Wwqpbmhx'),
(21, 'Tzpcqwjj', 'Tpsvapwp'),
(22, 'Jazwlonw', 'Sazvejjs'),
(23, 'Nmvqeoqq', 'Ezliexak'),
(24, 'Wfmezyql', 'Ifdzljnn'),
(25, 'Btptyjcj', 'Oqpcpuba'),
(26, 'Wizzabfw', 'Ruxfgsvz'),
(27, 'Kdmanesq', 'Bgeddftd'),
(28, 'Koqmlwam', 'Hblzoujn'),
(29, 'Klcaxlol', 'Nfpjbfxv'),
(30, 'Lsijxlng', 'Rqcomuoh'),
(31, 'Wjjqdsgc', 'Tksmemxc'),
(32, 'Upqlfsxj', 'Fvqqfflo'),
(33, 'Kkwdylii', 'Snnzisqa'),
(34, 'Fyexdxbo', 'Suxcuebe'),
(35, 'Ulsioeuy', 'Ivcawdfe'),
(36, 'Slenbvve', 'Zucawhud'),
(37, 'Hbmfocwb', 'Rdqwkjef'),
(38, 'Dzlijuwa', 'Kbayocuq'),
(39, 'Tvzjynuk', 'Qxeslbbc'),
(40, 'Jmjjuvsd', 'Lxdxglme'),
(41, 'Hzbjqbje', 'Hjzwizzy'),
(42, 'Vhyudjin', 'Rwgqliju'),
(43, 'Xcwydunh', 'Xpfjeulu'),
(44, 'Sciiqfdc', 'Bynumyit'),
(45, 'Vwujnkpq', 'Npmnflez'),
(46, 'Wievohub', 'Awizaaet'),
(47, 'Gblcenca', 'Riqfdcbb'),
(48, 'Bbfulsjo', 'Szemifct'),
(49, 'Pqjzssku', 'Wxzcpqkd'),
(50, 'Mxcwyfgp', 'Dyivbxgq'),
(51, 'Ivbykgbo', 'Obegcwal'),
(52, 'Eoehvkly', 'Lkeeulvv'),
(53, 'Sbchfeej', 'Hkftdkqy'),
(54, 'Tzspxsuw', 'Xxtdkqxs'),
(55, 'Vanpjcks', 'Hkdmyhso'),
(56, 'Uemzkchd', 'Upqkency'),
(57, 'Jaytwefn', 'Aotbceev'),
(58, 'Czozdsfx', 'Zblasmkl'),
(59, 'Zsnmwyah', 'Jbdmcyjc'),
(60, 'Joqntfug', 'Zcmdhcnk'),
(61, 'Kxeeidez', 'Yubweicm'),
(62, 'Bymquxgo', 'Akxjcktn'),
(63, 'Jfbpwmup', 'Msazxmum'),
(64, 'Zmnfjfyb', 'Njiljkzs'),
(65, 'Otztsgfj', 'Cmbwfjev'),
(66, 'Qekzuyke', 'Okhgjbfx'),
(67, 'Yyvifbpx', 'Suvsetft'),
(68, 'Fszsqdqu', 'Dhyyudgy'),
(69, 'Zbilhdwv', 'Masjuvti'),
(70, 'Ismhzafz', 'Isnmumdf'),
(71, 'Pjzxmsci', 'Ldleevqe'),
(72, 'Miexajso', 'Ofizxoda'),
(73, 'Snjggllv', 'Xydtilft'),
(74, 'Emapxtba', 'Whxstedq'),
(75, 'Stqwjimm', 'Wxaggmsb'),
(76, 'Eteszspw', 'Ofjfxxug'),
(77, 'Yzaethdu', 'Qsqdqxpi'),
(78, 'Uxeddgwq', 'Ntepnuih'),
(79, 'Likaxjfa', 'Iqeyhoxw'),
(80, 'Oeeieung', 'Txhtwdbv'),
(81, 'Buvsdmzm', 'Kebimlsh'),
(82, 'Hpcshjwh', 'Uawddgvk'),
(83, 'Nkkxgpff', 'Lexpgkjn'),
(84, 'Mxzipagg', 'Obopgoaj'),
(85, 'Uygkjnlu', 'Mdgwnanq'),
(86, 'Mqqhoyyz', 'Zywnxycq'),
(87, 'Vieulvxy', 'Comtilgy'),
(88, 'Zbhgkhgi', 'Vhxqovjm'),
(89, 'Iduktmdi', 'Dtilftbc'),
(90, 'Ikynvmbs', 'Juvsdmzo'),
(91, 'Vncwcxhp', 'Dxctonve'),
(92, 'Wickeggk', 'Gbpvgtcd'),
(93, 'Ltktpudf', 'Sxjdnfny'),
(94, 'Fgqiwfls', 'Cmbutjoe'),
(95, 'Sqzyuceo', 'Fjgbqzbg'),
(96, 'Fegvifzh', 'Nukoesnj'),
(97, 'Jtoqnpkh', 'Hmpmomew'),
(98, 'Hytyowqe', 'Jwhvguel'),
(99, 'Tmdgtcci', 'Jwfjgedd'),
(100, 'Jhjxnulx', 'Ctnhywmv');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `company_name` (`company_name`) USING BTREE;

--
-- Индексы таблицы `consignment`
--
ALTER TABLE `consignment`
  ADD PRIMARY KEY (`consignment_id`),
  ADD KEY `drug_id` (`drug_id`) USING BTREE,
  ADD KEY `company_id` (`company_id`);

--
-- Индексы таблицы `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`dealer_id`),
  ADD UNIQUE KEY `dealer_phone_number` (`dealer_phone_number`) USING BTREE,
  ADD KEY `company_id` (`company_id`) USING BTREE,
  ADD KEY `dealer_surname` (`dealer_surname`) USING BTREE;

--
-- Индексы таблицы `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`),
  ADD UNIQUE KEY `drug_name` (`drug_name`) USING BTREE;

--
-- Индексы таблицы `drug_order`
--
ALTER TABLE `drug_order`
  ADD PRIMARY KEY (`drug_order_id`),
  ADD KEY `consignment_id` (`consignment_id`) USING BTREE,
  ADD KEY `pharmacy_id` (`pharmacy_id`) USING BTREE,
  ADD KEY `dealer_id` (`dealer_id`) USING BTREE;

--
-- Индексы таблицы `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `consignment`
--
ALTER TABLE `consignment`
  MODIFY `consignment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `dealer`
--
ALTER TABLE `dealer`
  MODIFY `dealer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `drug`
--
ALTER TABLE `drug`
  MODIFY `drug_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `drug_order`
--
ALTER TABLE `drug_order`
  MODIFY `drug_order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `consignment`
--
ALTER TABLE `consignment`
  ADD CONSTRAINT `consignment_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consignment_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dealer`
--
ALTER TABLE `dealer`
  ADD CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `drug_order`
--
ALTER TABLE `drug_order`
  ADD CONSTRAINT `drug_order_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `dealer` (`dealer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_order_ibfk_3` FOREIGN KEY (`consignment_id`) REFERENCES `consignment` (`consignment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_order_ibfk_4` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
