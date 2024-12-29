-- Criação de Banco de Dados para o Cenário de Oficina
create database oficina;
use oficina;

-- Criar Tabelas

-- Criar Tabela Cliente

CREATE TABLE IF NOT EXISTS Cliente (
  ID_Cliente INT auto_increment,
  Nome VARCHAR(100) NULL,
  Endereco VARCHAR(200) NULL,
  Telefone VARCHAR(15) NULL,
  CPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (ID_Cliente),
  UNIQUE (CPF)
  );
  
  
  -- Criar Tabela Equipe
  
CREATE TABLE IF NOT EXISTS Equipe (
  ID_Equipe INT auto_increment,
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID_Equipe),
  UNIQUE (ID_Equipe)
  );
  
  
  -- Criar Tabela Mecanico
  
CREATE TABLE IF NOT EXISTS Mecanico (
  ID_Mecanico INT auto_increment,
  Nome VARCHAR(100) NOT NULL,
  Endereco VARCHAR(50) NULL,
  Especialidade VARCHAR(45) NULL,
  CPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (ID_Mecanico),
  UNIQUE (CPF)
  );
  

  
  -- Criar Tabela Equipe_Mecanico
  
CREATE TABLE IF NOT EXISTS Equipe_Mecanico (
  ID_Mecanico INT NOT NULL,
  ID_Equipe INT NOT NULL,
  PRIMARY KEY (ID_Mecanico, ID_Equipe),
  FOREIGN KEY (ID_Mecanico) REFERENCES Mecanico(ID_Mecanico),
  FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
  );
  

-- Criar Tabela Veiculo

CREATE TABLE IF NOT EXISTS Veiculo (
  ID_Veiculo INT auto_increment,
  Placa VARCHAR(10) NOT NULL,
  Modelo VARCHAR(50) NULL,
  Ano INT NULL,
  ID_Cliente INT NOT NULL,
  PRIMARY KEY (ID_Veiculo),
  UNIQUE (Placa),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
  );
  
  
-- Criar Tabela OS
  
CREATE TABLE IF NOT EXISTS Ordem_de_Servico (
  ID_OS INT auto_increment,
  Data_Emissao DATE NOT NULL,
  Total DECIMAL(10,2) NOT NULL DEFAULT 0,
  Status VARCHAR(20) NOT NULL DEFAULT 'Em Preparação',
  Data_Entrega DATE NOT NULL,
  ID_Veiculo INT NOT NULL,
  ID_Equipe INT NOT NULL,
  PRIMARY KEY (ID_OS),
  FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo),
  FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
  );
  
  
  -- Criar Tabela Peça
  
CREATE TABLE IF NOT EXISTS Peca (
  ID_Peca INT auto_increment,
  Nome VARCHAR(50) NOT NULL,
  Descricao VARCHAR(400) NULL,
  Valor_Peca DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (ID_Peca)
  );
  
  
  -- Criar Tabela OS de Peças
  
CREATE TABLE IF NOT EXISTS OS_Peca (
  ID_OS INT NOT NULL,
  ID_Peca INT NOT NULL,
  PRIMARY KEY (ID_OS, ID_Peca),
  FOREIGN KEY (ID_OS) REFERENCES Ordem_de_Servico(ID_OS),
  FOREIGN KEY (ID_Peca) REFERENCES Peca(ID_Peca)
  );
  

-- Criar Tabela de Serviço

CREATE TABLE IF NOT EXISTS Servico (
  ID_Servico INT auto_increment,
  Descricao VARCHAR(45) NOT NULL,
  Valor_Mao_de_Obra DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (ID_Servico)
  );
  
  
-- Criar Tabela OS de Serviço
  
CREATE TABLE IF NOT EXISTS OS_Servico (
  ID_OS INT NOT NULL,
  ID_Servico INT NOT NULL,
  PRIMARY KEY (ID_OS, ID_Servico),
  FOREIGN KEY (ID_OS) REFERENCES Ordem_de_Servico(ID_OS),
  FOREIGN KEY (ID_Servico) REFERENCES Servico(ID_Servico)
  );
  
  
-- Inserção de Dados

INSERT INTO Cliente (Nome, Endereco, Telefone, CPF) VALUES 
('João Silva', 'Rua A, 123', '99999-1111', '11111111111'),
('Maria Souza', 'Rua B, 456', '99999-2222', '22222222222'),
('Carlos Oliveira', 'Rua C, 789', '99999-3333', '33333333333'),
('Ana Santos', 'Rua D, 101', '99999-4444', '44444444444'),
('Pedro Costa', 'Rua E, 202', '99999-5555', '55555555555'),
('Mariana Lima', 'Rua F, 303', '99999-6666', '66666666666'),
('Lucas Alves', 'Rua G, 404', '99999-7777', '77777777777'),
('Fernanda Pereira', 'Rua H, 505', '99999-8888', '88888888888'),
('Gabriel Ribeiro', 'Rua I, 606', '99999-9999', '99999999999'),
('Juliana Martins', 'Rua J, 707', '99999-1010', '10101010101'),
('Rafael Gomes', 'Rua K, 808', '99999-1112', '11121112112'),
('Isabela Rocha', 'Rua L, 909', '99999-1222', '12221222122'),
('Mateus Fernandes', 'Rua M, 111', '99999-1333', '13331333133'),
('Bianca Barros', 'Rua N, 222', '99999-1444', '14441444144'),
('Felipe Araujo', 'Rua O, 333', '99999-1555', '15551555155'),
('Larissa Teixeira', 'Rua P, 444', '99999-1666', '16661666166'),
('Rodrigo Carvalho', 'Rua Q, 555', '99999-1777', '17771777177'),
('Amanda Moura', 'Rua R, 666', '99999-1888', '18881888188'),
('Bruno Correia', 'Rua S, 777', '99999-1999', '19991999199'),
('Carolina Ribeiro', 'Rua T, 888', '99999-2020', '20202020202');

Select * From Cliente;

INSERT INTO Equipe (Nome) VALUES 
('Equipe A'),
('Equipe B'),
('Equipe C'),
('Equipe D'),
('Equipe E'),
('Equipe F'),
('Equipe G'),
('Equipe H'),
('Equipe I'),
('Equipe J'),
('Equipe K'),
('Equipe L'),
('Equipe M'),
('Equipe N'),
('Equipe O'),
('Equipe P'),
('Equipe Q'),
('Equipe R'),
('Equipe S'),
('Equipe T');

Select * From Equipe;

INSERT INTO Mecanico (Nome, Endereco, Especialidade, CPF) VALUES 
('Mecânico 1', 'Rua A, 101', 'Freios', '11111111112'),
('Mecânico 2', 'Rua B, 202', 'Suspensão', '22222222223'),
('Mecânico 3', 'Rua C, 303', 'Motor', '33333333334'),
('Mecânico 4', 'Rua D, 404', 'Elétrica', '44444444445'),
('Mecânico 5', 'Rua E, 505', 'Pintura', '55555555556'),
('Mecânico 6', 'Rua F, 606', 'Chassi', '66666666667'),
('Mecânico 7', 'Rua G, 707', 'Freios', '77777777778'),
('Mecânico 8', 'Rua H, 808', 'Suspensão', '88888888889'),
('Mecânico 9', 'Rua I, 909', 'Motor', '99999999910'),
('Mecânico 10', 'Rua J, 111', 'Elétrica', '10101010111'),
('Mecânico 11', 'Rua K, 222', 'Pintura', '11121112113'),
('Mecânico 12', 'Rua L, 333', 'Chassi', '12221222124'),
('Mecânico 13', 'Rua M, 444', 'Freios', '13331333135'),
('Mecânico 14', 'Rua N, 555', 'Suspensão', '14441444146'),
('Mecânico 15', 'Rua O, 666', 'Motor', '15551555157'),
('Mecânico 16', 'Rua P, 777', 'Elétrica', '16661666168'),
('Mecânico 17', 'Rua Q, 888', 'Pintura', '17771777179'),
('Mecânico 18', 'Rua R, 999', 'Chassi', '18881888190'),
('Mecânico 19', 'Rua S, 101', 'Freios', '19991999111'),
('Mecânico 20', 'Rua T, 202', 'Suspensão', '20202020212');

Select * From Mecanico;

INSERT INTO Veiculo (Placa, Modelo, Ano, ID_Cliente) VALUES 
('AAA-1111', 'Modelo 1', 2010, 1),
('BBB-2222', 'Modelo 2', 2011, 2),
('CCC-3333', 'Modelo 3', 2012, 3),
('DDD-4444', 'Modelo 4', 2013, 4),
('EEE-5555', 'Modelo 5', 2014, 5),
('FFF-6666', 'Modelo 6', 2015, 6),
('GGG-7777', 'Modelo 7', 2016, 7),
('HHH-8888', 'Modelo 8', 2017, 8),
('III-9999', 'Modelo 9', 2018, 9),
('JJJ-1010', 'Modelo 10', 2019, 10),
('KKK-1111', 'Modelo 11', 2020, 11),
('LLL-2222', 'Modelo 12', 2021, 12),
('MMM-3333', 'Modelo 13', 2022, 13),
('NNN-4444', 'Modelo 14', 2023, 14),
('OOO-5555', 'Modelo 15', 2024, 15),
('PPP-6666', 'Modelo 16', 2025, 16),
('QQQ-7777', 'Modelo 17', 2026, 17),
('RRR-8888', 'Modelo 18', 2027, 18),
('SSS-9999', 'Modelo 19', 2028, 19),
('TTT-1010', 'Modelo 20', 2029, 20);

Select * from Veiculo;

INSERT INTO Ordem_de_Servico (Data_Emissao, Total, Status, Data_Entrega, ID_Veiculo, ID_Equipe) VALUES 
('2023-01-01', 150.00, 'Em Preparação', '2023-01-10', 1, 1),
('2023-02-01', 200.00, 'Finalizado', '2023-02-10', 2, 2),
('2023-03-01', 250.00, 'Em Andamento', '2023-03-10', 3, 3),
('2023-04-01', 300.00, 'Aguardando Peça', '2023-04-10', 4, 4),
('2023-05-01', 350.00, 'Em Preparação', '2023-05-10', 5, 5),
('2023-06-01', 400.00, 'Finalizado', '2023-06-10', 6, 6),
('2023-07-01', 450.00, 'Em Andamento', '2023-07-10', 7, 7),
('2023-08-01', 500.00, 'Aguardando Peça', '2023-08-10', 8, 8),
('2023-09-01', 550.00, 'Em Preparação', '2023-09-10', 9, 9),
('2023-10-01', 600.00, 'Finalizado', '2023-10-10', 10, 10),
('2023-11-01', 650.00, 'Em Andamento', '2023-11-10', 11, 11),
('2023-12-01', 700.00, 'Aguardando Peça', '2023-12-10', 12, 12),
('2024-01-01', 750.00, 'Em Preparação', '2024-01-10', 13, 13),
('2024-02-01', 800.00, 'Finalizado', '2024-02-10', 14, 14),
('2024-03-01', 850.00, 'Em Andamento', '2024-03-10', 15, 15),
('2024-04-01', 900.00, 'Aguardando Peça', '2024-04-10', 16, 16),
('2024-05-01', 950.00, 'Em Preparação', '2024-05-10', 17, 17),
('2024-06-01', 1000.00, 'Finalizado', '2024-06-10', 18, 18),
('2024-07-01', 1050.00, 'Em Andamento', '2024-07-10', 19, 19),
('2024-08-01', 1100.00, 'Aguardando Peça', '2024-08-10', 20, 20);

Select * From Ordem_de_Servico;

INSERT INTO Equipe_Mecanico (ID_Mecanico, ID_Equipe) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO Equipe_Mecanico (ID_Mecanico, ID_Equipe) VALUES 
(1, 7),
(2, 8),
(3, 8),
(4, 8),
(5, 8);


Select * From Equipe_Mecanico;

INSERT INTO Peca (Nome, Descricao, Valor_Peca) VALUES 
('Filtro de Ar Turbo', 'Filtro de ar de alta performance para motores turbo', 50.00),
('Bateria SuperPower', 'Bateria de longa duração para veículos de alta performance', 60.00),
('Velas de Ignição Platinum', 'Velas de ignição com revestimento de platina para melhor performance', 70.00),
('Amortecedor ShockMaster', 'Amortecedor com tecnologia de absorção de impacto avançada', 80.00),
('Pneus AllTerrain', 'Pneus para todos os tipos de terrenos com alta durabilidade', 90.00),
('Freios PowerStop', 'Sistema de freios de alta eficiência e durabilidade', 100.00),
('Radiador CoolMax', 'Radiador com alta capacidade de refrigeração', 110.00),
('Correia Dentada ProDrive', 'Correia dentada de longa vida útil e alta resistência', 120.00),
('Kit de Embreagem ClutchPro', 'Kit de embreagem com alta performance e durabilidade', 130.00),
('Filtro de Óleo PureFlow', 'Filtro de óleo com alta capacidade de filtração', 140.00),
('Bomba de Combustível FuelMax', 'Bomba de combustível de alta eficiência', 150.00),
('Escapamento SilentDrive', 'Sistema de escapamento com redução de ruído', 160.00),
('Pastilhas de Freio BrakeForce', 'Pastilhas de freio com alta capacidade de frenagem', 170.00),
('Alternador PowerGen', 'Alternador com alta capacidade de geração de energia', 180.00),
('Injeção Eletrônica EFI', 'Sistema de injeção eletrônica com alta eficiência', 190.00),
('Filtro de Combustível PureFuel', 'Filtro de combustível com alta capacidade de filtração', 200.00),
('Bomba de Água AquaFlow', 'Bomba de água com alta capacidade de circulação', 210.00),
('Retrovisor AutoAdjust', 'Retrovisor com ajuste automático e antiofuscamento', 220.00),
('Farol LED BrightLight', 'Farol LED com alta capacidade de iluminação', 230.00),
('Câmera de Ré RearView', 'Câmera de ré com visão noturna', 240.00);

Select * from Peca;

INSERT INTO OS_Peca (ID_OS, ID_Peca) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

Select * from OS_Peca;

INSERT INTO Servico (Descricao, Valor_Mao_de_Obra) VALUES 
('Troca de Óleo e Filtro', 150.00),
('Alinhamento e Balanceamento', 200.00),
('Revisão Completa', 250.00),
('Substituição de Freios', 300.00),
('Troca de Correia Dentada', 350.00),
('Troca de Velas de Ignição', 400.00),
('Reparo no Sistema de Arrefecimento', 450.00),
('Diagnóstico Eletrônico', 500.00),
('Troca de Amortecedores', 550.00),
('Reparo na Suspensão', 600.00),
('Substituição de Bateria', 650.00),
('Troca de Pastilhas de Freio', 700.00),
('Reparo no Sistema de Escapamento', 750.00),
('Troca de Filtros de Ar', 800.00),
('Revisão do Sistema de Injeção Eletrônica', 850.00),
('Reparo no Sistema de Direção', 900.00),
('Revisão do Sistema Elétrico', 950.00),
('Reparo no Sistema de Transmissão', 1000.00),
('Serviço de Funilaria e Pintura', 1050.00),
('Troca de Pneus', 1100.00);

Select * From Servico;

INSERT INTO OS_Servico (ID_OS, ID_Servico) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

Select * From OS_Servico;


-- Pesquisas

-- Recuperar todos os clientes
SELECT * FROM Cliente;

-- Recuperar todas as ordens de serviço
SELECT * FROM Ordem_de_Servico;


-- Filtros com Where

-- Recuperar veículos de um cliente específico
SELECT * FROM Veiculo WHERE ID_Cliente = 1;

-- Recuperar mecânicos com uma especialidade específica
SELECT * FROM Mecanico WHERE Especialidade = 'Motor';

-- Recuperar ordens de serviço com status 'Aguardando Peça'
SELECT * FROM Ordem_de_Servico WHERE Status = 'Aguardando Peça';


-- Expressões para gerar atributos derivados

-- Calcular o total da ordem de serviço incluindo peças e mão de obra
SELECT os.ID_OS, 
       os.Total + IFNULL(SUM(p.Valor_Peca), 0) AS Total_Com_Pecas, 
       IFNULL(SUM(s.Valor_Mao_de_Obra), 0) AS Total_Mao_de_Obra
FROM Ordem_de_Servico os
LEFT JOIN OS_Peca osp ON os.ID_OS = osp.ID_OS
LEFT JOIN Peca p ON osp.ID_Peca = p.ID_Peca
LEFT JOIN OS_Servico oss ON os.ID_OS = oss.ID_OS
LEFT JOIN Servico s ON oss.ID_Servico = s.ID_Servico
GROUP BY os.ID_OS;


-- Ordenações dos dados com ORDER BY

-- Ordenar clientes por nome
SELECT * FROM Cliente ORDER BY Nome;

-- Ordenar ordens de serviço por data de emissão, em ordem decrescente
SELECT * FROM Ordem_de_Servico ORDER BY Data_Emissao DESC;


-- Filtros aos grupos – HAVING Statement

-- Recuperar equipes com mais de 2 mecânicos
SELECT e.Nome, COUNT(em.ID_Mecanico) AS Numero_De_Mecanicos
FROM Equipe e
JOIN Equipe_Mecanico em ON e.ID_Equipe = em.ID_Equipe
GROUP BY e.Nome
HAVING COUNT(em.ID_Mecanico) > 2;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

-- Recuperar informações detalhadas das ordens de serviço
SELECT os.ID_OS, os.Data_Emissao, os.Total, os.Status, 
       v.Modelo AS Veiculo_Modelo, c.Nome AS Cliente_Nome, e.Nome AS Equipe_Nome
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.ID_Veiculo = v.ID_Veiculo
JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
JOIN Equipe e ON os.ID_Equipe = e.ID_Equipe;

-- Recuperar todas as peças usadas em uma ordem de serviço específica
SELECT os.ID_OS, p.Nome AS Peca_Nome, p.Valor_Peca
FROM Ordem_de_Servico os
JOIN OS_Peca osp ON os.ID_OS = osp.ID_OS
JOIN Peca p ON osp.ID_Peca = p.ID_Peca
WHERE os.ID_OS = 1;

-- Recuperar todos os serviços realizados em uma ordem de serviço específica
SELECT os.ID_OS, s.Descricao AS Servico_Descricao, s.Valor_Mao_de_Obra
FROM Ordem_de_Servico os
JOIN OS_Servico oss ON os.ID_OS = oss.ID_OS
JOIN Servico s ON oss.ID_Servico = s.ID_Servico
WHERE os.ID_OS = 1;