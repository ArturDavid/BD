-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/08/2026 às 22:53
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(4, 'Artur', 'artur.chagas.aguiar@gmail.com', '123.456.789-10'),
(5, 'Gustavo', 'Gustavo.vieira.lima@gmail.com', '321.765.494-98'),
(6, 'Alex', 'Alex.correia.miranda@gmail.com', '214.344.965-56'),
(7, 'Goku', 'Goku@gmail.com', '437.980.112-97'),
(8, 'Vegeta', 'Vegeta@gmail.com', '234.734.970-65'),
(9, 'Gogeta', 'Gogeta@gmail.com', '143.597.465-44'),
(20, 'Vegeto', 'Vegeto@gmail.com', '143.397.465-44'),
(22, 'Davy', 'Davy.araujo.dopamina@gmail.com', '237.980.112-97');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date NOT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) NOT NULL,
  `codcliente` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcliente`, `codquarto`) VALUES
(0, '2026-08-01', '0000-00-00', '04:00:00', '00:00:00', 0.00, 22, 47),
(1, '2025-08-19', '0000-00-00', '04:54:42', NULL, 0.00, 4, 43),
(2, '0000-00-00', '0000-00-00', '00:00:00', NULL, 0.00, 5, 45),
(3, '2026-08-01', '0000-00-00', '02:11:31', NULL, 0.00, 7, 43),
(4, '2026-08-08', '0000-00-00', '20:11:31', NULL, 0.00, 8, 48),
(5, '2026-08-16', '0000-00-00', '03:20:38', NULL, 0.00, 9, 48),
(6, '2026-08-18', '0000-00-00', '11:13:38', NULL, 0.00, 20, 47),
(7, '2026-08-11', '0000-00-00', '22:00:00', '00:00:00', 0.00, 8, 43),
(8, '2026-08-03', '0000-00-00', '23:16:33', NULL, 0.00, 9, 48),
(9, '2026-08-30', '0000-00-00', '06:17:47', NULL, 0.00, 20, 46);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(43, '1', '1', 'Familia - 2 camas'),
(44, '2', '1', 'Casal - 1 cama de casal'),
(45, '3', '1', 'Solteiro - 1 cama de solteiro'),
(46, '4', '2', 'Familia - 5 camas'),
(47, '5', '2', 'Solteiro plus - Cama de solteiro extragrande'),
(48, '6', '2', 'Cobertura - espaço amplo para até 10 pessoas'),
(49, '7', '3', 'Cobertura Premium - espaço ainda maior para até 20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(6, 'Pepsi Twist 2L', 0, 40.00, 'Bebidas'),
(7, 'Limpeza de quarto', 0, 50.00, 'Limpeza'),
(8, 'Repor toalhas', 0, 75.00, 'Limpeza'),
(9, 'Coca Casulinha 200ml', 0, 50.00, 'Bebidas'),
(10, 'Almoço rodizio', 0, 20.00, 'Restaurante');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `total` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`, `total`) VALUES
(1, 10, '2026-08-13', '13:01:16', 0.00),
(1, 6, '2026-08-11', '19:01:16', 0.00),
(1, 7, '2026-07-09', '08:09:26', 0.00),
(2, 8, '2026-05-13', '17:25:10', 0.00),
(2, 9, '2026-08-17', '08:56:30', 0.00),
(3, 10, '2026-04-13', '13:30:16', 0.00),
(3, 6, '2026-08-07', '19:50:16', 0.00),
(4, 6, '2026-08-13', '20:38:06', 0.00),
(4, 9, '2026-08-17', '08:16:30', 0.00),
(5, 10, '2026-10-15', '12:00:00', 0.00),
(5, 10, '2026-10-15', '15:00:00', 0.00),
(6, 8, '2026-09-09', '13:45:16', 0.00),
(6, 6, '2026-08-12', '08:20:30', 0.00),
(7, 8, '2026-03-09', '18:32:10', 0.00),
(NULL, 7, '2026-05-10', '14:00:00', 0.00),
(7, 9, '2026-12-12', '08:43:26', 0.00),
(8, 7, '2026-07-11', '16:30:16', 0.00),
(8, 6, '2026-05-20', '09:20:30', 0.00),
(9, 6, '2026-07-23', '08:29:26', 0.00),
(9, 10, '2026-07-23', '15:23:00', 0.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcliente` (`codcliente`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
