-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Jul-2022 às 16:59
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `iquadras`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nome_cidade` varchar(20) NOT NULL,
  `sigla_uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadra`
--

CREATE TABLE `quadra` (
  `id_quadra` int(11) NOT NULL,
  `valorhora_quadra` decimal(10,0) NOT NULL,
  `coberto_quadra` enum('Sim','Não') NOT NULL,
  `acessibilidade_quadra` enum('Sim','Não') NOT NULL,
  `cnpj_locador` varchar(20) NOT NULL,
  `id_end` int(11) NOT NULL,
  `id_esporte` int(11) NOT NULL,
  `id_material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadra_end`
--

CREATE TABLE `quadra_end` (
  `id_end` int(11) NOT NULL,
  `rua_end` varchar(50) NOT NULL,
  `num_end` int(11) NOT NULL,
  `compl_end` varchar(20) DEFAULT NULL,
  `id_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadra_esporte`
--

CREATE TABLE `quadra_esporte` (
  `id_esporte` int(11) NOT NULL,
  `nome_esporte` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadra_material`
--

CREATE TABLE `quadra_material` (
  `id_material` int(11) NOT NULL,
  `nome_material` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadra_reserva`
--

CREATE TABLE `quadra_reserva` (
  `id_reserva` int(11) NOT NULL,
  `data_reserva` datetime NOT NULL,
  `hora_reserva` time NOT NULL,
  `valor_reserva` decimal(10,0) NOT NULL,
  `cpf_locatario` varchar(20) NOT NULL,
  `id_quadra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE `uf` (
  `sigla_uf` varchar(2) NOT NULL,
  `nome_uf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_locador`
--

CREATE TABLE `usuario_locador` (
  `cnpj_locador` varchar(20) NOT NULL,
  `nome_locador` varchar(50) NOT NULL,
  `email_locador` varchar(50) NOT NULL,
  `senha_locador` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_locatario`
--

CREATE TABLE `usuario_locatario` (
  `cpf_locatario` varchar(20) NOT NULL,
  `nome_locatario` varchar(50) NOT NULL,
  `fone_locatario` varchar(20) NOT NULL,
  `email_locatario` varchar(50) NOT NULL,
  `senha_locatario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`),
  ADD KEY `sigla_uf` (`sigla_uf`);

--
-- Índices para tabela `quadra`
--
ALTER TABLE `quadra`
  ADD PRIMARY KEY (`id_quadra`),
  ADD KEY `cnpj_locador` (`cnpj_locador`),
  ADD KEY `id_end` (`id_end`),
  ADD KEY `id_esporte` (`id_esporte`),
  ADD KEY `id_material` (`id_material`);

--
-- Índices para tabela `quadra_end`
--
ALTER TABLE `quadra_end`
  ADD PRIMARY KEY (`id_end`),
  ADD KEY `id_cidade` (`id_cidade`);

--
-- Índices para tabela `quadra_esporte`
--
ALTER TABLE `quadra_esporte`
  ADD PRIMARY KEY (`id_esporte`);

--
-- Índices para tabela `quadra_material`
--
ALTER TABLE `quadra_material`
  ADD PRIMARY KEY (`id_material`);

--
-- Índices para tabela `quadra_reserva`
--
ALTER TABLE `quadra_reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD UNIQUE KEY `hora_reserva` (`hora_reserva`),
  ADD KEY `cpf_locatario` (`cpf_locatario`),
  ADD KEY `id_quadra` (`id_quadra`);

--
-- Índices para tabela `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`sigla_uf`),
  ADD UNIQUE KEY `nome_uf` (`nome_uf`);

--
-- Índices para tabela `usuario_locador`
--
ALTER TABLE `usuario_locador`
  ADD PRIMARY KEY (`cnpj_locador`),
  ADD UNIQUE KEY `email_locador` (`email_locador`);

--
-- Índices para tabela `usuario_locatario`
--
ALTER TABLE `usuario_locatario`
  ADD PRIMARY KEY (`cpf_locatario`),
  ADD UNIQUE KEY `email_locatario` (`email_locatario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra`
--
ALTER TABLE `quadra`
  MODIFY `id_quadra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra_end`
--
ALTER TABLE `quadra_end`
  MODIFY `id_end` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra_esporte`
--
ALTER TABLE `quadra_esporte`
  MODIFY `id_esporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra_material`
--
ALTER TABLE `quadra_material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quadra_reserva`
--
ALTER TABLE `quadra_reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `sigla_uf` FOREIGN KEY (`sigla_uf`) REFERENCES `uf` (`sigla_uf`);

--
-- Limitadores para a tabela `quadra`
--
ALTER TABLE `quadra`
  ADD CONSTRAINT `cnpj_locador` FOREIGN KEY (`cnpj_locador`) REFERENCES `usuario_locador` (`cnpj_locador`),
  ADD CONSTRAINT `id_end` FOREIGN KEY (`id_end`) REFERENCES `quadra_end` (`id_end`),
  ADD CONSTRAINT `id_esporte` FOREIGN KEY (`id_esporte`) REFERENCES `quadra_esporte` (`id_esporte`),
  ADD CONSTRAINT `id_material` FOREIGN KEY (`id_material`) REFERENCES `quadra_material` (`id_material`);

--
-- Limitadores para a tabela `quadra_end`
--
ALTER TABLE `quadra_end`
  ADD CONSTRAINT `id_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`);

--
-- Limitadores para a tabela `quadra_reserva`
--
ALTER TABLE `quadra_reserva`
  ADD CONSTRAINT `cpf_locatario` FOREIGN KEY (`cpf_locatario`) REFERENCES `usuario_locatario` (`cpf_locatario`),
  ADD CONSTRAINT `id_quadra` FOREIGN KEY (`id_quadra`) REFERENCES `quadra` (`id_quadra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
