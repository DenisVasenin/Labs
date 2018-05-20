-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 06 2018 г., 15:55
-- Версия сервера: 10.1.29-MariaDB-6
-- Версия PHP: 7.2.4-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rental`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`user`@`localhost` PROCEDURE `FillCustomerTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO customer
        VALUES (
            NULL, 
            GetRandomString(8), 
            GetRandomString(12), 
            @recordCounter, 
            GetRandomDate(1980, 2020)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillDvdTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO dvd
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomNumber(1950, 2050)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillOfferTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO offer
        VALUES (
            NULL, 
            GetRandomNumber(1, 10), 
            GetRandomNumber(1, 10), 
            GetRandomDate(1980, 2000), 
            GetRandomDate(2000, 2020)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

--
-- Функции
--
CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomDate` (`startYear` INT, `lastYear` INT) RETURNS DATE RETURN MAKEDATE(GetRandomNumber(startYear, lastYear), GetRandomNumber(1, 365))$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomNumber` (`startPos` INT, `lastPos` INT) RETURNS INT(11) RETURN FLOOR(RAND() * (lastPos + 1 - startPos)) + startPos$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomString` (`stringLength` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
    SET @str := '';
    SET @symbolCounter := 0;
    WHILE (@symbolCounter < stringLength) DO
        SET @str := CONCAT(@str, SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', GetRandomNumber(1, 26), 1));
        SET @symbolCounter := @symbolCounter + 1;
    END WHILE;
    RETURN @str;
END$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomYear` (`startYear` INT, `positiveInterval` INT) RETURNS INT(4) RETURN FLOOR(startYear + RAND() * positiveInterval)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passport_code` int(11) UNSIGNED NOT NULL,
  `registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `passport_code`, `registration_date`) VALUES
(1, 'DFOGPDVW', 'UHCPQMKPSVBV', 0, '1985-12-05'),
(2, 'YISRHHOA', 'KWEIDQUCCGWO', 1, '1984-02-22'),
(3, 'CEQPAKAT', 'SGGKHEAPWOGO', 2, '2000-01-14'),
(4, 'LQXQLIGJ', 'CHFCYMMZOSZV', 3, '2014-01-20'),
(5, 'BRHMLVUM', 'BWFIBILFUFVJ', 4, '1989-06-24'),
(6, 'TBZSOUDL', 'SIMLUPQLERTV', 5, '2019-11-25'),
(7, 'EZHNSZUZ', 'QCQXOCTLCAWE', 6, '1992-05-15'),
(8, 'LIIOXUFU', 'FRTTLZOUKORS', 7, '1987-06-16'),
(9, 'NANOEFMV', 'RXLMCBAVEJJQ', 8, '2006-02-10'),
(10, 'XPFGSSNJ', 'GFGSTORPAHLI', 9, '2004-04-27'),
(11, 'BLBAXMPP', 'EBUUQSTOOANO', 10, '1982-02-21'),
(12, 'XKHDXAKB', 'YQHQGIWHYWLP', 11, '1996-08-18'),
(13, 'CJLDLRBJ', 'NPKFUJNMWULV', 12, '1990-09-27'),
(14, 'BMFQPAJR', 'HJBETDNFNZGK', 13, '2016-03-21'),
(15, 'UIGGLMDG', 'VLRACJPVKLCC', 14, '2019-04-04'),
(16, 'AGECAVCA', 'UXBRCNHVHBHK', 15, '2020-01-11'),
(17, 'UCCDIIRH', 'NRUZOTENEFQO', 16, '1992-10-15'),
(18, 'FCXEGQKF', 'UIHLLTKXEGQK', 17, '2010-03-13'),
(19, 'CJLCFUHA', 'GEFNWWTBBFVL', 18, '1992-09-19'),
(20, 'JZRORUVW', 'TGAJUWYDWWSY', 19, '2015-07-12'),
(21, 'TCGYZDTF', 'YZEUOJCMCAXJ', 20, '1994-02-01'),
(22, 'OUDKONZI', 'SNODBXGQISQC', 21, '2003-08-01'),
(23, 'ECATRCLX', 'EFPHRNPMMBTR', 22, '1997-02-03'),
(24, 'WCXECCCF', 'SYNWRTVVPNWU', 23, '1993-05-06'),
(25, 'QEZIUWAK', 'CEQPCTLYIWIZ', 24, '1990-01-19'),
(26, 'CSHIUZMM', 'YFIXPHOBMHAG', 25, '1997-03-31'),
(27, 'KRGDYHOZ', 'HMOJETGAJRHJ', 26, '1989-01-28'),
(28, 'YAFCWYEC', 'YLIJVBSMICMB', 27, '2008-12-25'),
(29, 'OPKFUJJU', 'XBQZBJRFBPXQ', 28, '1998-06-20'),
(30, 'XBRFCTKW', 'DATPUELSGBQA', 29, '2016-03-13'),
(31, 'WTAYOAIR', 'JUXECYJBETGY', 30, '2015-12-07'),
(32, 'OCXGLNGQ', 'OUFVJMGWNAPV', 31, '2003-06-01'),
(33, 'PJYQKAZU', 'BWEIAEUKTMEL', 32, '2020-08-28'),
(34, 'XROVKOQK', 'CJOPJYSQBKUS', 33, '1980-03-24'),
(35, 'JUVTIJWE', 'JFZGHSSKYMNF', 34, '2017-07-08'),
(36, 'BPRRKXHT', 'XIUBXJERXOAL', 35, '1995-02-20'),
(37, 'LBXKJQAH', 'ISPVJHKFUIHK', 36, '1996-02-10'),
(38, 'QAEWUKQZ', 'BGAKZSNPHTVX', 37, '2009-02-03'),
(39, 'HJWHUENZ', 'KBDMBUVTIHOU', 38, '2000-05-17'),
(40, 'ICNIDQTV', 'WWRVEHWPIXNY', 39, '2007-02-06'),
(41, 'CJQBIOVI', 'HLIJVBTONALD', 40, '2004-05-26'),
(42, 'TBXKJOSY', 'PECZQFDATRCK', 41, '1997-09-19'),
(43, 'YJDOKHGL', 'LUTHHPZFDCYO', 42, '2011-11-20'),
(44, 'FSXJDQUB', 'YNTGXWNZKAWI', 43, '2017-12-22'),
(45, 'STRBIMIG', 'EFMTIJWFLOMS', 44, '2008-03-03'),
(46, 'YQKDKPVH', 'XSWDEKMDIDSC', 45, '2012-05-31'),
(47, 'RYRQDSET', 'DNGPGMQSPYWP', 46, '2019-05-10'),
(48, 'UZQGGNWT', 'FSZTUTIKZRMK', 47, '2009-08-05'),
(49, 'WCWANPLL', 'URBGDVVPNWSA', 48, '2014-12-27'),
(50, 'FQLIIQEX', 'DWXAGHSSJTRD', 49, '2001-08-01'),
(51, 'XWSYOBMI', 'CNHXROWPMNGQ', 50, '1988-06-02'),
(52, 'TFTBCJLE', 'NCXFJGDXEASM', 51, '2015-04-07'),
(53, 'NBTNJHHR', 'KDIGGLNIYWNX', 52, '1998-01-14'),
(54, 'CEQOWQOZ', 'DVQQKCGXWOEF', 53, '1981-07-13'),
(55, 'NPKDMCYN', 'TEOKGZGHQHOZ', 54, '1982-03-16'),
(56, 'TOLPSUSF', 'YDUMATPWKMCE', 55, '2019-06-29'),
(57, 'JXLLZOWO', 'FJHIUZNSXMQR', 56, '1998-06-28'),
(58, 'TKSMDIFC', 'XDAQFDARGHSQ', 57, '1990-01-10'),
(59, 'FHVHXSUX', 'DXBQACOKINPI', 58, '2013-12-20'),
(60, 'EKONZJWF', 'KMBZSQZZYWNZ', 59, '2002-04-18'),
(61, 'XWRTTNHZ', 'XQNQRNMWXWSZ', 60, '2019-10-15'),
(62, 'KESXMSBD', 'MZOTCFVOGNYB', 61, '1985-06-16'),
(63, 'IFCWYDXC', 'TMEJGGKJNODD', 62, '1993-02-19'),
(64, 'GIUZMPLL', 'XFHWJGGKJQBK', 63, '2007-10-08'),
(65, 'BFZFDBWE', 'FQMLWAMIEVTE', 64, '2020-09-15'),
(66, 'UYHTURBF', 'WSXLMEICNICO', 65, '1996-05-30'),
(67, 'VVSBEPOA', 'JTQXRQCRAACJ', 66, '2007-07-19'),
(68, 'RISOQOUG', 'YAGCVVSBFTFV', 67, '1987-07-18'),
(69, 'HVJHKCGA', 'GGMQUCBZTUTK', 68, '1999-09-26'),
(70, 'CEOEHYUD', 'HBLAVAQCQXNX', 69, '2017-12-02'),
(71, 'WODBVBTO', 'NANLTLWCUULW', 70, '2007-01-22'),
(72, 'EYBNLRCJ', 'PWPJAZWLPPGL', 71, '1984-06-28'),
(73, 'CEMYFHUA', 'UVTJQYUDGYYV', 72, '1988-05-02'),
(74, 'AMJLCDJN', 'JJRHMLUPSSLA', 73, '1981-10-28'),
(75, 'TRDRZXLQ', 'VEJHKERUXGKJ', 74, '2010-07-25'),
(76, 'AVCYMPOA', 'JSPUDHZCOMUJ', 75, '2015-08-09'),
(77, 'OCVXBNMX', 'ZGIWIZXPJZUY', 76, '1982-05-17'),
(78, 'DPMSCKSG', 'FHVEMYEDBWGP', 77, '1983-03-01'),
(79, 'XJAZXMTK', 'QZBKTPTXGNYD', 78, '2011-11-01'),
(80, 'IHOYBLYM', 'OJCJORQFCVWU', 79, '2007-05-29'),
(81, 'CMFNZKZS', 'QZAEVRTUSFXV', 80, '2019-06-29'),
(82, 'HQFGOBOQ', 'NSXNVQPBOQLH', 81, '2004-01-31'),
(83, 'TYJDPOZH', 'NRXLLXFIYVGU', 82, '2008-03-20'),
(84, 'WHSVXDVV', 'POYBLCEPJDPP', 83, '1986-03-13'),
(85, 'FPGOAJUX', 'FFNZHOWSXKJN', 84, '2019-07-02'),
(86, 'IUXFGSUT', 'JQAEXYCNJGEB', 85, '1988-11-19'),
(87, 'ICNFODZL', 'HDWWTFRVEHZZ', 86, '2016-12-17'),
(88, 'NAMLRBIK', 'BAYSRHLGZCMG', 87, '1981-10-03'),
(89, 'WHVIBKWB', 'TNJEXXUHAILI', 88, '2008-05-04'),
(90, 'LBZRNOEE', 'JIOTAYPGLJNO', 89, '2007-04-13'),
(91, 'OUHZCNKI', 'LGZEWVMZMKOQ', 90, '1991-06-07'),
(92, 'DWXWRRMI', 'DSETEQPECWAN', 91, '2019-07-01'),
(93, 'IUYJYSQD', 'RYSSKXHUATQY', 92, '1993-11-01'),
(94, 'EWWQQIRI', 'RLDJKXJDNFOC', 93, '2008-10-15'),
(95, 'BHFDEJIM', 'OFJILGWRSMID', 94, '2018-08-29'),
(96, 'STRCNFNY', 'GJDQQGLMCZRI', 95, '2002-09-19'),
(97, 'RPZDTJOS', 'XIZZWKLZRIOX', 96, '1989-10-14'),
(98, 'VJMEMVQV', 'FOFKJPWQMNCZ', 97, '2014-07-19'),
(99, 'OEICOLPQ', 'JZTVWWRUZOUJ', 98, '2008-05-07'),
(100, 'KXKIIRMH', 'BLASOPIYQIUX', 99, '1995-03-23');

-- --------------------------------------------------------

--
-- Структура таблицы `dvd`
--

CREATE TABLE `dvd` (
  `dvd_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `production_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `dvd`
--

INSERT INTO `dvd` (`dvd_id`, `title`, `production_year`) VALUES
(1, 'REYC', 2020),
(2, 'EWSB', 1961),
(3, 'KPXP', 1981),
(4, 'UYJC', 1978),
(5, 'DXCU', 2005),
(6, 'KMCB', 2045),
(7, 'PEAQ', 1964),
(8, 'TJPY', 2034),
(9, 'KLAS', 2006),
(10, 'QOUI', 1968),
(11, 'ALGW', 2010),
(12, 'KGYB', 1986),
(13, 'RGHR', 1998),
(14, 'KNLS', 1971),
(15, 'XYXT', 1959),
(16, 'EOIY', 2026),
(17, 'YKFV', 1996),
(18, 'WYBM', 1980),
(19, 'BIMJ', 1992),
(20, 'ZTSH', 1984),
(21, 'WFNX', 1952),
(22, 'KYNT', 1969),
(23, 'SYRL', 1978),
(24, 'BLBX', 1995),
(25, 'MBUV', 2030),
(26, 'MYHR', 2003),
(27, 'PKFU', 1982),
(28, 'GJAB', 1974),
(29, 'AIPB', 1990),
(30, 'WEFO', 1970),
(31, 'HXPI', 2032),
(32, 'CCCE', 2004),
(33, 'GPHR', 1998),
(34, 'JLAW', 1967),
(35, 'HZYW', 2001),
(36, 'XBPV', 1981),
(37, 'CMDG', 2042),
(38, 'UCGY', 2046),
(39, 'YVHB', 1990),
(40, 'VXAL', 1970),
(41, 'QNSA', 2049),
(42, 'WHYU', 1963),
(43, 'HBJU', 2021),
(44, 'GBQA', 1972),
(45, 'ZHLI', 1982),
(46, 'QDWV', 2011),
(47, 'NVND', 1954),
(48, 'WEHY', 2033),
(49, 'HADQ', 2024),
(50, 'VXAL', 1959),
(51, 'ENCY', 1995),
(52, 'KQZB', 1975),
(53, 'DZKC', 1985),
(54, 'KZTT', 1994),
(55, 'ZPDT', 1991),
(56, 'URBG', 1963),
(57, 'WXYB', 1996),
(58, 'CCDK', 2005),
(59, 'PKDN', 1959),
(60, 'YNTF', 2033),
(61, 'LVSD', 2003),
(62, 'FNYC', 2023),
(63, 'ILFU', 1973),
(64, 'VKMG', 2034),
(65, 'KMDI', 1962),
(66, 'SDOJ', 1973),
(67, 'AKZR', 1995),
(68, 'FSXJ', 1956),
(69, 'GDYI', 2028),
(70, 'XFKH', 1974),
(71, 'JBGD', 2037),
(72, 'YBNK', 1990),
(73, 'VANQ', 2008),
(74, 'ZEXY', 1956),
(75, 'MGUC', 1975),
(76, 'YXTC', 1959),
(77, 'GXSZ', 2027),
(78, 'WYEC', 2041),
(79, 'GPCV', 2022),
(80, 'ETEP', 2001),
(81, 'TEPL', 1995),
(82, 'YJBC', 1986),
(83, 'MJIP', 2042),
(84, 'VLTJ', 2013),
(85, 'AEXX', 2042),
(86, 'UHAG', 1965),
(87, 'ASKX', 1978),
(88, 'TWBR', 1973),
(89, 'DAQF', 1961),
(90, 'XFKH', 1976),
(91, 'LLVV', 2010),
(92, 'OYDV', 2029),
(93, 'KRBJ', 2016),
(94, 'EYDV', 2017),
(95, 'YROV', 2000),
(96, 'YHMQ', 2022),
(97, 'REWW', 2024),
(98, 'BCJM', 1989),
(99, 'MDHD', 2016),
(100, 'YTYM', 2001);

-- --------------------------------------------------------

--
-- Структура таблицы `offer`
--

CREATE TABLE `offer` (
  `offer_id` int(11) UNSIGNED NOT NULL,
  `dvd_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_id` int(11) UNSIGNED DEFAULT NULL,
  `offer_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `offer`
--

INSERT INTO `offer` (`offer_id`, `dvd_id`, `customer_id`, `offer_date`, `return_date`) VALUES
(1, 3, 10, '1990-04-19', '2011-08-09'),
(2, 9, 5, '1992-01-06', '2002-12-26'),
(3, 6, 5, '1980-09-08', '2008-02-06'),
(4, 8, 4, '1994-07-16', '2003-11-06'),
(5, 3, 9, '1982-07-18', '2001-11-18'),
(6, 9, 9, '1993-08-14', '2000-05-23'),
(7, 9, 4, '1988-04-27', '2008-02-16'),
(8, 6, 5, '1997-11-11', '2015-08-27'),
(9, 7, 1, '1992-02-14', '2007-08-19'),
(10, 10, 5, '1999-06-12', '2020-05-11'),
(11, 9, 2, '1986-05-12', '2007-06-16'),
(12, 5, 1, '1990-12-05', '2009-10-20'),
(13, 9, 1, '1981-06-03', '2006-02-08'),
(14, 3, 3, '1988-08-24', '2008-02-17'),
(15, 7, 1, '1988-04-23', '2016-12-28'),
(16, 1, 10, '1980-05-09', '2011-02-18'),
(17, 4, 1, '1993-02-24', '2004-10-30'),
(18, 5, 8, '1983-07-04', '2005-05-13'),
(19, 4, 8, '1984-11-27', '2002-05-08'),
(20, 5, 9, '1996-01-31', '2003-09-18'),
(21, 8, 4, '1995-05-07', '2014-07-28'),
(22, 8, 7, '1994-11-30', '2009-09-15'),
(23, 2, 5, '2000-08-26', '2001-01-06'),
(24, 5, 8, '2000-08-29', '2011-11-24'),
(25, 1, 8, '1993-08-05', '2007-06-18'),
(26, 5, 1, '1999-01-08', '2020-07-18'),
(27, 2, 10, '1988-04-01', '2000-03-30'),
(28, 4, 9, '1990-03-25', '2014-11-06'),
(29, 1, 10, '2018-11-26', '2019-11-26'),
(30, 1, 4, '1997-10-19', '2005-10-01'),
(31, 1, 4, '1981-08-12', '2004-06-25'),
(32, 7, 7, '1984-03-24', '2004-05-14'),
(33, 10, 2, '2018-12-21', '2019-10-16'),
(34, 3, 6, '1994-01-31', '2011-02-10'),
(35, 4, 3, '1983-12-18', '2008-12-24'),
(36, 1, 9, '1988-03-07', '2003-06-22'),
(37, 4, 3, '1997-05-03', '2016-04-09'),
(38, 2, 3, '1999-12-11', '2006-10-27'),
(39, 1, 6, '1987-05-23', '2017-07-30'),
(40, 5, 9, '1997-08-27', '2011-03-19'),
(41, 2, 2, '1990-03-07', '2006-12-17'),
(42, 7, 3, '1980-05-09', '2002-01-14'),
(43, 6, 3, '1995-09-13', '2012-07-23'),
(44, 4, 10, '1991-09-05', '2019-09-19'),
(45, 6, 8, '1997-03-19', '2017-06-17'),
(46, 8, 5, '1990-12-25', '2002-07-10'),
(47, 1, 9, '1986-03-09', '2010-02-04'),
(48, 2, 3, '1997-09-11', '2012-01-03'),
(49, 9, 6, '1999-05-04', '2010-08-29'),
(50, 5, 10, '1986-06-17', '2007-04-10'),
(51, 1, 2, '1996-08-27', '2005-12-01'),
(52, 5, 8, '1997-03-20', '2008-08-02'),
(53, 3, 1, '1980-06-02', '2017-10-10'),
(54, 9, 10, '1981-12-23', '2007-07-10'),
(55, 2, 7, '1982-10-22', '2006-02-14'),
(56, 1, 6, '1987-08-14', '2010-11-30'),
(57, 9, 6, '1985-05-23', '2008-01-11'),
(58, 1, 8, '1986-12-07', '2007-08-22'),
(59, 8, 9, '1985-12-20', '2006-06-02'),
(60, 3, 4, '1996-12-15', '2011-12-22'),
(61, 9, 8, '1990-02-28', '2014-01-17'),
(62, 5, 10, '1980-05-09', '2004-01-21'),
(63, 9, 8, '1982-04-19', '2001-09-06'),
(64, 3, 1, '1988-07-04', '2003-06-24'),
(65, 5, 9, '1982-12-13', '2001-09-04'),
(66, 3, 3, '1998-04-27', '2017-07-03'),
(67, 8, 10, '1982-10-24', '2006-02-16'),
(68, 2, 7, '1989-02-07', '2001-11-16'),
(69, 8, 4, '1992-09-30', '2000-10-06'),
(70, 8, 9, '1995-01-31', '2007-07-10'),
(71, 2, 9, '1981-07-01', '2010-12-14'),
(72, 6, 5, '1984-07-07', '2003-07-28'),
(73, 3, 5, '1984-09-19', '2010-10-24'),
(74, 10, 4, '1993-12-12', '2016-05-02'),
(75, 9, 10, '1992-04-22', '2016-02-15'),
(76, 7, 7, '1995-07-24', '2003-01-31'),
(77, 6, 3, '1982-07-27', '2002-11-23'),
(78, 9, 1, '1984-09-03', '2001-12-07'),
(79, 7, 9, '1990-06-02', '2004-05-08'),
(80, 10, 10, '1995-02-18', '2007-04-27'),
(81, 9, 3, '1988-08-19', '2018-03-26'),
(82, 7, 9, '1989-12-21', '2002-04-15'),
(83, 7, 1, '2000-03-23', '2005-03-29'),
(84, 6, 9, '1992-11-05', '2001-05-14'),
(85, 4, 4, '1994-12-22', '2010-07-08'),
(86, 1, 7, '1994-02-17', '2008-02-05'),
(87, 7, 3, '1990-01-13', '2000-07-06'),
(88, 5, 4, '1990-07-15', '2015-11-04'),
(89, 3, 8, '1999-04-01', '2014-11-22'),
(90, 8, 6, '1992-06-04', '2015-09-14'),
(91, 6, 5, '1989-10-10', '2006-12-05'),
(92, 7, 5, '1994-06-06', '2010-02-08'),
(93, 2, 3, '1999-12-16', '2005-10-27'),
(94, 10, 10, '1994-11-30', '2010-09-17'),
(95, 3, 9, '1991-08-24', '2016-11-21'),
(96, 2, 5, '2018-08-19', '2020-09-30'),
(97, 6, 9, '1986-10-19', '2018-03-01'),
(98, 10, 9, '1999-09-18', '2007-06-02'),
(99, 6, 7, '1985-06-01', '2009-01-16'),
(100, 1, 1, '1989-02-18', '2015-10-25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `passport_code` (`passport_code`);

--
-- Индексы таблицы `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`dvd_id`);

--
-- Индексы таблицы `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`offer_id`),
  ADD KEY `dvd_id` (`dvd_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `dvd`
--
ALTER TABLE `dvd`
  MODIFY `dvd_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `offer`
--
ALTER TABLE `offer`
  MODIFY `offer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`dvd_id`) REFERENCES `dvd` (`dvd_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
