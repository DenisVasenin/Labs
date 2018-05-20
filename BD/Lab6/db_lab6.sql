-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 09 2018 г., 16:13
-- Версия сервера: 10.1.29-MariaDB-6
-- Версия PHP: 7.2.4-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab6`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`user`@`localhost` PROCEDURE `FillBookingTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO booking
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomDate(2016, 2016)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillClientTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO client
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomString(6), 
            GetRandomNumber(111111, 999999)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillHotelTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO hotel
        VALUES (
            NULL, 
            GetRandomString(4), 
            GetRandomNumber(1, 5), 
            GetRandomString(12)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillReservedRoomTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO reserved_room
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomNumber(1, 100), 
            GetRandomDate(2017, 2017), 
            GetRandomDate(2018, 2018)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillRoomKindTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO room_kind
        VALUES (
            NULL, 
            GetRandomCategory(), 
            GetRandomNumber(20, 500)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

CREATE DEFINER=`user`@`localhost` PROCEDURE `FillRoomTable` (`recordCount` INT)  BEGIN
    SET @recordCounter := 0;
    WHILE (@recordCounter < recordCount) DO
        INSERT INTO room
        VALUES (
            NULL, 
            GetRandomNumber(1, 100), 
            GetRandomNumber(1, 100), 
            @recordCounter, 
            GetRandomNumber(100, 1000)
        );
        SET @recordCounter := @recordCounter + 1;
    END WHILE;
END$$

--
-- Функции
--
CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomCategory` () RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
    SET @category = '';
    SET @rnd = GetRandomNumber(1, 2);
    CASE @rnd
      WHEN 1 THEN SET @category = 'lux';
      WHEN 2 THEN SET @category = 'econom';
      ELSE SET @category = 'error';
    END CASE;
    RETURN @category;
END$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomDate` (`startYear` INT, `lastYear` INT) RETURNS DATE RETURN MAKEDATE(GetRandomNumber(startYear, lastYear), GetRandomNumber(1, 365))$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomNumber` (`startNum` INT, `lastNum` INT) RETURNS INT(11) RETURN FLOOR(RAND() * (lastNum + 1 - startNum)) + startNum$$

CREATE DEFINER=`user`@`localhost` FUNCTION `GetRandomString` (`stringLength` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
    SET @str := '';
    SET @symbolCounter := 0;
    WHILE (@symbolCounter < stringLength) DO
        SET @str := CONCAT(@str, SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', GetRandomNumber(1, 26), 1));
        SET @symbolCounter := @symbolCounter + 1;
    END WHILE;
    RETURN @str;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE IF NOT EXIST `booking` (
  `booking_id` int(11) UNSIGNED NOT NULL,
  `client_id` int(11) UNSIGNED DEFAULT NULL,
  `booking_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `booking`
--

INSERT INTO `booking` (`booking_id`, `client_id`, `booking_date`) VALUES
(1, 100, '2016-01-14'),
(2, 90, '2016-11-05'),
(3, 32, '2016-11-14'),
(4, 44, '2016-12-07'),
(5, 7, '2016-03-14'),
(6, 49, '2016-12-18'),
(7, 99, '2016-10-15'),
(8, 62, '2016-02-04'),
(9, 82, '2016-03-16'),
(10, 34, '2016-11-29'),
(11, 4, '2016-07-03'),
(12, 62, '2016-10-19'),
(13, 40, '2016-07-02'),
(14, 9, '2016-06-26'),
(15, 36, '2016-04-21'),
(16, 32, '2016-04-01'),
(17, 75, '2016-10-20'),
(18, 62, '2016-09-02'),
(19, 53, '2016-02-07'),
(20, 37, '2016-01-08'),
(21, 100, '2016-12-10'),
(22, 81, '2016-11-09'),
(23, 77, '2016-03-14'),
(24, 4, '2016-01-02'),
(25, 50, '2016-10-16'),
(26, 94, '2016-04-09'),
(27, 5, '2016-06-26'),
(28, 11, '2016-08-03'),
(29, 42, '2016-02-29'),
(30, 35, '2016-01-06'),
(31, 18, '2016-10-06'),
(32, 14, '2016-10-30'),
(33, 20, '2016-10-02'),
(34, 73, '2016-01-14'),
(35, 91, '2016-06-30'),
(36, 44, '2016-10-22'),
(37, 32, '2016-05-05'),
(38, 82, '2016-09-30'),
(39, 30, '2016-07-16'),
(40, 52, '2016-01-29'),
(41, 4, '2016-08-09'),
(42, 85, '2016-06-08'),
(43, 91, '2016-08-02'),
(44, 38, '2016-03-10'),
(45, 59, '2016-06-01'),
(46, 47, '2016-04-12'),
(47, 26, '2016-03-24'),
(48, 17, '2016-09-10'),
(49, 89, '2016-06-15'),
(50, 70, '2016-08-25'),
(51, 88, '2016-11-10'),
(52, 90, '2016-05-16'),
(53, 84, '2016-08-07'),
(54, 70, '2016-12-30'),
(55, 45, '2016-07-26'),
(56, 80, '2016-06-16'),
(57, 24, '2016-05-22'),
(58, 11, '2016-09-28'),
(59, 86, '2016-01-05'),
(60, 48, '2016-11-20'),
(61, 37, '2016-10-21'),
(62, 26, '2016-06-27'),
(63, 89, '2016-06-01'),
(64, 92, '2016-04-05'),
(65, 9, '2016-09-05'),
(66, 77, '2016-05-07'),
(67, 17, '2016-07-04'),
(68, 70, '2016-05-01'),
(69, 92, '2016-11-06'),
(70, 89, '2016-12-24'),
(71, 26, '2016-07-22'),
(72, 47, '2016-03-20'),
(73, 91, '2016-05-22'),
(74, 1, '2016-04-29'),
(75, 13, '2016-09-27'),
(76, 48, '2016-05-16'),
(77, 6, '2016-12-13'),
(78, 20, '2016-02-28'),
(79, 53, '2016-01-02'),
(80, 29, '2016-01-22'),
(81, 99, '2016-08-23'),
(82, 34, '2016-11-30'),
(83, 16, '2016-01-09'),
(84, 21, '2016-01-18'),
(85, 4, '2016-04-02'),
(86, 11, '2016-01-10'),
(87, 92, '2016-03-02'),
(88, 3, '2016-10-18'),
(89, 21, '2016-04-07'),
(90, 82, '2016-11-24'),
(91, 59, '2016-10-04'),
(92, 94, '2016-07-21'),
(93, 14, '2016-10-20'),
(94, 65, '2016-05-20'),
(95, 83, '2016-02-22'),
(96, 76, '2016-01-31'),
(97, 43, '2016-09-13'),
(98, 15, '2016-12-17'),
(99, 7, '2016-03-02'),
(100, 66, '2016-05-26');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXIST `client` (
  `client_id` int(11) UNSIGNED NOT NULL,
  `client_first_name` varchar(255) NOT NULL,
  `client_last_name` varchar(255) NOT NULL,
  `client_phone` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`client_id`, `client_first_name`, `client_last_name`, `client_phone`) VALUES
(1, 'FTEM', 'XAMGUG', 945668),
(2, 'XRTP', 'UELSFA', 476073),
(3, 'ZTRG', 'EFKKXG', 625177),
(4, 'DWWW', 'TDMYGJ', 229397),
(5, 'OLLZ', 'MMZMMZ', 429837),
(6, 'XLLY', 'LJMHZB', 364433),
(7, 'HQGI', 'VGUFQN', 700104),
(8, 'UZNP', 'NSBEQR', 538662),
(9, 'JLAW', 'HWKKVZ', 463721),
(10, 'AZTW', 'DAQCPS', 851831),
(11, 'ZLFR', 'WFNZIR', 474479),
(12, 'AVEK', 'KWEFPJ', 118610),
(13, 'YROS', 'WFLPRP', 118813),
(14, 'FAKC', 'DLWAMK', 528216),
(15, 'ELUM', 'DGXQNQ', 706578),
(16, 'LEMX', 'BQZZZX', 628484),
(17, 'FJDP', 'NWTERU', 897287),
(18, 'CURB', 'GBNLRB', 341069),
(19, 'CUOM', 'TILCEQ', 705436),
(20, 'KBAY', 'TUSFXV', 579408),
(21, 'DZQF', 'FJEVND', 162357),
(22, 'YNUH', 'FBUSES', 236639),
(23, 'NEGU', 'EMWZHK', 275844),
(24, 'SCHB', 'OQLJLF', 678317),
(25, 'PZFD', 'ARIQGH', 766699),
(26, 'UTJP', 'YXPJBD', 563374),
(27, 'DFOG', 'MRZVFP', 408443),
(28, 'WKKU', 'SEUJNO', 239606),
(29, 'BXJC', 'LYIUBW', 260147),
(30, 'GRQF', 'CXECBZ', 772913),
(31, 'TPRR', 'GHQITR', 333636),
(32, 'EDFO', 'DAUUQS', 765572),
(33, 'NKNI', 'AGBOSV', 943577),
(34, 'GLLV', 'YDVVNF', 572652),
(35, 'YCSG', 'BPTYMR', 831466),
(36, 'BXKF', 'UJNLRC', 527869),
(37, 'ASKZ', 'SOQNRV', 213343),
(38, 'CDIG', 'JZUYMO', 413577),
(39, 'ABHF', 'DDFRUY', 442823),
(40, 'ZVFN', 'APUEOH', 746062),
(41, 'SMFP', 'IXMQVF', 574713),
(42, 'AMJJ', 'TSFYCQ', 968991),
(43, 'WMSG', 'AKXHRQ', 153585),
(44, 'JSMI', 'BJRHJZ', 869379),
(45, 'HXRO', 'WRTSGF', 371413),
(46, 'VFNB', 'TOPFHW', 496226),
(47, 'ONZH', 'LJLEND', 230547),
(48, 'GTCE', 'NDEMXY', 236529),
(49, 'VSAB', 'DOHWLP', 649469),
(50, 'HPCR', 'AEVQQG', 438411),
(51, 'CJNN', 'BSLCBZ', 761288),
(52, 'TNJH', 'KBDMYG', 515039),
(53, 'NHVI', 'CPRMNC', 892976),
(54, 'DBWF', 'JETFWT', 181078),
(55, 'EPKH', 'FFMUKS', 372436),
(56, 'JYNX', 'ZCPRPX', 739898),
(57, 'WFKK', 'TRZYTA', 754858),
(58, 'PWMW', 'ULURXO', 160410),
(59, 'PXRR', 'HMNFLN', 413348),
(60, 'DQSQ', 'DTJOQP', 168292),
(61, 'NJJQ', 'AILIJS', 616752),
(62, 'RQGH', 'RMLVSC', 474751),
(63, 'SJQD', 'SDNHWN', 964559),
(64, 'GHTY', 'JYTXGM', 700983),
(65, 'XMUJ', 'PVHYWL', 772954),
(66, 'IMJJ', 'TSILFV', 522068),
(67, 'VSDL', 'WBRGDZ', 512448),
(68, 'IIQC', 'RCKSJR', 431665),
(69, 'TPST', 'RCMEJH', 427366),
(70, 'XNXX', 'WPIXPD', 962432),
(71, 'JZWI', 'BJPXTA', 880948),
(72, 'GSSL', 'AUZNQO', 888838),
(73, 'TBBC', 'JNNBSK', 946474),
(74, 'LJNO', 'GMRZVF', 587957),
(75, 'BTPT', 'ZOWSZT', 753392),
(76, 'KXHR', 'NPKEQS', 712359),
(77, 'FCVV', 'QSSLBY', 638910),
(78, 'CTKT', 'QWLPRQ', 229667),
(79, 'TIKZ', 'TVWUJN', 512113),
(80, 'SFWS', 'ZVEIEW', 900431),
(81, 'UHZE', 'WWSXMR', 855966),
(82, 'FOFJ', 'CLZMNE', 299415),
(83, 'PIVD', 'GVIDTJ', 585777),
(84, 'PIYR', 'PYXSWE', 294786),
(85, 'OEEI', 'BLZNTD', 554153),
(86, 'BSNK', 'LYMMAR', 324917),
(87, 'FJDR', 'YRNNDD', 307892),
(88, 'SXIY', 'UBAWGQ', 510677),
(89, 'IJUU', 'SBHEBT', 571212),
(90, 'JIOT', 'CGXTAY', 678733),
(91, 'JVBX', 'IWJHHO', 941760),
(92, 'AGDA', 'TOQKDM', 177813),
(93, 'WEGR', 'QEWXXW', 595606),
(94, 'DCCD', 'IHJCJO', 721078),
(95, 'TRBG', 'DZJAXN', 885140),
(96, 'UJKW', 'GPFJBG', 232016),
(97, 'XAMI', 'EWUIHO', 825857),
(98, 'KNMU', 'OJCLXE', 206511),
(99, 'BAVC', 'BYQFFL', 660339),
(100, 'STRA', 'EUIJTQ', 984027);

-- --------------------------------------------------------

--
-- Структура таблицы `hotel`
--

CREATE TABLE IF NOT EXIST `hotel` (
  `hotel_id` int(11) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `hotel_stars` tinyint(3) UNSIGNED NOT NULL,
  `hotel_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_stars`, `hotel_address`) VALUES
(1, 'HROV', 5, 'GNXXXSVAPXTC'),
(2, 'GWRT', 4, 'OOBSHHOAJVBT'),
(3, 'Восток', 3, 'BBCGAINSAZUA'),
(4, 'Сокол', 1, 'DPNUJLBBDKTK'),
(5, 'UTKV', 5, 'BNKKXHTVWYZE'),
(6, 'XAKZ', 4, 'DUNHWNYFDCBZ'),
(7, 'TURB', 1, 'ULTKVVTESBEQ'),
(8, 'Алтай', 4, 'ZVDFSWHTYNRW'),
(9, 'IBIJ', 5, 'HXOEBWCXEEJI'),
(10, 'MKOO', 1, 'YJYSSKXIWIAD'),
(11, 'OKKW', 5, 'IUVWUIJVBVWV'),
(12, 'Космос', 4, 'CDIIPBLCCERW'),
(13, 'EJFC', 4, 'PROVKNKKWBTM'),
(14, 'GVHZ', 1, 'KURABHEBUVSB'),
(15, 'EQQG', 3, 'MAQEWXXUEOIZ'),
(16, 'UDFT', 1, 'HEWXVLVSBDMB'),
(17, 'UWXX', 4, 'GXSXJBFVNEGV'),
(18, 'HYZY', 4, 'CDKQWMUPMSAZ'),
(19, 'WIBJ', 4, 'CQVHZZYUCENE'),
(20, 'GRRI', 3, 'XTEMZLGYXTCE'),
(21, 'QQFE', 1, 'IFCUTHGKESAX'),
(22, 'MRYU', 5, 'RJSPUDGZCOLO'),
(23, 'LNHX', 4, 'MNDCCGWPIXOB'),
(24, 'ORQG', 2, 'TXGMSDPMSZXM'),
(25, 'SCKS', 3, 'VZJXMSCHGJAB'),
(26, 'ERVE', 2, 'HHSPYVIDTHEC'),
(27, 'WCVX', 5, 'GIXMQUCBYOXY'),
(28, 'YWOF', 2, 'DQSSLAVZNQQF'),
(29, 'DDDJ', 3, 'ELTKVYGIYQLF'),
(30, 'TBDO', 2, 'QKCIGHUAQGIX'),
(31, 'OAMJ', 2, 'UVSDPLNFPGLN'),
(32, 'IZYU', 1, 'AVCASPWMTJNM'),
(33, 'YEAQ', 1, 'XBPUCCGWQQFF'),
(34, 'ICNI', 1, 'OJDQTVWYBKWE'),
(35, 'HXQM', 3, 'SGCTMFOFJEVQ'),
(36, 'PEAR', 1, 'ZJWFLRZUDHBL'),
(37, 'AUWA', 3, 'LSGAJUXECZNU'),
(38, 'HCQW', 2, 'INNDDEPIWJGF'),
(39, 'HUAS', 3, 'SVYFFNYFEHVJ'),
(40, 'HHPD', 5, 'TIJTTNIACKUS'),
(41, 'GAHN', 4, 'ZVELQUATQAFY'),
(42, 'DTKV', 5, 'VNBVWXXWNZJY'),
(43, 'OYAH', 2, 'WIBILGYZDPSR'),
(44, 'IOXT', 1, 'WHWNXXYXSWDB'),
(45, 'WFLQ', 4, 'XFLNJDRXNUNF'),
(46, 'MUKT', 3, 'CCGZDTIJWGQM'),
(47, 'LSGD', 5, 'MNDCCCGAINPN'),
(48, 'RXOZ', 2, 'NSBDOHVFRRKX'),
(49, 'JDMB', 5, 'JCIKZUYKCGYY'),
(50, 'XTBZ', 4, 'XDBXGOAKYNUL'),
(51, 'WZHL', 3, 'SKTQVJGFJDMD'),
(52, 'EMVQ', 5, 'CBYOAISMFSWE'),
(53, 'ICKW', 1, 'VWYZEXZGJZTW'),
(54, 'AQZA', 1, 'ONVPOALFPJBE'),
(55, 'TFTE', 3, 'JBDQSPYZYWNX'),
(56, 'YAGD', 1, 'TRAEVQSPWOFK'),
(57, 'KWAL', 2, 'UIHMMXEEJGCV'),
(58, 'WUKQ', 1, 'CLXEEHXTBBBC'),
(59, 'GBMH', 1, 'FAKAWFNWWTCF'),
(60, 'VNBU', 4, 'GBPTYMQQJWHV'),
(61, 'EMXB', 4, 'WMVPPDXBSGFH'),
(62, 'SUUP', 3, 'CSGFFNYCSEWS'),
(63, 'ZUZM', 3, 'YGLLXDZPXUGY'),
(64, 'VKOM', 4, 'GCSILGWOHROV'),
(65, 'LSFA', 2, 'UVWUJLCENFJE'),
(66, 'WSYR', 3, 'GWQMOJBIKZTV'),
(67, 'VTGZ', 1, 'NHXQLHEAPXUC'),
(68, 'GXTA', 5, 'CATRFBORRJTS'),
(69, 'FAKB', 5, 'VEIDSFULVUMZ'),
(70, 'MLSJ', 3, 'WPIVCDJMGUGV'),
(71, 'KNKK', 5, 'FIZZXOCXDBWB'),
(72, 'TPST', 4, 'ZXODBUWWTEOF'),
(73, 'NXZG', 2, 'KJQDRXPIUYHS'),
(74, 'QBKV', 5, 'KBDKPTBYOXYY'),
(75, 'WNZH', 3, 'WPNTDKPWOFGT'),
(76, 'YMMC', 1, 'TRBKTNMSDNFN'),
(77, 'ZHMN', 1, 'GTZTTLCAXJFX'),
(78, 'XWNA', 3, 'UENBUSEUJNOC'),
(79, 'XGLO', 2, 'EUJOSXJERWJE'),
(80, 'SBET', 1, 'QQIRIQHKGZDU'),
(81, 'OKJP', 5, 'XRPBLZPBNKLB'),
(82, 'ZUWZ', 2, 'KFWQQIQHOXTE'),
(83, 'NBVY', 2, 'GQMKRESEQQJV'),
(84, 'CATT', 3, 'FODZOXUHCPSR'),
(85, 'GFKH', 2, 'HTYNQQHNSCHF'),
(86, 'EDHY', 5, 'MVPQIRKBCHDU'),
(87, 'QTXG', 3, 'DXCUSBHFGMUN'),
(88, 'FLPS', 4, 'UOMRXMTIKYPB'),
(89, 'PTAV', 1, 'TSFWUGZBIMJL'),
(90, 'BYQI', 4, 'SGGKIKAYQHQH'),
(91, 'OYZA', 2, 'GLMAPAGFHVIB'),
(92, 'IKDJ', 3, 'PGPEAQEVTFWQ'),
(93, 'PDVR', 1, 'YTVYFEGVGWPH'),
(94, 'QHPA', 3, 'CCFSZROSVCZO'),
(95, 'UKQZ', 1, 'FZFDCBAWJEUM'),
(96, 'XFIZ', 5, 'JFYEAOTAYQIT'),
(97, 'USDN', 1, 'KKUUNELQVFOG'),
(98, 'NXXU', 2, 'RUVVQRLENARF'),
(99, 'DZOW', 4, 'LJMHCPQJYOZI'),
(100, 'PCPT', 5, 'IWKLATQZXRRG');

-- --------------------------------------------------------

--
-- Структура таблицы `reserved_room`
--

CREATE TABLE IF NOT EXIST `reserved_room` (
  `reserved_room_id` int(11) UNSIGNED NOT NULL,
  `room_id` int(11) UNSIGNED DEFAULT NULL,
  `booking_id` int(11) UNSIGNED DEFAULT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `reserved_room`
--

INSERT INTO `reserved_room` (`reserved_room_id`, `room_id`, `booking_id`, `arrival_date`, `departure_date`) VALUES
(1, 93, 54, '2017-11-27', '2018-11-30'),
(2, 22, 69, '2017-10-09', '2018-10-04'),
(3, 44, 16, '2017-06-18', '2018-11-10'),
(4, 16, 55, '2017-04-03', '2018-05-29'),
(5, 44, 80, '2017-08-29', '2018-08-04'),
(6, 28, 76, '2017-12-19', '2018-11-12'),
(7, 71, 55, '2017-08-18', '2018-07-31'),
(8, 38, 63, '2017-12-21', '2018-01-12'),
(9, 86, 72, '2017-12-27', '2018-01-19'),
(10, 6, 77, '2017-08-21', '2018-07-28'),
(11, 16, 25, '2017-10-01', '2018-11-10'),
(12, 58, 19, '2017-03-14', '2018-08-01'),
(13, 28, 55, '2017-11-26', '2018-09-13'),
(14, 20, 39, '2017-05-03', '2018-08-22'),
(15, 16, 93, '2017-02-24', '2018-06-24'),
(16, 75, 43, '2017-11-15', '2018-11-11'),
(17, 52, 54, '2017-02-08', '2018-04-30'),
(18, 30, 90, '2017-08-02', '2018-06-26'),
(19, 91, 51, '2017-10-18', '2018-01-04'),
(20, 100, 16, '2017-10-14', '2018-12-16'),
(21, 12, 56, '2017-05-01', '2018-11-17'),
(22, 69, 6, '2017-03-11', '2018-06-01'),
(23, 20, 92, '2017-01-03', '2018-05-09'),
(24, 62, 28, '2017-07-19', '2018-11-08'),
(25, 32, 83, '2017-03-15', '2018-01-06'),
(26, 49, 93, '2017-02-19', '2018-03-10'),
(27, 37, 29, '2017-04-18', '2018-04-19'),
(28, 1, 30, '2017-06-07', '2018-02-25'),
(29, 1, 34, '2017-08-27', '2018-05-29'),
(30, 85, 59, '2017-05-20', '2018-08-22'),
(31, 74, 48, '2017-03-08', '2018-11-14'),
(32, 89, 73, '2017-12-26', '2018-10-02'),
(33, 44, 56, '2017-06-18', '2018-11-19'),
(34, 65, 87, '2017-05-15', '2018-03-01'),
(35, 77, 67, '2017-01-12', '2018-09-19'),
(36, 36, 48, '2017-04-29', '2018-12-16'),
(37, 29, 74, '2017-10-26', '2018-12-12'),
(38, 61, 77, '2017-01-07', '2018-11-10'),
(39, 20, 10, '2017-11-18', '2018-01-11'),
(40, 60, 76, '2017-01-08', '2018-01-19'),
(41, 78, 53, '2017-04-16', '2018-07-01'),
(42, 84, 61, '2017-06-28', '2018-09-25'),
(43, 52, 35, '2017-03-11', '2018-12-26'),
(44, 100, 40, '2017-01-03', '2018-03-08'),
(45, 40, 80, '2017-10-26', '2018-12-29'),
(46, 55, 99, '2017-04-30', '2018-05-06'),
(47, 60, 80, '2017-03-10', '2018-03-22'),
(48, 52, 28, '2017-10-30', '2018-01-30'),
(49, 7, 93, '2017-06-15', '2018-01-23'),
(50, 6, 79, '2017-09-26', '2018-05-13'),
(51, 28, 74, '2017-11-14', '2018-02-04'),
(52, 98, 72, '2017-08-26', '2018-08-07'),
(53, 53, 66, '2017-08-31', '2018-11-12'),
(54, 42, 48, '2017-02-22', '2018-01-02'),
(55, 76, 33, '2017-05-16', '2018-03-30'),
(56, 26, 48, '2017-08-10', '2018-03-30'),
(57, 18, 72, '2017-01-22', '2018-07-27'),
(58, 29, 25, '2017-05-09', '2018-02-09'),
(59, 91, 17, '2017-02-13', '2018-03-07'),
(60, 33, 92, '2017-08-08', '2018-06-29'),
(61, 95, 66, '2017-06-10', '2018-11-23'),
(62, 3, 92, '2017-07-04', '2018-05-13'),
(63, 36, 33, '2017-07-18', '2018-02-09'),
(64, 12, 88, '2017-11-25', '2018-09-30'),
(65, 7, 13, '2017-06-18', '2018-03-16'),
(66, 74, 89, '2017-03-16', '2018-03-20'),
(67, 26, 34, '2017-12-05', '2018-05-04'),
(68, 9, 98, '2017-08-10', '2018-09-25'),
(69, 48, 37, '2017-05-28', '2018-05-26'),
(70, 97, 12, '2017-09-03', '2018-02-24'),
(71, 80, 2, '2017-09-14', '2018-03-26'),
(72, 6, 6, '2017-01-31', '2018-01-21'),
(73, 29, 96, '2017-12-09', '2018-04-08'),
(74, 63, 49, '2017-07-12', '2018-05-07'),
(75, 84, 67, '2017-10-17', '2018-07-19'),
(76, 23, 80, '2017-05-01', '2018-03-30'),
(77, 64, 76, '2017-11-16', '2018-11-29'),
(78, 46, 56, '2017-06-07', '2018-02-12'),
(79, 34, 27, '2017-04-27', '2018-01-14'),
(80, 81, 70, '2017-01-23', '2018-11-25'),
(81, 57, 25, '2017-07-16', '2018-03-04'),
(82, 42, 14, '2017-06-07', '2018-05-27'),
(83, 77, 46, '2017-12-16', '2018-04-21'),
(84, 14, 7, '2017-11-27', '2018-12-11'),
(85, 77, 69, '2017-02-07', '2018-01-15'),
(86, 85, 87, '2017-10-08', '2018-12-07'),
(87, 84, 41, '2017-06-30', '2018-11-06'),
(88, 65, 92, '2017-08-14', '2018-12-18'),
(89, 73, 46, '2017-01-30', '2018-01-15'),
(90, 1, 94, '2017-09-10', '2018-02-14'),
(91, 11, 45, '2017-11-25', '2018-03-01'),
(92, 99, 6, '2017-04-28', '2018-03-25'),
(93, 47, 85, '2017-10-30', '2018-07-13'),
(94, 60, 47, '2017-07-22', '2018-03-02'),
(95, 14, 52, '2017-03-06', '2018-02-14'),
(96, 70, 66, '2017-03-11', '2018-05-04'),
(97, 71, 28, '2017-04-11', '2018-12-05'),
(98, 17, 86, '2017-10-14', '2018-05-29'),
(99, 66, 34, '2017-09-28', '2018-03-23'),
(100, 59, 76, '2017-01-08', '2018-02-27');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE IF NOT EXIST `room` (
  `room_id` int(11) UNSIGNED NOT NULL,
  `hotel_id` int(11) UNSIGNED DEFAULT NULL,
  `room_kind_id` int(11) UNSIGNED DEFAULT NULL,
  `room_number` int(11) UNSIGNED NOT NULL,
  `room_price` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`room_id`, `hotel_id`, `room_kind_id`, `room_number`, `room_price`) VALUES
(1, 12, 77, 0, 504),
(2, 97, 47, 1, 497),
(3, 81, 72, 2, 226),
(4, 57, 41, 3, 398),
(5, 45, 22, 4, 758),
(6, 3, 91, 5, 537),
(7, 71, 5, 6, 221),
(8, 54, 26, 7, 722),
(9, 69, 34, 8, 684),
(10, 12, 19, 9, 308),
(11, 62, 38, 10, 126),
(12, 3, 4, 11, 189),
(13, 40, 67, 12, 250),
(14, 12, 63, 13, 672),
(15, 32, 65, 14, 375),
(16, 59, 3, 15, 403),
(17, 63, 12, 16, 740),
(18, 21, 88, 17, 777),
(19, 15, 48, 18, 942),
(20, 12, 46, 19, 557),
(21, 19, 40, 20, 470),
(22, 88, 16, 21, 244),
(23, 33, 15, 22, 758),
(24, 12, 97, 23, 210),
(25, 73, 25, 24, 138),
(26, 50, 33, 25, 231),
(27, 76, 36, 26, 565),
(28, 51, 99, 27, 482),
(29, 16, 49, 28, 966),
(30, 37, 93, 29, 576),
(31, 88, 80, 30, 402),
(32, 12, 51, 31, 637),
(33, 12, 63, 32, 694),
(34, 44, 19, 33, 672),
(35, 62, 18, 34, 108),
(36, 54, 64, 35, 639),
(37, 8, 59, 36, 713),
(38, 66, 26, 37, 363),
(39, 70, 62, 38, 980),
(40, 5, 29, 39, 350),
(41, 12, 91, 40, 907),
(42, 76, 9, 41, 227),
(43, 12, 92, 42, 245),
(44, 4, 87, 43, 214),
(45, 3, 77, 44, 783),
(46, 49, 14, 45, 323),
(47, 83, 38, 46, 443),
(48, 80, 85, 47, 841),
(49, 59, 47, 48, 612),
(50, 45, 52, 49, 320),
(51, 68, 66, 50, 329),
(52, 4, 73, 51, 746),
(53, 43, 97, 52, 615),
(54, 96, 5, 53, 423),
(55, 67, 26, 54, 339),
(56, 58, 6, 55, 617),
(57, 70, 78, 56, 784),
(58, 49, 16, 57, 367),
(59, 3, 26, 58, 283),
(60, 4, 61, 59, 356),
(61, 62, 23, 60, 361),
(62, 77, 98, 61, 610),
(63, 91, 84, 62, 502),
(64, 74, 34, 63, 533),
(65, 40, 53, 64, 493),
(66, 62, 75, 65, 916),
(67, 29, 71, 66, 715),
(68, 30, 43, 67, 312),
(69, 91, 83, 68, 482),
(70, 64, 90, 69, 622),
(71, 22, 33, 70, 968),
(72, 86, 40, 71, 475),
(73, 89, 20, 72, 382),
(74, 99, 96, 73, 871),
(75, 41, 45, 74, 129),
(76, 82, 99, 75, 511),
(77, 4, 35, 76, 737),
(78, 50, 34, 77, 296),
(79, 8, 72, 78, 404),
(80, 56, 76, 79, 215),
(81, 37, 45, 80, 217),
(82, 32, 19, 81, 990),
(83, 12, 95, 82, 624),
(84, 8, 63, 83, 921),
(85, 68, 65, 84, 265),
(86, 100, 42, 85, 173),
(87, 18, 63, 86, 643),
(88, 12, 89, 87, 109),
(89, 40, 96, 88, 621),
(90, 4, 42, 89, 994),
(91, 72, 58, 90, 788),
(92, 8, 11, 91, 368),
(93, 17, 96, 92, 325),
(94, 40, 24, 93, 981),
(95, 20, 3, 94, 586),
(96, 64, 54, 95, 793),
(97, 26, 95, 96, 985),
(98, 8, 41, 97, 829),
(99, 84, 75, 98, 310),
(100, 4, 92, 99, 814);

-- --------------------------------------------------------

--
-- Структура таблицы `room_kind`
--

CREATE TABLE IF NOT EXIST `room_kind` (
  `room_kind_id` int(11) UNSIGNED NOT NULL,
  `room_kind_category` varchar(255) NOT NULL,
  `room_kind_space` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `room_kind`
--

INSERT INTO `room_kind` (`room_kind_id`, `room_kind_category`, `room_kind_space`) VALUES
(1, 'lux', 209),
(2, 'lux', 189),
(3, 'econom', 97),
(4, 'lux', 448),
(5, 'econom', 247),
(6, 'lux', 478),
(7, 'lux', 436),
(8, 'lux', 445),
(9, 'econom', 26),
(10, 'lux', 162),
(11, 'lux', 269),
(12, 'lux', 106),
(13, 'econom', 389),
(14, 'lux', 477),
(15, 'lux', 107),
(16, 'econom', 439),
(17, 'econom', 481),
(18, 'econom', 200),
(19, 'econom', 258),
(20, 'econom', 38),
(21, 'lux', 155),
(22, 'lux', 28),
(23, 'econom', 393),
(24, 'lux', 309),
(25, 'lux', 227),
(26, 'econom', 400),
(27, 'econom', 89),
(28, 'lux', 324),
(29, 'econom', 361),
(30, 'econom', 410),
(31, 'lux', 28),
(32, 'econom', 29),
(33, 'econom', 128),
(34, 'lux', 73),
(35, 'lux', 63),
(36, 'lux', 362),
(37, 'econom', 359),
(38, 'econom', 495),
(39, 'lux', 235),
(40, 'econom', 320),
(41, 'lux', 420),
(42, 'econom', 112),
(43, 'econom', 106),
(44, 'econom', 352),
(45, 'econom', 273),
(46, 'lux', 402),
(47, 'econom', 196),
(48, 'econom', 419),
(49, 'lux', 245),
(50, 'lux', 224),
(51, 'econom', 433),
(52, 'lux', 260),
(53, 'lux', 382),
(54, 'lux', 423),
(55, 'lux', 98),
(56, 'lux', 274),
(57, 'lux', 300),
(58, 'econom', 174),
(59, 'econom', 429),
(60, 'econom', 154),
(61, 'lux', 333),
(62, 'econom', 433),
(63, 'lux', 254),
(64, 'lux', 267),
(65, 'lux', 199),
(66, 'econom', 238),
(67, 'lux', 156),
(68, 'lux', 163),
(69, 'lux', 82),
(70, 'lux', 399),
(71, 'econom', 403),
(72, 'lux', 54),
(73, 'lux', 109),
(74, 'econom', 444),
(75, 'lux', 71),
(76, 'lux', 68),
(77, 'lux', 476),
(78, 'econom', 75),
(79, 'econom', 334),
(80, 'econom', 201),
(81, 'lux', 167),
(82, 'econom', 223),
(83, 'lux', 160),
(84, 'lux', 367),
(85, 'lux', 74),
(86, 'econom', 326),
(87, 'econom', 60),
(88, 'lux', 437),
(89, 'lux', 369),
(90, 'econom', 27),
(91, 'econom', 387),
(92, 'lux', 189),
(93, 'lux', 426),
(94, 'lux', 433),
(95, 'lux', 367),
(96, 'lux', 497),
(97, 'econom', 195),
(98, 'econom', 494),
(99, 'lux', 243),
(100, 'econom', 474);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Индексы таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD PRIMARY KEY (`reserved_room_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`) USING BTREE,
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `room_kind_id` (`room_kind_id`) USING BTREE;

--
-- Индексы таблицы `room_kind`
--
ALTER TABLE `room_kind`
  ADD PRIMARY KEY (`room_kind_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  MODIFY `reserved_room_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT для таблицы `room_kind`
--
ALTER TABLE `room_kind`
  MODIFY `room_kind_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD CONSTRAINT `reserved_room_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reserved_room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`room_kind_id`) REFERENCES `room_kind` (`room_kind_id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
