-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 18 2025 г., 21:49
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vitrine`
--

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` varchar(20) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_ro` varchar(50) NOT NULL,
  `title_ru` varchar(50) NOT NULL,
  `long_desc_en` varchar(255) DEFAULT NULL,
  `long_desc_ro` varchar(255) DEFAULT NULL,
  `long_desc_ru` varchar(255) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title_en`, `title_ro`, `title_ru`, `long_desc_en`, `long_desc_ro`, `long_desc_ru`, `meta`) VALUES
('about', 'Test lang', 'Test lăng', 'Тэст', '<p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p>', '<p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  T', '<p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест', 'Professional auto tuning atelier. Custom projects, quality, and experience. Turbo kits,  Exhaust & intake systems,  ECU tuning,  Custom wiring.');

-- --------------------------------------------------------

--
-- Структура таблицы `pages_photos`
--

CREATE TABLE `pages_photos` (
  `id` int(11) NOT NULL,
  `page_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `pages_photos`
--

INSERT INTO `pages_photos` (`id`, `page_id`, `name`) VALUES
(9, 'about', 'img_6943cf9e4581b4.95804031.jpg'),
(10, 'about', 'img_6943cf9e45a012.67708170.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `uri` char(20) NOT NULL,
  `order_index` int(11) NOT NULL,
  `title_ro` char(100) DEFAULT NULL,
  `title_ru` char(100) DEFAULT NULL,
  `title_en` char(100) DEFAULT NULL,
  `long_descriprion_ro` varchar(600) DEFAULT NULL,
  `long_descriprion_ru` varchar(600) DEFAULT NULL,
  `long_descriprion_en` varchar(600) DEFAULT NULL,
  `logo` char(50) DEFAULT NULL,
  `meta` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `uri`, `order_index`, `title_ro`, `title_ru`, `title_en`, `long_descriprion_ro`, `long_descriprion_ru`, `long_descriprion_en`, `logo`, `meta`) VALUES
(1, 'audi_tt_rally', 2, 'Audi TT Rally Project', 'Audi TT Rally Project', 'Audi TT Rally Project', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'project_1.jpg', NULL),
(2, 'icebox_system', 3, 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'project_2.jpg', NULL),
(4, 'test_test_lang', 1, 'Test lăng', 'Тэстg', 'Test lang', '<p>Test lang<u> lang lang</u></p>', '<p><u>Тэст lang</u></p>', '<p>Test lang lang</p>', 'img_693c176ed5bce4.42383043.jpg', 'test, test, test, tsets ,est set'),
(5, 'test_test_lang_test', 5, 'Test', 'Test', 'Test', '<p>Test</p>', '<p>Test</p>', '<p>Test</p>', '', 'Test'),
(6, 'qwerweqrt', 4, 'rewqrqwt', 'eqrtqert', 'trqeteq', '<p>tqerteqrt</p>', '<p>eqrteqt</p>', '<p>trqetreq</p>', '', 'tqerteqt'),
(7, 'trqetqetre', 3, 'eqrterqtqert', 'qertqetqert', 'qertqetqert', '<p>qertqetqertqe</p>', '<p>qerteqrtretrqet</p>', '<p>terqtqetqetqert</p>', '', 'qertqetrqet'),
(8, 'wqerqwerqewr', 1, 'rqwerqwer', 'qwerqwer', 'wqerqwer', '<p>trewywrtyry</p>', '<p>ytwrywrtywryw</p>', '<p>qwerqwerqwe</p>', '', 'qwerqwerqw'),
(9, 'test_', 1, 'Test_', 'Test_', 'Test_', '<p>Test</p>', '<p>Test</p>', '<p>Test</p>', '', 'Test');

-- --------------------------------------------------------

--
-- Структура таблицы `project_photos`
--

CREATE TABLE `project_photos` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `project_photos`
--

INSERT INTO `project_photos` (`id`, `project_id`, `name`) VALUES
(1, 1, 'project_2.jpg'),
(2, 1, 'project_3.jpg'),
(3, 1, 'project_4.jpg'),
(4, 1, 'project_5.jpg'),
(5, 1, 'project_6.jpg'),
(23, 4, 'img_693c16ecabd1f7.07478982.jpg'),
(24, 4, 'img_693c16ecac0800.40192603.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(4, 'address', 'Chisinau Pan Halippa 9'),
(2, 'facebook', 'https://www.facebook.com/groups/496683557152045'),
(3, 'instagram', 'https://www.instagram.com/nx_fab_/'),
(1, 'phone', '+37360058785'),
(5, 'work_time', '<p>Luni-Vineri: <strong>08:00-17:00 </strong></p><p><br></p><p>Sâmbata:<strong> 09:00-14:03</strong></p><p><br></p><p>Duminica: <strong>Zi de odihna</strong></p>');

-- --------------------------------------------------------

--
-- Структура таблицы `translates`
--

CREATE TABLE `translates` (
  `lang_index` varchar(20) NOT NULL,
  `en` varchar(100) DEFAULT NULL,
  `ru` varchar(100) DEFAULT NULL,
  `ro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `translates`
--

INSERT INTO `translates` (`lang_index`, `en`, `ru`, `ro`) VALUES
('about_us', 'ABOUT US', 'О НАС', 'DESPRE NOI'),
('address', 'ADDRESS', 'АДДРЕСС', 'ADRESA'),
('all_projects', 'ALL PROJECTS AT A GLANCE ', 'ВСЕ ПРОЕКТЫ В ОДНОМ МЕСТЕ', 'TOATE PROIECTELE ÎNTR-UN SINGUR LOC'),
('all_works', 'ALL WORKS AT A GLANCE', 'ВСЕ РАБОТЫ В ОДНОМ МЕСТЕ', 'TOATE LUCRĂRILE ÎNTR-UN SINGUR LOC'),
('deliver_quality', 'DELIVER QUALITY', 'ПОСТАВЛЯЕМ КАЧЕСТВО', 'ASIGURĂM CALITATEA'),
('projects', 'PROJECTS', 'ПРОЕКТЫ', 'PROIECTE'),
('works', 'WORKS', 'РАБОТЫ', 'LUCRĂRI');

-- --------------------------------------------------------

--
-- Структура таблицы `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `uri` char(20) NOT NULL,
  `order_index` int(11) NOT NULL,
  `title_ro` char(100) DEFAULT NULL,
  `title_ru` char(100) DEFAULT NULL,
  `title_en` char(100) DEFAULT NULL,
  `long_descriprion_ro` varchar(600) DEFAULT NULL,
  `long_descriprion_ru` varchar(600) DEFAULT NULL,
  `long_descriprion_en` varchar(600) DEFAULT NULL,
  `logo` char(50) DEFAULT NULL,
  `meta` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `works`
--

INSERT INTO `works` (`id`, `uri`, `order_index`, `title_ro`, `title_ru`, `title_en`, `long_descriprion_ro`, `long_descriprion_ru`, `long_descriprion_en`, `logo`, `meta`) VALUES
(15, 'test_test', 3, 'Test', 'Test', 'Test', '<p>test</p>', '<p>test</p>', '<p>test</p>', 'img_694452caab4019.69817544.jpg', 'Test'),
(16, 'test_test_yopta', 2, 'Test yopta', 'Test yopta', 'Test yopta', '<p>Test yopta</p>', '<p>Test yopta</p>', '<p>Test yopta</p>', 'img_694453ec269652.02801514.jpg', 'Test yopta'),
(17, 'tratata_', 1, 'TarararaĂĂĂĂĂ', 'TarararaЭЭЭЭЭ', 'Tararara', '<p>ĂĂĂĂĂĂĂĂĂĂĂĂĂĂĂĂ</p>', '<p>ЭЭЭЭЭЭЭЭЭЭЭЭЭЭЭ</p>', '<p>Tararara</p>', 'img_694454ead57370.08066820.jpg', 'Tararara'),
(18, 'gusi_gusi', 1, 'Gusi', 'Gusi', 'Gusi', '<p>Gusi</p>', '<p>Gusi</p>', '<p>Gusi</p>', 'img_6944550fccbf29.48123089.jpg', 'Gusi'),
(19, 'ga_ga', 1, 'Gaga', 'Gaga', 'Gaga', '<p>Gaga</p>', '<p>Gaga</p>', '<p>Gaga</p>', 'img_6944553e4dfff5.76186273.jpg', 'Gaga'),
(20, 'shipi_chipi', 1, 'Chapa', 'Chapa', 'Chapa', '<p>Chapa</p>', '<p>Chapa</p>', '<p>Chapa</p>', 'img_694455666d5355.47551112.jpg', 'Chapa');

-- --------------------------------------------------------

--
-- Структура таблицы `work_photos`
--

CREATE TABLE `work_photos` (
  `id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `work_photos`
--

INSERT INTO `work_photos` (`id`, `work_id`, `name`) VALUES
(39, 15, 'img_694452caab6722.90737575.jpg'),
(40, 15, 'img_694452caab8014.55621061.jpg'),
(41, 15, 'img_694452caaba0b7.72970904.jpg'),
(42, 16, 'img_694453ec26b094.82225851.jpg'),
(43, 16, 'img_694453ec26cc51.56788546.jpg'),
(44, 16, 'img_694453ec26e4e7.86885675.jpg'),
(45, 17, 'img_694454ead59004.13219573.jpg'),
(46, 17, 'img_694454ead5a7a5.31884493.jpg'),
(47, 17, 'img_694454ead5c846.26554842.jpg'),
(48, 17, 'img_694454ead5e304.19551573.jpg'),
(49, 17, 'img_694454ead5fd76.85608334.jpg'),
(50, 17, 'img_694454ead61bb9.80211906.jpg'),
(51, 18, 'img_6944550fccdca4.94573044.jpg'),
(52, 18, 'img_6944550fccf436.21680131.jpg'),
(53, 18, 'img_6944550fd27b71.58949054.jpg'),
(54, 18, 'img_6944550fd29847.36468520.jpg'),
(55, 19, 'img_6944553e4e1a03.98528190.jpg'),
(56, 19, 'img_6944553e4e32d3.14391236.jpg'),
(57, 19, 'img_6944553e4e4c39.03975573.jpg'),
(58, 20, 'img_694455666d6f24.13669121.jpg'),
(59, 20, 'img_694455666d9cb4.58190974.jpg'),
(60, 20, 'img_694455666dba51.11037407.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD UNIQUE KEY `pages_id_uindex` (`id`);

--
-- Индексы таблицы `pages_photos`
--
ALTER TABLE `pages_photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_photos_id_uindex` (`id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uri` (`uri`);

--
-- Индексы таблицы `project_photos`
--
ALTER TABLE `project_photos`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `settings_key_uindex` (`name`),
  ADD UNIQUE KEY `settings_id_uindex` (`id`);

--
-- Индексы таблицы `translates`
--
ALTER TABLE `translates`
  ADD UNIQUE KEY `translates_lang_index_uindex` (`lang_index`);

--
-- Индексы таблицы `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uri` (`uri`);

--
-- Индексы таблицы `work_photos`
--
ALTER TABLE `work_photos`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pages_photos`
--
ALTER TABLE `pages_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `project_photos`
--
ALTER TABLE `project_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `work_photos`
--
ALTER TABLE `work_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
