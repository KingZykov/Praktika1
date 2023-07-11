-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 08 2023 г., 22:21
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kanban_board`
--

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id_project` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `project_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id_project`, `id_user`, `project_name`, `project_description`, `start_date`, `end_date`) VALUES
(151, 16, '2', 'Как-то так', '2023-07-30', '2023-09-30'),
(156, 16, '1', '', '2023-07-03', '2023-10-06');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id_task` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `task_status` int(1) NOT NULL,
  `task_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id_task`, `id_user`, `id_project`, `task_status`, `task_name`, `task_description`, `task_color`, `deadline`) VALUES
(34, 16, 150, 2, 'fssfsdf', 'dfsdsf', '#5cb85c', '2023-07-31'),
(35, 16, 150, 3, 'fssfsdf', 'uk', '#d9534f', '1970-01-01'),
(37, 16, 150, 1, 'Новый таск 2', '', '#5cb85c', '2023-09-03'),
(38, 16, 151, 3, 'Новая задача 2', 'тест', '#5cb85c', '2023-10-28'),
(39, 16, 151, 1, 'Новый таск', 'квпавпвап', '#f0ad4e', '2023-08-12'),
(40, 16, 150, 3, 'Новый таск 4', 'fsdfsdf', '#f0ad4e', '2023-07-08'),
(41, 16, 150, 2, 'Новый таск 5', '', '#f0ad4e', '2023-07-30'),
(48, 16, 150, 1, 'г6ганаоа', '', '#5cb85c', '2023-09-22'),
(49, 16, 150, 1, 'пвраппв', '', '#5cb85c', '2023-09-22'),
(50, 16, 150, 2, 'енун4', '', '#5cb85c', '2023-08-19'),
(51, 16, 151, 1, 'Новый таск 2', '', '#f0ad4e', '2023-07-30'),
(52, 16, 151, 2, 'Новый таск 4', '', '#d9534f', '2023-07-29'),
(53, 16, 151, 3, 'Новый таск 5', '', '#f0ad4e', '2023-07-19'),
(54, 16, 151, 1, 'Новый таск 3', 'Что же, какая-то задача', '#5cb85c', '2023-07-19'),
(55, 16, 151, 1, 'новая задача 3', '', '#5cb85c', '2023-08-25'),
(56, 16, 151, 2, 'Новый таск 8', 'fvdv', '#5cb85c', '2023-07-20'),
(57, 17, 151, 2, 'Новый таск 7', 'новый', '#5cb85c', '2023-10-07'),
(58, 17, 156, 1, 'fssfsdf', '', '#5cb85c', '2023-07-21');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `user`, `password`, `role`) VALUES
(1, 'user1', 'user1', 'user'),
(16, 'user', 'b14361404c078ffd549c03db443c3fede2f3e534d73f78f77301ed97d4a436a9fd9db05ee8b325c0ad36438b43fec8510c204fc1c1edb21d0941c00e9e2c1ce2', 'user'),
(17, 'Admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'admin'),
(18, 'user2', '291116775902b38dd09587ad6235cec503fc14dbf9c09cad761f2e5a5755102eaceb54b95ffd179c22652c3910dbc6ed85ddde7e09eef1ecf3ad219225f509f5', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `tasks_id_user` (`id_user`),
  ADD KEY `tasks_id_project` (`id_project`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
