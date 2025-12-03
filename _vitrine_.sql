-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 03 2025 г., 20:44
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
(1, 'audi_tt_rally', 1, 'Audi TT Rally Project', 'Audi TT Rally Project', 'Audi TT Rally Project', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'project_1.jpg', NULL),
(2, 'icebox_system', 2, 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'project_2.jpg', NULL);

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
(5, 1, 'project_6.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `site_langs`
--

CREATE TABLE `site_langs` (
  `id` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `en` varchar(255) NOT NULL,
  `ro` varchar(255) NOT NULL,
  `ru` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `pwd`, `name`, `phone`, `address`) VALUES
(2, 'qwe', '4297f44b13955235245b2497399d7a93', 'Имя2', '222222', 'Адрес222'),
(3, 'asd', '4297f44b13955235245b2497399d7a93', '', '', ''),
(4, 'qwe1', '4297f44b13955235245b2497399d7a93', '', '', ''),
(5, 'dfgdfger', '4297f44b13955235245b2497399d7a93', '', '', ''),
(6, 'dfgdfg', '4297f44b13955235245b2497399d7a93', '', '', ''),
(7, 'qwe2', '4297f44b13955235245b2497399d7a93', 'qwe222', '222', 'eqwe3333'),
(8, 'qwer', '4297f44b13955235245b2497399d7a93', 'qwer1', '11111', 'Адрес'),
(9, 'testuser1', '4297f44b13955235245b2497399d7a93', 'testuser', '444444', 'АдресАдресАдрес'),
(10, 'test@mail.com', '25d55ad283aa400af464c76d713c07ad', 'Taras', '06000000', 'Jora de Jos 666'),
(11, 'ichiselii@mail.ru', '1bbd886460827015e5d605ed44252251', '', '', ''),
(12, 'ichiseliii@mail.ru', 'f5bb0c8de146c67b44babbf4e6584cc0', '', '', ''),
(13, 'ichiseli@qiwi.com', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Iuri', '060000000', 'Chisinau, str. Pan Halipa 9');

--
-- Индексы сохранённых таблиц
--

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
-- Индексы таблицы `site_langs`
--
ALTER TABLE `site_langs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `project_photos`
--
ALTER TABLE `project_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `site_langs`
--
ALTER TABLE `site_langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
