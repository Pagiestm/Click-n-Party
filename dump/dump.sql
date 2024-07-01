-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 juil. 2024 à 10:12
-- Version du serveur : 10.5.21-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `xhvueqaz_click-n-party`
--

-- --------------------------------------------------------

--
-- Structure de la table `ajouter_en_favoris`
--

CREATE TABLE `ajouter_en_favoris` (
  `utilisateurs_id` int(11) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `date_ajout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ajouter_en_favoris`
--

INSERT INTO `ajouter_en_favoris` (`utilisateurs_id`, `locations_id`, `date_ajout`) VALUES
(1, 10, '2024-05-28'),
(1, 11, '2024-05-31'),
(1, 12, '2024-06-27'),
(1, 13, '2024-04-27'),
(1, 14, '2024-06-27'),
(2, 10, '2024-03-20'),
(2, 11, '2024-03-17'),
(18, 15, '2024-06-25'),
(27, 10, '2024-06-07'),
(27, 11, '2024-06-07'),
(27, 14, '2024-06-07'),
(27, 15, '2024-06-07');

-- --------------------------------------------------------

--
-- Structure de la table `alerte_disponibilite`
--

CREATE TABLE `alerte_disponibilite` (
  `utilisateurs_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `date_creation` varchar(255) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `icon` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`, `icon`) VALUES
(8, 'Appartement', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjU2IDI1NiI+PHBhdGggZmlsbD0iIzAwMDAwMCIgZD0iTTI0MCAyMDhoLThWNzJhOCA4IDAgMCAwLTgtOGgtNDBWNDBhOCA4IDAgMCAwLTgtOEg4MGE4IDggMCAwIDAtOCA4djU2SDMyYTggOCAwIDAgMC04IDh2MTA0aC04YTggOCAwIDAgMCAwIDE2aDIyNGE4IDggMCAwIDAgMC0xNk00MCAxMTJoNDBhOCA4IDAgMCAwIDgtOFY0OGg4MHYyNGE4IDggMCAwIDAgOCA4aDQwdjEyOGgtNjR2LTQwYTggOCAwIDAgMC04LThoLTMyYTggOCAwIDAgMC04IDh2NDBINDBabTk2IDk2aC0xNnYtMzJoMTZaTTExMiA3MmE4IDggMCAwIDEgOC04aDE2YTggOCAwIDAgMSAwIDE2aC0xNmE4IDggMCAwIDEtOC04bTAgMzJhOCA4IDAgMCAxIDgtOGgxNmE4IDggMCAwIDEgMCAxNmgtMTZhOCA4IDAgMCAxLTgtOG01NiAwYTggOCAwIDAgMSA4LThoMTZhOCA4IDAgMCAxIDAgMTZoLTE2YTggOCAwIDAgMS04LThtLTgwIDMyYTggOCAwIDAgMS04IDhINjRhOCA4IDAgMCAxIDAtMTZoMTZhOCA4IDAgMCAxIDggOG0wIDMyYTggOCAwIDAgMS04IDhINjRhOCA4IDAgMCAxIDAtMTZoMTZhOCA4IDAgMCAxIDggOG0yNC0zMmE4IDggMCAwIDEgOC04aDE2YTggOCAwIDAgMSAwIDE2aC0xNmE4IDggMCAwIDEtOC04bTU2IDBhOCA4IDAgMCAxIDgtOGgxNmE4IDggMCAwIDEgMCAxNmgtMTZhOCA4IDAgMCAxLTgtOG0wIDMyYTggOCAwIDAgMSA4LThoMTZhOCA4IDAgMCAxIDAgMTZoLTE2YTggOCAwIDAgMS04LTgiLz48L3N2Zz4='),
(9, 'Grange', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxnIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgY29sb3I9IiMwMDAwMDAiPjxwYXRoIGQ9Im00LjM2MyA2LjI5NmwtMS4wMTggMi4zMWMtLjE3Mi4zOS0uMjU4LjU4NS0uMzAxLjc5MkMzIDkuNjA2IDMgOS44MTggMyAxMC4yNDZ2OS43MzZjMCAuOTUxIDAgMS40MjcuMjkzIDEuNzIzQzMuNTg2IDIyIDQuMDU3IDIyIDUgMjJoMTRjLjk0MyAwIDEuNDE0IDAgMS43MDctLjI5NmMuMjkzLS4yOTUuMjkzLS43Ny4yOTMtMS43MjJWOS44MzdjMC0uNDc0IDAtLjcxMS0uMDUzLS45NGMtLjA1NC0uMjI4LS4xNi0uNDQtLjM3LS44NjRsLS45MjItMS44NjJjLS4zMjQtLjY1NC0uNDg2LS45OC0uNzQ0LTEuMjI2cy0uNTkxLS4zOS0xLjI1OC0uNjc4bC00LjA3Ny0xLjc2M0MxMi43OTkgMi4xNjggMTIuNDEgMiAxMiAycy0uNzk5LjE2OC0xLjU3Ni41MDRMNi40NDIgNC4yMjZjLS43MTIuMzA4LTEuMDY5LjQ2Mi0xLjMzOC43M3MtLjQyNi42MjUtLjc0MSAxLjM0TTcgMjJ2LTltMTAgMHY5TTcgMTNsMTAgOU03IDIybDEwLTlNMyAxM2gxOCIvPjxwYXRoIGQ9Ik0xMiAxMGEyIDIgMCAxIDAgMC00YTIgMiAwIDAgMCAwIDQiLz48L2c+PC9zdmc+'),
(10, 'Camping', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjU2IDI1NiI+PHBhdGggZmlsbD0iIzAwMDAwMCIgZD0ibTI1NS4zMSAxODguNzVsLTY0LTE0NEE4IDggMCAwIDAgMTg0IDQwSDcyYTggOCAwIDAgMC03LjI3IDQuNjlhLjIuMiAwIDAgMCAwIC4wNnYuMTJMLjY5IDE4OC43NUE4IDggMCAwIDAgOCAyMDBoMjQwYTggOCAwIDAgMCA3LjMxLTExLjI1TTY0IDE4NEgyMC4zMUw2NCA4NS43Wm0xNiAwVjg1LjdsNDMuNjkgOTguM1ptNjEuMiAwTDg0LjMxIDU2aDk0LjQ5bDU2Ljg5IDEyOFoiLz48L3N2Zz4='),
(11, 'Maison', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMzIgMzIiPjxwYXRoIGZpbGw9IiMwMDAwMDAiIGQ9Ik0xNi42MTIgMi4yMTRhMS4wMSAxLjAxIDAgMCAwLTEuMjQyIDBMMSAxMy40MTlsMS4yNDMgMS41NzJMNCAxMy42MjFWMjZhMi4wMDQgMi4wMDQgMCAwIDAgMiAyaDIwYTIuMDA0IDIuMDA0IDAgMCAwIDItMlYxMy42M0wyOS43NTcgMTVMMzEgMTMuNDI4Wk0xOCAyNmgtNHYtOGg0Wm0yIDB2LThhMiAyIDAgMCAwLTItMmgtNGEyIDIgMCAwIDAtMiAydjhINlYxMi4wNjJsMTAtNy43OWwxMCA3LjhWMjZaIi8+PC9zdmc+'),
(12, 'Hôtel', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxnIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgY29sb3I9IiMwMDAwMDAiPjxwYXRoIGQ9Ik0zIDR2MTZjMCAuOTQzIDAgMS40MTQuMjkzIDEuNzA3UzQuMDU3IDIyIDUgMjJoMTRjLjk0MyAwIDEuNDE0IDAgMS43MDctLjI5M1MyMSAyMC45NDMgMjEgMjBWNE0xMC41IDh2MS41bTAgMS41VjkuNW0zLTEuNXYxLjVtMCAxLjVWOS41bS0zIDBoMyIvPjxwYXRoIGQ9Ik0xNCAyMnYtNGEyIDIgMCAxIDAtNCAwdjRNMiA0aDZjLjY0LTEuMTczIDIuMTktMiA0LTJzMy4zNi44MjcgNCAyaDZNNiA4aDFtLTEgNGgxbS0xIDRoMW0xMC04aDFtLTEgNGgxbS0xIDRoMSIvPjwvZz48L3N2Zz4='),
(13, 'Cabane', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxnIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgY29sb3I9IiMwMDAwMDAiPjxwYXRoIGQ9Ik02IDEyaDEybDIgMTBINHoiLz48cGF0aCBkPSJtOSAyMmwuNjc4LTMuM2MuMTU0LS43NDguMjMxLTEuMTIyLjUwOC0xLjM0MmMuNTc2LS40NiAzLjAxLS40OTQgMy42MjggMGMuMjc3LjIyLjM1NC41OTQuNTA4IDEuMzQzTDE1IDIyTTEyIDMuMkw1LjU0NCA4LjQzOGMtMS44MjcgMS40ODMtMi43NCAyLjIyNC0yLjUwOSAyLjg5M1M0LjQzNyAxMiA2Ljc3NiAxMmgxMC40NDhjMi4zNCAwIDMuNTEgMCAzLjc0LS42NjljLjIzMi0uNjY5LS42ODEtMS40MS0yLjUwOC0yLjg5M3ptMCAwTDEzLjQ3OSAyTTEyIDMuMkwxMC41MjEgMk0xMiAxMlY5bS00IDN2LTEuNW04IDEuNXYtMS41TTIgMjJoMjAiLz48L2c+PC9zdmc+'),
(14, 'Moulin', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjU2IDI1NiI+PHBhdGggZmlsbD0iIzAwMDAwMCIgZD0iTTIyNCAyMjRoLTQxLjA2bC02LjMtNDQuMTJsMy4yNCAxLjkxYTE2IDE2IDAgMCAwIDIxLjkxLTUuNjdsMTItMjAuMzRhMTYgMTYgMCAwIDAtNS42Ny0yMS45MWwtMzUtMjAuNjFsNDAuNjktNjkuMTNhMTYgMTYgMCAwIDAtNS42Ny0yMS45MWwtMjAuMzQtMTJhMTYgMTYgMCAwIDAtMjEuOTEgNS42N2wtMjAuNjEgMzVsLTY5LjE2LTQwLjY3YTE2IDE2IDAgMCAwLTIxLjkxIDUuNjdsLTEyIDIwLjMzYTE2IDE2IDAgMCAwIDUuNjcgMjEuOTJsMzUgMjAuNjFsLTQwLjY3IDY5LjEzYTE2IDE2IDAgMCAwIDUuNjcgMjEuOTFsMjAuMzQgMTJhMTUuNTcgMTUuNTcgMCAwIDAgMTAuNTggMkw3My4wNiAyMjRIMzJhOCA4IDAgMCAwIDAgMTZoMTkyYTggOCAwIDAgMCAwLTE2bS0yNC03Ni4zNEwxODggMTY4bC02OS4xMy00MC42OWwxMi0yMC4zNVpNMTc5LjY2IDI0TDIwMCAzNmwtNDAuNjkgNjkuMTRMMTM5IDkzLjE3Wk01NiA0NC4zNUw2OCAyNGw2OS4xNCA0MC43bC0xMiAyMC4zNVpNNzYuMzQgMTY4TDU2IDE1Nmw0MC42OS02OS4xNGwyMC4zNiAxMlptMTIuODggNTZMOTggMTYyLjhsMTIuNzctMjEuN0wxNTkgMTY5LjVsNy43OSA1NC41WiIvPjwvc3ZnPg=='),
(15, 'Maison d\'hôte', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxnIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgY29sb3I9IiMwMDAwMDAiPjxwYXRoIGQ9Ik00IDV2MTRoMTZWMyIvPjxwYXRoIGQ9Ik0xNCAxOXYtNS40NjNjMC0yLjE0My00LTEuOTUzLTQgMFYxOW00IDNoLTRNMyA1bDcuNzM1LTIuNzRjMS4yNTQtLjM0NyAxLjI3Ni0uMzQ3IDIuNTMgMEwyMSA1bS04Ljk4OCAzSDEyIi8+PC9nPjwvc3ZnPg=='),
(16, 'Champ', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjU2IDI1NiI+PHBhdGggZmlsbD0iIzAwMDAwMCIgZD0iTTIzMiAxNThhNiA2IDAgMCAwIDAtMTJhMjMwLjEgMjMwLjEgMCAwIDAtNjYuMTEgOS42NWEyNjAgMjYwIDAgMCAwLTIzLjA3LTEzLjI4QTI0OC4zIDI0OC4zIDAgMCAxIDIzMiAxMjZhNiA2IDAgMCAwIDAtMTJjLTYgMC0xMiAuMjItMTggLjYyVjgwYTYgNiAwIDAgMC0yLjQtNC44bC02NC00OGE2IDYgMCAwIDAtNy4yIDBsLTY0IDQ4QTYgNiAwIDAgMCA3NCA4MHYzOC43N0EyNjQuMyAyNjQuMyAwIDAgMCAyNCAxMTRhNiA2IDAgMCAwIDAgMTJhMjQ5IDI0OSAwIDAgMSAxOTUuMTcgOTMuNzVhNiA2IDAgMCAwIDQuNjkgMi4yNWE2IDYgMCAwIDAgNC42Ny05Ljc1YTI2NSAyNjUgMCAwIDAtMTguNjktMjAuOTRBMTkxIDE5MSAwIDAgMSAyMzIgMTkwYTYgNiAwIDAgMCAwLTEyYTE5OSAxOTkgMCAwIDAtMzMuMjEgMi43OXEtOS42My04LjY1LTIwLTE2LjI1QTIxOC43IDIxOC43IDAgMCAxIDIzMiAxNThtLTEwNi0yMy40NFYxMDJoMzZ2MjEuNDZhMjU5IDI1OSAwIDAgMC0zMy45MyAxMlpNODYgODNsNTgtNDMuNUwyMDIgODN2MzIuNzFhMjYxIDI2MSAwIDAgMC0yOCA0LjczVjk2YTYgNiAwIDAgMC02LTZoLTQ4YTYgNiAwIDAgMC02IDZ2MzMuODVhMjU5IDI1OSAwIDAgMC0yOC04LjQ2Wm00OS4xNyAxMzYuMzJhNiA2IDAgMCAxLTguMzIgMS42OEExODUuMTQgMTg1LjE0IDAgMCAwIDI0IDE5MGE2IDYgMCAwIDEgMC0xMmExOTcuMSAxOTcuMSAwIDAgMSAxMDkuNDkgMzNhNiA2IDAgMCAxIDEuNjggOC4zMm00OS44LTcuNjFhNiA2IDAgMSAxLTguNCA4LjU3QTIxNi44IDIxNi44IDAgMCAwIDI0IDE1OGE2IDYgMCAwIDEgMC0xMmEyMjguNzQgMjI4Ljc0IDAgMCAxIDE2MSA2NS43MVoiLz48L3N2Zz4='),
(17, 'Maison bateau', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMwMDAwMDAiIGQ9Ik0xMiAxN3EtMS4wNDYgMC0xLjU1NC41dC0xLjc3MS41cS0xLjIzMyAwLTEuNzktLjVxLS41NTgtLjUtMS41MzUtLjVxLS43NTggMC0xLjIyMS4zODZxLS40NjQuMzg1LTEuMTEuNTQ3cS0uMjA4LjA2MS0uMzYzLS4wODl0LS4xNTYtLjM2M3EwLS4yMzMuMTU2LS40MDF0LjM1Ny0uMjUzcS41NC0uMjQ0Ljk4Ny0uNTM2UTQuNDQ2IDE2IDUuMzI1IDE2cTEuMjU4IDAgMS44MjUuNXQxLjUuNXExLjAwOCAwIDEuNTY2LS41cS41NTktLjUgMS43ODQtLjV0MS43ODQuNXQxLjU2Ni41cS45MzMgMCAxLjUtLjV0MS44MjUtLjVxLjkzNyAwIDEuMzQ0LjI4MnQuOTY4LjU0NXEuMjAyLjA4NC4zNTcuMjUzdC4xNTYuNHEwIC4yMTQtLjE1Ni4zNjR0LS4zNjMuMDg5cS0uNjQ3LS4xNjItMS4xMjktLjU0OFExOS4zNjkgMTcgMTguNjUgMTdxLS45NzcgMC0xLjUzNC41cS0uNTU4LjUtMS43OTEuNXEtMS4yNjMgMC0xLjc3MS0uNVQxMiAxN20tNS40OC0zcS0uNTA1IDAtLjk2OC0uMTc3dC0uODEyLS41NDRsLS42NzUtLjY5NHEtLjE0LS4xNC0uMTMzLS4zNDJ0LjE1Mi0uMzQ3cS4xNDEtLjE0LjMzMi0uMTQzdC4zMzguMTM4bC42OTQuNjc0cS4yMDguMjA4LjQ4Mi4zMjJ0LjU5LjExM0g4VjguODk0bC0uOTI5LjY4OXEtLjE3Ny4xMTUtLjM2Mi4wOTFxLS4xODYtLjAyNC0uMzItLjIwMXEtLjEzNS0uMTc3LS4xMTQtLjM2M3EuMDIxLS4xODUuMTk4LS4zMmw0LjU2NC0zLjM3N3EuMjE3LS4xNjEuNDU2LS4yMzJUMTIgNS4xMDl0LjUwNy4wNzJ0LjQ1Ny4yMzJsNC41NDQgMy4zNThxLjE3Ny4xMzUuMi4zM3EuMDI1LjE5NS0uMTEuMzcycS0uMTM0LjE3Ny0uMzI2LjIxcS0uMTkxLjAzNC0uMzY4LS4xTDE2IDguOTE5VjEzaDEuNDhxLjMxNiAwIC41OS0uMTEzdC40ODItLjMyMmwuNjk0LS42NzRxLjE0LS4xNDEuMzQyLS4xNDF0LjM0Ny4xNDZxLjE0LjE0LjE0LjM0NHQtLjE0LjM0NWwtLjY3NS42NzRxLS4zNjguMzY4LS44MjEuNTU1cS0uNDU0LjE4Ni0uOTU4LjE4NnpNOSAxM2gyLjV2LTEuNXEwLS4yMTMuMTQzLS4zNTdUMTIgMTF0LjM1Ny4xNDN0LjE0My4zNTdWMTNIMTVWOC4xNzVsLTIuNjM0LTEuOTVRMTIuMjEyIDYuMTEgMTIgNi4xMXQtLjM2NS4xMTVMOSA4LjE1NXptMCAwaDZ6Ii8+PC9zdmc+'),
(18, 'Yourte', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTEwLjE1NyAyLjQ1NmMtMi43MTEgMS4wNjYtNC44OSAyLjY3OS02LjMxNCA0LjAwNmMtLjYyNC41ODItLjkzNi44NzItLjgxOSAxLjIwNVMzLjU3NSA4IDQuNDQ0IDhoMTUuMTEzYy44NjggMCAxLjMwMiAwIDEuNDE5LS4zMzNzLS4xOTUtLjYyMy0uODItMS4yMDVjLTEuNDIyLTEuMzI3LTMuNjAyLTIuOTQtNi4zMTMtNC4wMDZDMTMuMDcgMi4xNTIgMTIuNjgzIDIgMTIgMnMtMS4wNy4xNTItMS44NDMuNDU2TTQuNDk3IDIyYy0uNjkzLS42OTMtMS4wMzgtMS40NTItMS4xMTgtMi40MUMzLjI1MyAxOC4wNzggMyAxNSAzIDE1cy4yNTMtMy4wNzcuMzgtNC41OWMuMDc5LS45NTguNDI0LTEuNzE3IDEuMTE3LTIuNDFtMTUuMDA2IDE0Yy42OTMtLjY5MyAxLjAzOC0xLjQ1MiAxLjExOC0yLjQxQzIwLjc0NyAxOC4wNzggMjEgMTUgMjEgMTVzLS4yNTMtMy4wNzctLjM4LTQuNTljLS4wNzktLjk1OC0uNDI0LTEuNzE3LTEuMTE3LTIuNDFNMyAyMmgxOE0zIDE1aDZtNiAwaDZNOSAyMnYtOGMwLTEuNjU1LjM0NS0yIDItMmgyYzEuNjU1IDAgMiAuMzQ1IDIgMnY4bS0yLjk5MS03SDEyIiBjb2xvcj0iIzAwMDAwMCIvPjwvc3ZnPg=='),
(19, 'Container', 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMTQgMTQiPjxwYXRoIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBkPSJNMTIuNzUgMTEuNXYtOUgxLjI1djl6bS43NS05SC41bTEzIDlILjVNNCA1djRtMy00djRtMy00djQiLz48L3N2Zz4=');

-- --------------------------------------------------------

--
-- Structure de la table `commenter`
--

CREATE TABLE `commenter` (
  `utilisateurs_id` int(11) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `avis` varchar(255) NOT NULL,
  `note_loueur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commenter`
--

INSERT INTO `commenter` (`utilisateurs_id`, `locations_id`, `avis`, `note_loueur`) VALUES
(1, 10, 'Super endroit j\'adore !', 3),
(1, 11, 'Super endroit j\'adore !', 4),
(1, 12, 'Séjour très agréable et dépaysant. Le tour en barque pour atteindre la cabane est charmant. Le bain nordique est parfait pour se détendre. Les installations sont sommaires mais suffisantes pour un court séjour.', 4),
(2, 14, 'Je ne suis jamais allé dans un endroit comme celui-ci. nous avons absolument adoré. la chambre, la vue, la région. magnifique !', 5),
(4, 11, 'Un séjour incroyable! La Birdbox offre une vue imprenable sur les montagnes. La randonnée jusqu\'à la cabane est une belle aventure. Parfait pour se déconnecter et profiter de la nature. Très recommandé', 5),
(4, 12, 'La cabane est adorable et l\'endroit est très calme et reposant. Les toilettes sèches et l\'eau limitée ne sont pas dérangeants pour un court séjour. La vue depuis la terrasse est splendide.', 4),
(5, 10, 'Un séjour romantique et inoubliable! La vue à 360 degrés est spectaculaire et le moulin est magnifiquement restauré. Idéal pour une lune de miel. Le jardin est un vrai plus pour se détendre.', 5),
(6, 10, 'Séjour fabuleux dans ce moulin restauré avec goût. La vue à 360 degrés est incroyable et le jardin est magnifique. Parfait pour une lune de miel ou une escapade romantique. Très recommandé!', 5),
(6, 11, 'Un véritable paradis pour les amateurs de plein air! La vue est incroyable et l\'isolement total. La randonnée fait partie du charme de l\'endroit. Je recommande fortement pour une escapade nature.', 5),
(6, 12, 'Un véritable havre de paix! La cabane est magnifique et l\'environnement est superbe. Le bain nordique est un must. On se sent vraiment loin de tout, en pleine nature. Expérience exceptionnelle.', 5),
(6, 14, 'Le lieu est fascinant et la vue magnifique, mais le confort pourrait être amélioré. Les mouvements de la grue peuvent être un peu perturbants pour ceux qui ont le sommeil léger.', 3),
(7, 10, 'Le lieu est magnifique et la vue depuis le moulin est incroyable. Cependant, le Wi-Fi était assez lent et la climatisation pas très efficace. Le séjour reste agréable malgré ces petits inconvénients.', 3),
(7, 12, 'Séjour désastreux. L\'accès en barque était compliqué et dangereux par mauvais temps. Les toilettes sèches étaient insupportables, et devoir aller jusqu\'à l\'éco-hutte pour se doucher est très inconfortable. Je ne recommande pas.', 0),
(8, 10, 'Parfait pour une escapade romantique. Le moulin est magnifique et très bien décoré. Le jardin est immense et bien entretenu. Nous avons adoré notre séjour et nous reviendrons sûrement.', 5),
(8, 11, 'Très belle expérience en pleine nature. La randonnée est un peu exigeante, surtout par temps humide, mais l\'arrivée à la Birdbox en vaut la peine. Endroit parfait pour se déconnecter et apprécier les montagnes.', 5),
(8, 12, 'L\'endroit est très beau et la cabane est bien située, mais les toilettes sèches et l\'absence de salle de bain privative sont un inconvénient. Le bain nordique est un plus agréable, mais cela reste une expérience rustique.', 3),
(8, 14, 'Déçu par le bruit constant provenant des événements dans le studio. Les suites sont belles, mais difficiles de se reposer correctement. Je ne recommanderais pas pour un séjour reposant.', 2),
(16, 11, 'Séjour très agréable et dépaysant. La Birdbox est bien située pour profiter des paysages. La randonnée est un peu difficile par temps humide, mais l\'expérience en vaut la peine. Le petit-déjeuner livré était un plus appréciable.', 4),
(16, 14, 'Un endroit exceptionnel! Le luxe et le confort des suites sont impressionnants. J\'ai adoré le concept et l\'originalité de l\'endroit. Idéal pour une escapade romantique.', 5),
(18, 10, 'Très beau jean moulin', 5),
(20, 12, 'J\'ai mal dormi a cause des chats', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `prenom`, `nom`, `email`, `sujet`, `message`, `date_creation`) VALUES
(12, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test', 'test', '2024-03-29 15:22:42'),
(13, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test', 'test', '2024-03-29 15:36:06'),
(20, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test', 'test', '2024-03-29 20:34:31'),
(21, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test', 'message pour vérifié le template', '2024-04-30 22:41:07'),
(22, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test template mail', 'coucou je suis un test pour le template de mail contact', '2024-04-30 22:42:45'),
(23, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test mailjet', 'test', '2024-05-01 09:33:48'),
(24, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test mailjet', 'test', '2024-05-01 09:37:46'),
(25, 'test', 'test', 'gunride56.discord@gmail.com', 'test mailjet', 'test', '2024-05-01 09:52:21'),
(26, 'test', 'test', 'gunride56@gmail.com', 'test mailjet', 'test', '2024-05-01 09:54:43'),
(27, 'test', 'test', 'gunride56@gmail.com', 'test mailjet', 'test', '2024-05-01 09:57:54'),
(28, 'Théotime', 'Pagies', 'theotime@gmail.com', 'test', 'test mailjet', '2024-05-02 20:12:44'),
(29, 'Elisia', 'SOUMBOU', 'soumbouelisia1@gmail.com', 'demande de location', 'Bonjour, je souhaite faire une location mais j\'ai un petit budget', '2024-06-07 15:00:37');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240202162245', '2024-02-02 16:23:26', 96),
('DoctrineMigrations\\Version20240203173402', '2024-02-23 09:09:42', 185),
('DoctrineMigrations\\Version20240223092710', '2024-02-23 09:27:22', 180),
('DoctrineMigrations\\Version20240223093056', '2024-02-23 09:31:16', 164),
('DoctrineMigrations\\Version20240223093916', '2024-02-23 09:39:25', 140),
('DoctrineMigrations\\Version20240223095027', '2024-02-23 09:50:53', 208),
('DoctrineMigrations\\Version20240223095543', '2024-02-23 09:55:52', 40),
('DoctrineMigrations\\Version20240223110743', '2024-02-23 11:08:42', 315),
('DoctrineMigrations\\Version20240223111141', '2024-02-23 11:11:48', 47),
('DoctrineMigrations\\Version20240223131704', '2024-02-23 13:17:32', 236),
('DoctrineMigrations\\Version20240223132301', '2024-02-23 13:23:06', 241),
('DoctrineMigrations\\Version20240223132533', '2024-02-23 13:25:48', 248),
('DoctrineMigrations\\Version20240304191641', '2024-03-04 19:16:54', 301),
('DoctrineMigrations\\Version20240304192135', '2024-03-04 19:21:41', 40),
('DoctrineMigrations\\Version20240305211652', '2024-03-05 21:17:22', 49),
('DoctrineMigrations\\Version20240307182132', '2024-03-07 18:23:21', 124),
('DoctrineMigrations\\Version20240307183706', '2024-03-07 18:37:17', 138),
('DoctrineMigrations\\Version20240311205408', '2024-03-11 20:54:17', 177),
('DoctrineMigrations\\Version20240320145952', '2024-03-20 15:00:21', 381),
('DoctrineMigrations\\Version20240329133058', '2024-03-29 13:32:00', 811),
('DoctrineMigrations\\Version20240405124634', '2024-04-05 18:06:27', 1839),
('DoctrineMigrations\\Version20240405180904', '2024-04-05 18:09:31', 86),
('DoctrineMigrations\\Version20240405200213', '2024-04-05 20:02:31', 112),
('DoctrineMigrations\\Version20240409183520', '2024-04-09 18:35:35', 96),
('DoctrineMigrations\\Version20240426210224', '2024-04-26 21:02:37', 299),
('DoctrineMigrations\\Version20240531210716', '2024-05-31 21:07:28', 127);

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE `equipements` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `equipements`
--

INSERT INTO `equipements` (`id`, `libelle`) VALUES
(53, 'WIFI'),
(54, '2 Chambres'),
(55, 'Salon'),
(56, 'Cuisine'),
(57, 'Salle de bain'),
(58, '1 Chambre'),
(59, 'Grand espace libre'),
(60, 'Spa'),
(61, 'Balcon'),
(62, 'Grand étang'),
(63, 'Piscine'),
(64, 'Cuisine'),
(65, 'Parking'),
(66, 'Internet'),
(67, 'Chambre'),
(68, 'Front de mer'),
(69, 'Ascenseur'),
(70, 'WIFI'),
(71, 'Télévision');

-- --------------------------------------------------------

--
-- Structure de la table `equipements_locations`
--

CREATE TABLE `equipements_locations` (
  `equipements_id` int(11) NOT NULL,
  `locations_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `equipements_locations`
--

INSERT INTO `equipements_locations` (`equipements_id`, `locations_id`) VALUES
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(58, 11),
(59, 11),
(60, 12),
(61, 12),
(62, 12),
(63, 13),
(64, 13),
(65, 13),
(66, 13),
(67, 14),
(68, 14),
(69, 14),
(70, 14),
(71, 14);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `nom` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `locations_id`, `nom`) VALUES
(15, 10, '0152eceba6b7540cec134562431a9227.webp'),
(16, 10, '2fbf2893fd199d283c75cc32a1499c29.webp'),
(17, 10, 'd9a7e9bc3e43874bcfe53ec54dfe6b04.webp'),
(18, 10, '4ec55293890e148046b2ac95eaf4b630.webp'),
(19, 10, '942ad4e98c620e7008e0f97c5eccac0f.webp'),
(20, 10, '90f835e915799ec3f9cda18f4c069db8.webp'),
(21, 11, 'c5eee3384e89baa7d9d5dbf62f291712.webp'),
(22, 11, '2df47ed82af923c46c681e8bc200d02b.webp'),
(23, 11, '3a18a4ee10e738c66239a58ba23358f0.webp'),
(24, 11, '3fdac062e92ee7c4bc5b507949940889.webp'),
(25, 11, 'a7fdac16e94aa05cb49f8a02964a18bd.webp'),
(26, 11, '733cf2e799570bbb5ff2a1b59b3390c6.webp'),
(27, 12, 'f8365f73f995d92e8879416d17ae41d2.webp'),
(28, 12, 'c55b98c0d5058d73007d3e87a5f236df.webp'),
(29, 12, 'be819e133e142060cdf27a6dbdc35e25.webp'),
(30, 12, '30ff7892d464c3b4e586e1bfa139e7b6.webp'),
(31, 12, '858c2b22bfbf120725ea4d1f4edc6d22.webp'),
(32, 13, 'da26f9337efcdf175acbe49b5cf4e73a.webp'),
(33, 13, 'c03854130bf3184e3b3766bdaeab9b42.webp'),
(34, 13, 'fd1deb2fa08c2fbba3eae7ce6cc18c22.webp'),
(35, 13, '87b98fb464e203290d6fa4d902a6a594.webp'),
(36, 13, '274282391fb83eb48dfb23df55d2e8b3.webp'),
(37, 14, 'd8ce0b4325c5a4ecd8b7da87109ec38d.webp'),
(38, 14, '62836b7ab870e2cc9031adab252119a6.webp'),
(39, 14, '336c4876012e9f337be79c1e3436abc4.webp'),
(40, 14, 'd9acb7375a654d1079b83316b9f2e806.webp'),
(41, 14, 'efb465d96ed5f228dad3f6b68d85e8ed.webp'),
(42, 14, 'c63fa919276ee6962590e4258459649f.webp'),
(43, 15, 'b7a75060693abbeeaa4e4ee4a8e1f20d.webp'),
(44, 15, '477b3ecc4694d2778d1e007917beb0a9.webp'),
(45, 15, 'ea78ba1fe23e8d99e5bcbf0e59efb6af.webp'),
(46, 15, 'c0cd5e008bfae50cb4e1a7e97619fadf.webp'),
(47, 15, '313c75a8955b596e3afe72f3bbf99acf.webp'),
(48, 15, '8d50f7883140a8d470e9e3903ad7ffaf.webp');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `utilisateurs_id` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `prix` double NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `date_debut_disponibilite` date NOT NULL,
  `capacite_maximal` int(11) NOT NULL,
  `pmr` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `date_fin_disponibilite` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id`, `utilisateurs_id`, `nom`, `description`, `prix`, `adresse`, `date_debut_disponibilite`, `capacite_maximal`, `pmr`, `actif`, `date_fin_disponibilite`) VALUES
(10, 1, 'Moinho das Feteiras | The Mill  Partager', 'Construit au XIXe siècle, avec une vue à 360 degrés sur la mer et les environs au dernier étage.\r\nIl dispose d\'une chambre avec un grand lit King Size, d\'un salon très bien décoré avec kitchenette et d\'un WC.\r\nWi-Fi gratuit, climatisation, télévision LED et lecteur DVD.\r\nParking privée à l intérieur des lieux, offrant une sécurité supplémentaire.\r\nParfait pour une expérience inoubliable en lune de miel.\r\nLe logement\r\nIl dispose d\'un jardin de 4 000 m avec des arbres fruitiers subtropicaux, des arbres de jardin et des fleurs.\r\nEn plus du moulin idéal pour 2 personnes, il dispose de deux autres logements : la maison de Mó de Cima idéale jusqu\'à 3 personnes et la maison de Moleiro qui tient 4 personnes.\r\nAccès des voyageurs\r\nLes voyageurs ont accès à tous les espaces de la propriété.', 152, 'Ponta Delgada, Portugal', '2024-02-02', 5, 1, 1, '2024-10-31'),
(11, 1, 'Boîte à oiseaux confortable', 'Profitez de l\'enceinte détendue et confortable de la Birdbox. Dormez juste à côté de la nature et de ses environs incroyables. Allongez-vous et regardez les montagnes spectaculaires tout autour de vous. Enfilez vos skis et faites un voyage à couper le souffle sur les sentiers à proximité. Randonnée jusqu\'à Langelandsvatnet en été et baignade dans l\'eau énergisante. Votre imagination est la limite de ce que vous pouvez découvrir.\r\nLe logement\r\nLa Birdbox est située à 15 minutes en voiture de Førde. À votre arrivée à la station de ski de Langeland, vous passerez par un portail de stationnement automatique et vous vous garerez près de la station où vous rencontrerez l\'hôte. Après le stationnement, il y a une randonnée de 45 minutes jusqu\'à la Birdbox, qui peut être assez humide lorsqu\'il n\'y a pas de neige. De bonnes chaussures de randonnée sont recommandées, et des équipements supplémentaires tels que des raquettes ou des skis peuvent être loués chez nous gratuitement. Normalement, nous guidons les voyageurs vers la Birdbox s\'ils ne connaissent pas déjà le chemin.\r\n\r\nL\'épicerie la plus près se trouve à Førde, il est donc important d\'apporter suffisamment de nourriture pour le séjour. Nous pouvons vous proposer le petit-déjeuner, qui sera là à votre arrivée. Le dîner peut également être organisé auprès d\'un chef ou d\'un restaurant local dans un sac à emporter.\r\nContactez-nous pour plus d\'informations à ce sujet.', 259, 'Gaular, Norvège', '2024-08-15', 2, 1, 1, '2025-07-25'),
(12, 1, 'Cabane Spa Sauvage pour 2 personnes', 'Au bout de l’étang, vous tomberez sur cette magnifique cabane flottante et pénétrerez le décor sauvage des lieux pour vivre pleinement l’expérience des cabanes Coucoo Grands Reflets.\r\n\r\nAprès un tour de barque pour accéder à votre nid, plongez dans votre bain nordique pour un pur moment de détente sur les eaux calmes de l’étang. La terrasse à 360° de la cabane Spa Sauvage vous permettra de profiter pleinement du panorama !\r\nAutres points à prendre en note\r\nCette cabane est équipée de toilettes sèches et d’une réserve d’eau de 10L. Nos salles de bain individuelles et toutes équipées se trouvent dans l’éco-hutte au niveau du bâtiment d’accueil et sont accessibles 24h/24', 310, 'Joncherey, France', '2024-01-01', 2, 1, 1, '2024-08-31'),
(13, 1, 'Maison de Hobbits unique et insolite', 'Pour des nuits magiques et insolites, découvrez notre Kerterre, une vraie sculpture en matériaux naturels qui ressemble à une petite maison de Hobbits.\r\n\r\nVous apprécierez Cablanc pour la beauté des lieux, le calme et la nature, Vous profiterez aussi de l\'écolieu avec une salle de bain indépendante et la Cuisine d\'été à 100m de la Kerterre.\r\n\r\nPossibilité de produits fermiers, bio et locaux sur place.\r\n\r\nNombreux ateliers possible sur demande.\r\n\r\nProche d\'activités diverses (châteaux, kayak...)\r\nLe logement\r\nParfaite pour les personnes adeptes de la vie simple au cœur de la nature.\r\nIdéale pour un couple\r\nAccès à la piscine et à la grande terrasse tous les jours de 16h à 19h.\r\nSalon de thé & Bar à vin et Petite restauration sur place.\r\nAccès des voyageurs\r\nVous aurez accès à l\'écolieu.\r\nLa terrasse avec piscine vous sont accessibles de 16h à 19h tous les jours.\r\nNous avons également un salon de thé et un bar à vin, l\'Heure Bleue ainsi qu\'une boutique proposant des produits locaux et régionaux.\r\n\r\nSorbets 100% made in Cablanc\r\nTous nos produits sont locaux ou biologiques\r\n\r\nLes enfants et les parents peuvent nourrir les animaux de la ferme tous les jours à 18h. Il y a aussi une aire de jeux nature, une table de ping-pong et un parcours sensoriel, ludique et pédagogique à disposition sur l\'écolieu.\r\n\r\nDe nombreux ateliers et activités sont disponibles sur demande.\r\nSTAGE / SEMAINE / personne : 150€ ! Prix Exceptionnel > me contacter\r\nAutres remarques\r\nServices payants :\r\n- serviettes de toilette 5€/personne\r\n- machine à laver 5€\r\n\r\nDe nombreux ateliers et activités sont disponibles sur demande.\r\nSTAGE / SEMAINE / personne : 150€ (ou à la carte)\r\nPrix Exceptionnel > me contacter\r\n\r\nMénage \"la démarche ECO RESPONSABLE\" : des produits sanitaires écologiques sont à votre disposition pour nettoyer la Kerterre. Sinon les frais de ménage sont de 50€.\r\n\r\nEnvoi de documentation sur simple demande, n\'hésitez pas à visiter notre site \"cablanc\" pour plus d\'informations.', 55, 'Saussignac, France', '2024-05-07', 4, 1, 1, '2026-09-05'),
(14, 1, 'La Suite secrète', 'Situé au coeur du quai NDSM d\'Amsterdam avec vue panoramique sur la ville. Au sommet de la grue se trouvent trois suites spacieuses, avec sous un studio pour les événements d\'entreprise et de musique. Seule une invitation privée vous montre le secret le mieux gardé d\'Amsterdams qui est caché derrière une porte en fer. Vous entrerez dans un monde complètement différent après avoir fermé cette porte : une scène souterraine où des artistes, des esprits libres et des gens ouverts d\'esprit se rencontrent. La hauteur et la structure rendent votre séjour complètement incognito.\r\nLe logement\r\nÀ mi-chemin de la grue se trouve le studio : un lieu pour les événements d\'entreprise et de musique qui a lieu tout au long de l\'année, mais surtout pendant la danse d\'Amsterdam. Les marques et DJ de renommée mondiale utilisent la grue comme plate-forme pour leur spectacle, leurs lancements d\'albums et leurs événements (privés). Le Faralda Studio fait partie des plus petites salles (avec un maximum de 80 personnes), mais a un impact énorme dans l\'industrie de la musique.  \r\n\r\nEn plus du studio se trouve les « coulisses » : la suite secrète - qui n\'est accessible qu\'aux invités, VIP et intimistes pendant les sessions de studio. Avec les deux autres suites, Mystique et Secret, vous pouvez également y dormir en tant que voyageur.   \r\n\r\nToutes les suites sont spacieuses avec deux niveaux. Le salon et l\'espace de couchage séparé sont joliment décorés et équipés de toutes les commodités nécessaires. La salle de bain séparée avec douche à effet pluie et toilettes est située derrière un panneau de verre coulissant caractéristique. Les murs de la douche sont décorés de parties antiques d\'un croiseur océanique. Un escalier mène à votre coin couchage avec un grand lit king size et une baignoire entourée de peintures et d\'éléments de design. La grue elle-même coule toujours dans le vent, donc la vue depuis vos suites est régulièrement différente.\r\nAutres remarques\r\nVotre séjour soutient la préservation de cette icône monumentale. En admirant le monde d\'une beauté à couper le souffle, Faralda Crane prépare le terrain pour s\'épanouir. Chacune de nos trois suites de luxe est conçue et aménagée de manière unique avec des équipements haut de gamme pour vous assurer un séjour confortable et inoubliable. Du décor élégant à la technologie de pointe, aucun détail n\'a été négligé.', 889, 'Hôte : Faralda Crane Hotel, Amsterdam, Pays-Bas', '2024-03-05', 15, 1, 1, '2026-05-21'),
(15, 2, 'Château - Guichainville, France', 'À propos de ce logement\r\nÀ seulement une heure de Paris, un endroit magique où le confort et la tradition rencontrent le luxe raffiné. Notre château, construit en 1620, a été agrandi et amélioré au fil des siècles : il a bénéficié d\'une rénovation complète, tandis que les éléments originaux ont été soigneusement préservés.\r\n\r\nNous sommes là pour vous accueillir, et pour vous aider à créer de bons souvenirs avec votre famille, vos amis et vos collègues en groupes intimes de 16 personnes avec 4 matelas et 3 lits bébé.(Nous avons finalement des lits pour 40)\r\n\r\n\r\n\r\n​\r\n​\r\nLe logement\r\nNous sommes ravis de vous offrir le château à l\'usage exclusif des 2 premiers étages, qui comprend 4 suites, 1 suite familiale ( double) et 2 chambres (ROSE et DORÉ), pour un séjour de 8 à 16 voyageurs ( veuillez noter que nous pouvons accueillir jusqu\'à 35 invités dans le château ou 43 invités à Chateau et à la dépendance, mais avec des conditions différentes. Si c\'est ce que vous recherchez, vous aurez tout le domaine à votre disposition, mais veuillez d\'abord me contacter).\r\n\r\nAu rez-de-chaussée, vous aurez l\'usage exclusif du salon, de la salle à manger, de la cuisine et de la suite Mumbai (la seule sans escalier).\r\n\r\nAu premier étage, vous trouverez :\r\n\r\n1. Suite VERTE/BLEUE, appartement familial avec 2 chambres à coucher et salle de bain avec superbes carreaux bleus. La vue depuis cet appartement se fait sur le parc en face du Château, sur le parc et la forêt à l\'arrière (et à partir de mai une piscine !) et sur la chapelle sur le côté.\r\n2. suite ROUGE, notre suite emblématique magnifiquement décorée, avec une superbe salle de bains avec baignoire, douche et toilettes, avec des armoires en bois avec une décoration rouge et or luxueuse. Cette suite donne sur le parc devant le château.\r\n3. Chambre ROSE, la seule avec un lit plus petit (140 cm), et avec une salle de bain juste en face du couloir, mais avec de splendides broderies au mur. La salle d\'eau dispose d\'une douche italienne, de toilettes et d\'une vue sur le parc et la forêt.\r\n4. Suite NOIRE ET BLANCHE, notre suite « mariage », extrêmement spacieuse, avec vue sur le parc devant le Château. La salle de bains dispose d\'une baignoire et d\'une WC.\r\n5. Suite VIOLETTE au bout du couloir, avec vue sur le parc et la forêt, et salle de bain avec baignoire et toilettes.\r\n6. Chambre DORÉE avec lit double, avec salle de bain partagée avec chambre ROSE.\r\n\r\nAu Rez de chaussée :\r\n\r\n* Salon très spacieux (Salon de 52 m2) de style splendide avec cheminée, piano, hauts plafonds (4 m)\r\n*Leading off the salon is\r\n6. Suite MUMBAI, avec lit maharaja, vue sur le parc et la forêt, et salle de bain avec douche et WC.\r\n* Salle à manger avec table pouvant accueillir 8 à 20 personnes, entièrement équipée pour un dîner royal : assiettes, verres à vin et champagne, assiettes en argent, lustres... bien sûr avec nappe et serviettes (40 m2)\r\n*Cuisine de 23 m2 avec plafonds hauts de 4m, entièrement équipée avec La Cornue (2 fours, 5 cuisinières à feu, grill) et grand barbecue rôti, deux réfrigérateurs, micro-ondes, machines à café, poêles, assiettes, verres...\r\n*Patry pour le stockage supplémentaire des provisions\r\n\r\nVous et vos invités pourrez profiter pleinement de notre parc de 3ha avec sa table extérieure et son belvédère, son immense barbecue et notre forêt de 13 ha pour les promenades, le jogging ou la méditation.\r\n\r\nLa nouvelle piscine chauffée est accessible exclusivement à nos voyageurs.\r\n\r\nNotre court de tennis privé est également à votre entière Nous avons des raquettes de tennis, mais nous vous suggérons d\'apporter les vôtres si vous souhaitez jouer pour des raisons sanitaires ;)\r\n\r\nNos invités viennent souvent fêter un anniversaire ou un anniversaire de anniversaires dans un petit groupe familial ou ami. La plupart de nos réservations sont pour les mariages, le mois d\'août est notre mois de « vacances » où la famille et les amis séjournent pendant 5 à 7 jours en profitant de l\'été autour de la piscine et des excursions à Deauville, Honfleur, Etretat, les plages de Normandie, Paris ...\r\n\r\nChâteau peut accueillir 35 voyageurs au total, et avec nos Annex Studios et Lodge jusqu\'à 43 voyageurs, mais l\'offre Airbnb est pour un petit groupe : 16 voyageurs avec une possibilité de 4 matelas et 3 lits bébé.\r\n\r\nNous pouvons également vous recommander des traiteurs et des restaurants à proximité.\r\n\r\nNous ne proposons pas de petit déjeuner car nous vous laissons dans votre cercle privé, mais nous recommandons fortement Jerome de P&J Atelier et ses croissants frais XXL livrés encore chaud directement au château !\r\n\r\nDites-moi juste quel est votre projet et ce dont vous avez besoin. Mon mari et moi adorons vous faire sentir choyé pendant votre séjour spécial !\r\n\r\n\r\n​\r\nAccès des voyageurs\r\nLes clients peuvent accéder à tout le parc, la forêt, la piscine et le terrain de tennis privé (avec réservation préalable chez nous)\r\nAutres remarques\r\nLe bâtiment principal du château est uniquement pour vous, mais nous avons une annexe et un gîte où d\'autres voyageurs (et nous) peuvent être (maximum 10 autres personnes ) à moins que vous ne réserviez tout le domaine.\r\n\r\nNous n\'acceptons plus les animaux de compagnie dans le château, uniquement dans les dépendances. Ils ne sont pas autorisés pendant les événements ( mariage, etc.) .\r\n\r\nLa piscine est ouverte de 10h00 à 20h00, sauf demande spécifique directement avec nous.\r\nVous êtes entièrement responsable de la sécurité de vos enfants, ils doivent toujours être accompagnés à la piscine et sur la propriété. Ne les laissez pas seuls, ni dans le château, ni à l\'extérieur.\r\n\r\n\r\nDimanche, la plupart des boutiques et restaurants sont fermés donc nous vous recommandons de faire des provisions avant ou de profiter de la journée pour visiter Rouen, Deauville ou Honfleur où tout est ouvert !\r\n\r\nFaites attention aux escaliers menant à l\'appartement.\r\nNous sommes une «propriété privée» et le public extérieur n\'est pas autorisé dans notre propriété.\r\n\r\nLes enfants ont dû être surveillés EN PERMANENCE pendant votre séjour.\r\n\r\nS\'il vous plaît, si vous avez un plan ou une demande spécifique, écrivez-moi avant et nous pourrons trouver une solution', 706, 'Guichainville, Normandie, France', '2024-05-05', 16, 1, 1, '2025-04-05');

-- --------------------------------------------------------

--
-- Structure de la table `locations_categories`
--

CREATE TABLE `locations_categories` (
  `locations_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locations_categories`
--

INSERT INTO `locations_categories` (`locations_id`, `categories_id`) VALUES
(10, 14),
(11, 19),
(12, 17),
(13, 11),
(13, 18),
(14, 8),
(15, 12),
(48, 13),
(49, 11),
(50, 10),
(51, 10),
(52, 9),
(53, 9),
(54, 9),
(55, 9),
(56, 9),
(56, 10),
(57, 10),
(58, 9);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:10:57', '2024-03-29 14:10:57', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:14:29', '2024-03-29 14:14:29', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:20:51', '2024-03-29 14:20:51', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:27:09', '2024-03-29 14:27:09', NULL),
(5, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:32:37', '2024-03-29 14:32:37', NULL),
(6, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:48:58', '2024-03-29 14:48:58', NULL),
(7, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:50:16', '2024-03-29 14:50:16', NULL),
(8, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 14:55:41', '2024-03-29 14:55:41', NULL),
(9, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"hello@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"you@example.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 15:14:37', '2024-03-29 15:14:37', NULL),
(10, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 15:17:12', '2024-03-29 15:17:12', NULL),
(11, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 15:20:04', '2024-03-29 15:20:04', NULL),
(12, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 15:22:42', '2024-03-29 15:22:42', NULL),
(13, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 15:36:06', '2024-03-29 15:36:06', NULL),
(14, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 19:28:31', '2024-03-29 19:28:31', NULL);
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(15, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"hello@hello.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:35:\\\"30e333c807-178e57@inbox.mailtrap.io\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-03-29 19:33:29', '2024-03-29 19:33:29', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE `reserver` (
  `utilisateurs_id` int(11) NOT NULL,
  `locations_id` int(11) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `statut` varchar(15) NOT NULL,
  `nombres_de_locataires` double NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reserver`
--

INSERT INTO `reserver` (`utilisateurs_id`, `locations_id`, `date_debut`, `date_fin`, `statut`, `nombres_de_locataires`, `id`) VALUES
(4, 14, '2024-05-21', '2024-05-24', 'transmis', 4, 1),
(1, 10, '2024-03-11', '2024-03-13', 'transmis', 1, 13),
(1, 10, '2024-03-04', '2024-03-06', 'transmis', 1, 14),
(1, 10, '2024-04-09', '2024-04-11', 'transmis', 2, 16),
(1, 10, '2024-05-07', '2024-05-09', 'transmis', 2, 18),
(1, 11, '2024-03-19', '2024-03-22', 'transmis', 1, 21),
(1, 11, '2024-03-12', '2024-03-14', 'transmis', 1, 22),
(2, 11, '2024-03-15', '2024-03-17', 'transmis', 1, 24),
(1, 11, '2024-03-29', '2024-03-30', 'transmis', 1, 25),
(1, 11, '2024-04-01', '2024-04-04', 'transmis', 1, 39),
(1, 11, '2024-04-08', '2024-04-27', 'transmis', 1, 40),
(1, NULL, '2024-05-23', '2024-04-26', 'transmis', 3, 44),
(1, 13, '2024-04-17', '2024-04-18', 'transmis', 4, 45),
(1, NULL, '2024-05-14', '2024-05-16', 'transmis', 4, 46),
(1, NULL, '2024-05-22', '2024-05-24', 'transmis', 3, 47),
(1, NULL, '2024-05-09', '2024-05-12', 'transmis', 4, 48),
(1, 15, '2024-05-21', '2024-05-24', 'transmis', 10, 74),
(1, 10, '2024-05-01', '2024-05-05', 'transmis', 3, 75),
(17, 10, '2024-06-01', '2024-06-01', 'transmis', 1, 76),
(18, 10, '2024-05-31', '2024-05-31', 'transmis', 1, 77),
(20, 12, '2024-05-15', '2024-05-15', 'transmis', 2, 78),
(25, 14, '2024-06-17', '2024-06-23', 'transmis', 7, 79),
(26, 12, '2024-06-19', '2024-06-22', 'transmis', 2, 80),
(1, 10, '2024-07-16', '2024-07-20', 'transmis', 3, 81),
(1, 15, '2024-08-14', '2024-08-18', 'transmis', 9, 82),
(1, 10, '2024-06-26', '2024-06-29', 'transmis', 3, 83),
(1, 12, '2024-06-27', '2024-06-30', 'transmis', 1, 84);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inscription` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `adresse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `date_inscription`, `adresse`, `telephone`) VALUES
(1, 'theotime@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua', 'Pagies', 'Théotime', '2024-02-02 16:27:25', '37 chemin du riez de l\'erelle', '0663351044'),
(2, 'test@gmail.com', '[]', '$2y$13$hRe0l5dZseuNAz3cR6le4eL.C1FtYTIRm8oMViFlgdtOPkRmX71ti', 'Devinchie', 'Nino', '2024-02-02 16:34:23', '37 chemin du riez de l\'erelle', '0663351044'),
(4, 'lucas@hotmail.fr', '[]', '$2y$13$JlNHDjH5JnWLclG7IkR.0eI6Ama.54fTC/wLLlgaEeKW9JYQUsNYW', 'Brtd', 'Lucas', '2024-03-17 14:18:00', '32 rue de la rue', '0626242526'),
(5, 'test2@gmail.com', '[]', '$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua', 'Bernard', 'Julien', '2024-03-28 21:42:26', 'test rue du test ', '0660000000'),
(6, 'test3@gmail.com', '[]', '$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua', 'Petit', 'Clara', '2024-03-28 22:14:57', 'test rue du test ', '0660000000'),
(7, 'test4@gmail.com', '[]', '$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua', 'Fournier ', 'Camille', '2024-03-28 22:16:18', 'test rue du test ', '0660000000'),
(8, 'test5@gmail.com', '[]', '$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua', 'Lambert', 'Antoine', '2024-03-28 22:16:44', 'test rue du test ', '0660000000'),
(12, 'testmail@gmail.com', '[]', '$2y$13$rFRIVE21LWfjcLtNmGd8dOFFrbR6j41WqZkyWEBDHYGV6SduijEQm', 'Caron', 'Hugo', '2024-04-30 19:51:12', 'test test test', '0600000000'),
(16, 'sophie@gmail.com', '[]', '$2y$13$ousIO//W5SJ.bqdJx26YA.Sty6.I2LK2/su9je6n5gbavk4bNDxpi', 'Dubois', 'Sophie', '2024-05-24 21:00:59', 'test prod rue de la prod', '0600000000'),
(17, 'jb@gmail.com', '[]', '$2y$13$5eRe1wEba4..OMt/705R2u0DPeTX.b19HC4PVRNEsAo5efUuTHtMq', 'JB', 'JB', '2024-06-02 16:20:04', '32 rue de la clef', '0621983436'),
(18, 'jean-baptiste.lavisse@eduservices.org', '[]', '$2y$13$/nxXq46yFHUpEu1ruaeODe06nCLMSbWYxce6PCd6wyu7nvenMJN/q', 'Lavisse', 'Jean-baptiste', '2024-06-02 16:21:49', '32 rue de la rue', '0606060306'),
(19, 'lucas.madranges@my-digital-school.org', '[]', '$2y$13$W0j2EtsoOCPU5tXVjX36GOap7C2.vguDHKaTWJ8jOq08zobkKPwpS', 'Magrange', 'Luka', '2024-06-02 16:25:15', '32 rue de la rue', '0666666666'),
(20, 'melissa.bertaud0615@gmail.com', '[]', '$2y$13$b2vYiRbBoKIHBQsCTfUiQeA4Ihwe5.1diDFW00gHb3AOJWqCbrHS.', 'Bertaud', 'Mélissa', '2024-06-03 22:11:25', '32 rue de la clef', '0635218800'),
(25, 'soumbouelisia1@gmail.com', '[]', '$2y$13$qC7BMKLwy6BAy0Y3yfBrVuA5xqY0ojixT3eu75B1TRSwSlSg6c97e', 'SOUMBOU', 'Elisia', '2024-06-07 14:57:58', '12 Rue Françoise Dolto', '0765794005'),
(26, 'emmaberthelotpro@gmail.com', '[]', '$2y$13$wRLKhm2UpLAAamnnzWdnUen4VhC5nqW9BjFD/sggqwb7JdYCSN2i6', 'Berthelot', 'Emma', '2024-06-07 15:04:59', '6 Rue Jean Moulin', '0677549359'),
(27, 'alix.chloe@yahoo.com', '[]', '$2y$13$hkKSXcRAtLwTwatoM/F2XO.u.javvm5Xm/2SnO4CWOl3eKdWbaQfe', 'DEMARCY', 'Chloé', '2024-06-07 15:07:12', '14 RUE MOLIERE 59800 Lille', '0750927099');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ajouter_en_favoris`
--
ALTER TABLE `ajouter_en_favoris`
  ADD PRIMARY KEY (`utilisateurs_id`,`locations_id`),
  ADD KEY `IDX_5425BB8F1E969C5` (`utilisateurs_id`),
  ADD KEY `IDX_5425BB8FED775E23` (`locations_id`);

--
-- Index pour la table `alerte_disponibilite`
--
ALTER TABLE `alerte_disponibilite`
  ADD PRIMARY KEY (`utilisateurs_id`,`categories_id`),
  ADD KEY `IDX_55F5DEBE1E969C5` (`utilisateurs_id`),
  ADD KEY `IDX_55F5DEBEA21214B7` (`categories_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commenter`
--
ALTER TABLE `commenter`
  ADD PRIMARY KEY (`utilisateurs_id`,`locations_id`),
  ADD KEY `IDX_AB751D0A1E969C5` (`utilisateurs_id`),
  ADD KEY `IDX_AB751D0AED775E23` (`locations_id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `equipements`
--
ALTER TABLE `equipements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `equipements_locations`
--
ALTER TABLE `equipements_locations`
  ADD PRIMARY KEY (`equipements_id`,`locations_id`),
  ADD KEY `IDX_C0AC25C7852CCFF5` (`equipements_id`),
  ADD KEY `IDX_C0AC25C7ED775E23` (`locations_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E01FBE6AED775E23` (`locations_id`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_17E64ABA1E969C5` (`utilisateurs_id`);

--
-- Index pour la table `locations_categories`
--
ALTER TABLE `locations_categories`
  ADD PRIMARY KEY (`locations_id`,`categories_id`),
  ADD KEY `IDX_5256C72DED775E23` (`locations_id`),
  ADD KEY `IDX_5256C72DA21214B7` (`categories_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9765E931E969C5` (`utilisateurs_id`),
  ADD KEY `IDX_B9765E93ED775E23` (`locations_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_497B315EE7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `equipements`
--
ALTER TABLE `equipements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `reserver`
--
ALTER TABLE `reserver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
