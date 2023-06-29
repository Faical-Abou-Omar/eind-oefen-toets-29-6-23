-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 jun 2023 om 23:35
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dierenrijk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dier`
--

CREATE TABLE `dier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dier`
--

INSERT INTO `dier` (`id`, `user_id`, `name`, `description`) VALUES
(1, 1, 'Olifant', 'de olifant is een groot en grijs dier'),
(2, 2, 'giraf', 'giraf is erg lang'),
(3, 1, 'Krokodil', 'Een groen dier');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `part` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `fname`, `part`) VALUES
(1, 'pleun@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$rzv7myo6wlfSZlQTFf.p8uAp2y5.Gz9iaVuzWR3aZz0afZj249izi', 'Pleun', 'PleunDieren'),
(2, 'harun@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$rzv7myo6wlfSZlQTFf.p8uAp2y5.Gz9iaVuzWR3aZz0afZj249izi', 'Harun', 'Het deel van Harun'),
(3, 'sanne@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$rzv7myo6wlfSZlQTFf.p8uAp2y5.Gz9iaVuzWR3aZz0afZj249izi', 'Sanne', 'Sannetje'),
(4, 'alex@gmail.com', '[\"ROLE_MEMBER\"]', '$2y$13$rzv7myo6wlfSZlQTFf.p8uAp2y5.Gz9iaVuzWR3aZz0afZj249izi', 'Alex', '');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `dier`
--
ALTER TABLE `dier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7487C015A76ED395` (`user_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `dier`
--
ALTER TABLE `dier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `dier`
--
ALTER TABLE `dier`
  ADD CONSTRAINT `FK_7487C015A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
