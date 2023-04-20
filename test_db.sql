-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: mariadb
-- Vytvořeno: Čtv 20. dub 2023, 14:52
-- Verze serveru: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204
-- Verze PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `test_db`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `DEPARTMENT`
--

CREATE TABLE `DEPARTMENT` (
  `DEPTCODE` int(10) NOT NULL,
  `DeptName` varchar(15) DEFAULT NULL,
  `LOCATION` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`DEPTCODE`, `DeptName`, `LOCATION`) VALUES
(10, 'FINANCE', 'EDINBURGH'),
(20, 'SOFTWARE', 'PADDINGTON'),
(30, 'SALES', 'MAIDSTONE'),
(40, 'MARKETING', 'DARLINGTON'),
(50, 'ADMIN', 'BIRMINGHAM');

-- --------------------------------------------------------

--
-- Struktura tabulky `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `EmpCode` int(4) NOT NULL,
  `EmpFName` varchar(15) DEFAULT NULL,
  `EmpLName` varchar(15) DEFAULT NULL,
  `Job` varchar(45) DEFAULT NULL,
  `Manager` char(4) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Salary` decimal(6,2) DEFAULT NULL,
  `Commission` int(6) DEFAULT NULL,
  `DEPTCODE` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EmpCode`, `EmpFName`, `EmpLName`, `Job`, `Manager`, `HireDate`, `Salary`, `Commission`, `DEPTCODE`) VALUES
(9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', '7902', '1980-12-17', 2800.00, 0, 20),
(9499, 'TIM', 'ADOLF', 'SALESMAN', '7698', '1981-02-20', 1600.00, 300, 30),
(9566, 'KIM', 'JARVIS', 'MANAGER', '7839', '1981-04-02', 3570.00, 0, 20),
(9591, 'WENDY', 'SHAWN', 'SALESMAN', '7698', '1981-02-22', 500.00, 0, 30),
(9654, 'SAM', 'MILES', 'SALESMAN', '7698', '1981-09-28', 1250.00, 1400, 30),
(9698, 'BELLA', 'SWAN', 'MANAGER', '7839', '1981-05-01', 3420.00, 0, 30),
(9777, 'MADII', 'HIMBURY', 'ANALYST', '7839', '1981-05-01', 2000.00, 200, NULL),
(9782, 'KEVIN', 'HILL', 'MANAGER', '7839', '1981-06-09', 2940.00, 0, 10),
(9788, 'CONNIE', 'SMITH', 'ANALYST', '7566', '1982-12-09', 3000.00, 0, 20),
(9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', '7566', '1981-11-17', 5000.00, 0, 10),
(9844, 'PAUL', 'TIMOTHY', 'SALESMAN', '7698', '1981-09-08', 1500.00, 0, 30),
(9860, 'ATHENA', 'WILSON', 'ANALYST', '7839', '1992-06-21', 7000.00, 100, 50),
(9861, 'JENNIFER', 'HUETTE', 'ANALYST', '7839', '1996-07-01', 5000.00, 100, 50),
(9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', '7788', '1983-01-12', 3100.00, 0, 20),
(9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', '7698', '1981-12-03', 2950.00, 0, 20),
(9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', '7566', '1981-12-03', 3000.00, 0, 10),
(9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', '7782', '1982-01-23', 3300.00, 0, 20);

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL DEFAULT uuid(),
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`) VALUES
(1, 'adam', '1d7c2923c1684726dc23d2901c4d8157', 'Adam'),
(2, 'admin', '200ceb26807d6bf99fd6f4f0d1ca54d4', 'Administrator'),
(3, 'petr', '595688e8e5fd57712fa7e4ed1765c2ed', 'Petr');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD PRIMARY KEY (`DEPTCODE`),
  ADD UNIQUE KEY `DeptName` (`DeptName`),
  ADD UNIQUE KEY `DeptName_2` (`DeptName`);

--
-- Indexy pro tabulku `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EmpCode`),
  ADD KEY `DEPTCODE` (`DEPTCODE`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`DEPTCODE`) REFERENCES `DEPARTMENT` (`DEPTCODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
