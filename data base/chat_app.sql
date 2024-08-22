-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2024 a las 21:40:20
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chat_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `sent_at`) VALUES
(9, 3, 1, 'hola', '2024-08-22 17:14:59'),
(10, 3, 1, 'como estas', '2024-08-22 17:15:04'),
(11, 1, 3, 'hola', '2024-08-22 17:15:50'),
(12, 1, 3, 'estoy bien', '2024-08-22 17:15:57'),
(13, 1, 3, 'hola', '2024-08-22 17:25:50'),
(14, 1, 3, 'fae', '2024-08-22 17:25:52'),
(15, 1, 3, 'asd', '2024-08-22 17:55:50'),
(16, 3, 1, 'mbhias dih', '2024-08-22 18:19:13'),
(17, 1, 3, 'hashdhsa', '2024-08-22 18:23:55'),
(18, 1, 3, 'ka aa', '2024-08-22 18:23:57'),
(19, 1, 3, 'ijfbbauhcvug', '2024-08-22 19:28:36'),
(20, 4, 1, 'hola soy ruth compas', '2024-08-22 19:30:46'),
(21, 1, 4, 'hola ruth  soy roberth', '2024-08-22 19:31:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `phone`, `password`, `dob`, `created_at`) VALUES
(1, 'roberh', '991992658', '$2y$10$Q4T.wTKkbxy/vbcO3B2Da.wCuLVp2IHzbSpJn23FxSSjzYAKXq0Nq', '2003-02-22', '2024-08-22 16:08:40'),
(3, 'alex', '987654321', '$2y$10$Pp1dwQyFPbeOrJ6gl4OuQuILQa85ZoWd7PToRt7vWSoTtY2sXA9Xm', '2003-08-04', '2024-08-22 17:14:22'),
(4, 'ruth', '961394230', '$2y$10$9QqN5.lHrislU6wpWVgTo.lYWhzbBmc9DLqyfOxyL5xAXVoXifJSm', '2024-08-06', '2024-08-22 19:29:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
