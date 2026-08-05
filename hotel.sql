-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Ago-2026 às 21:05
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

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
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(4, 'Artur', 'artur.chagas.aguiar@gmail.com', '123.456.789-10'),
(5, 'Gustavo', 'Gustavo.vieira.lima@gmail.com', '321.765.494-98'),
(6, 'Alex', 'Alex.correia.miranda@gmail.com', '214.344.965-56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `quarto`
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
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(6, 'Pepsi Twist 2L', 0, '40.00', 'Bebidas'),
(7, 'Limpeza de quarto', 0, '50.00', 'Limpeza'),
(8, 'Repor toalhas', 0, '75.00', 'Limpeza'),
(9, 'Coca Casulinha 200ml', 0, '50.00', 'Bebidas'),
(10, 'Almoço rodizio', 0, '20.00', 'Restaurante');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `total` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcliente` (`codcliente`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices para tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices para tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT;

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
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Limitadores para a tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
