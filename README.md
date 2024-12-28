# Bootcamp-Suzano-Projeto-de-Oficina
Bem-vindo ao repositório do Projeto de Oficina, desenvolvido como parte do Bootcamp de Análise de Dados com Power BI oferecido pela Suzano e Dio. Este projeto tem como objetivo modelar um cenário de oficina utilizando um Diagrama de Entidade-Relacionamento (DER) e implementá-lo no MySQL Workbench.

# Oficina Database Project

## Descrição do Projeto

Este projeto consiste na criação de um banco de dados relacional para gerenciar as operações de uma oficina mecânica. O banco de dados foi modelado utilizando o modelo relacional e implementado em SQL. O objetivo é armazenar e manipular informações sobre clientes, veículos, ordens de serviço, peças, serviços, mecânicos e equipes.

# Projeto de Banco de Dados para Oficina

## Descrição do Projeto

Este projeto consiste na criação de um banco de dados relacional para gerenciar as operações de uma oficina mecânica. O banco de dados foi modelado utilizando o modelo relacional e implementado em SQL. O objetivo é armazenar e manipular informações sobre clientes, veículos, ordens de serviço, peças, serviços, mecânicos e equipes.

## Esquema Lógico

O esquema lógico foi baseado no esquema conceitual criado durante o desafio do módulo de modelagem de banco de dados com o modelo ER. As tabelas criadas no banco de dados são:

- **Cliente**: Armazena informações dos clientes, como nome, endereço, telefone e CPF.
- **Equipe**: Armazena informações das equipes, incluindo o nome.
- **Mecanico**: Armazena informações dos mecânicos, como nome, endereço, especialidade e CPF.
- **Equipe_Mecanico**: Relaciona mecânicos com suas respectivas equipes.
- **Veiculo**: Armazena informações dos veículos, como placa, modelo, ano e o cliente proprietário.
- **Ordem_de_Servico**: Armazena informações das ordens de serviço, incluindo datas de emissão e entrega, total, status, veículo e equipe.
- **Peca**: Armazena informações das peças, como nome, descrição e valor.
- **OS_Peca**: Relaciona peças às ordens de serviço.
- **Servico**: Armazena informações dos serviços, como descrição e valor da mão-de-obra.
- **OS_Servico**: Relaciona serviços às ordens de serviço.

## Estrutura das Tabelas

### Tabela `Cliente`

Armazena informações dos clientes da oficina.

- `ID_Cliente` (INT): Identificador único do cliente.
- `Nome` (VARCHAR): Nome do cliente.
- `Endereco` (VARCHAR): Endereço do cliente.
- `Telefone` (VARCHAR): Telefone do cliente.
- `CPF` (VARCHAR): CPF do cliente (único).

### Tabela `Equipe`

Armazena informações das equipes na oficina.

- `ID_Equipe` (INT): Identificador único da equipe.
- `Nome` (VARCHAR): Nome da equipe.

### Tabela `Mecanico`

Armazena informações dos mecânicos da oficina.

- `ID_Mecanico` (INT): Identificador único do mecânico.
- `Nome` (VARCHAR): Nome do mecânico.
- `Endereco` (VARCHAR): Endereço do mecânico.
- `Especialidade` (VARCHAR): Especialidade do mecânico.
- `CPF` (VARCHAR): CPF do mecânico (único).

### Tabela `Equipe_Mecanico`

Relaciona mecânicos com suas respectivas equipes.

- `ID_Mecanico` (INT): Identificador único do mecânico.
- `ID_Equipe` (INT): Identificador único da equipe.

### Tabela `Veiculo`

Armazena informações dos veículos dos clientes.

- `ID_Veiculo` (INT): Identificador único do veículo.
- `Placa` (VARCHAR): Placa do veículo (única).
- `Modelo` (VARCHAR): Modelo do veículo.
- `Ano` (INT): Ano de fabricação do veículo.
- `ID_Cliente` (INT): Identificador único do cliente proprietário.

### Tabela `Ordem_de_Servico`

Armazena informações das ordens de serviço realizadas na oficina.

- `ID_OS` (INT): Identificador único da ordem de serviço.
- `Data_Emissao` (DATE): Data de emissão da ordem de serviço.
- `Total` (DECIMAL): Total da ordem de serviço.
- `Status` (VARCHAR): Status da ordem de serviço (ex: 'Em Preparação', 'Finalizado').
- `Data_Entrega` (DATE): Data prevista para entrega do serviço.
- `ID_Veiculo` (INT): Identificador único do veículo.
- `ID_Equipe` (INT): Identificador único da equipe responsável.

### Tabela `Peca`

Armazena informações das peças utilizadas nas ordens de serviço.

- `ID_Peca` (INT): Identificador único da peça.
- `Nome` (VARCHAR): Nome da peça.
- `Descricao` (VARCHAR): Descrição da peça.
- `Valor_Peca` (DECIMAL): Valor da peça.

### Tabela `OS_Peca`

Relaciona peças às ordens de serviço.

- `ID_OS` (INT): Identificador único da ordem de serviço.
- `ID_Peca` (INT): Identificador único da peça.

### Tabela `Servico`

Armazena informações dos serviços prestados pela oficina.

- `ID_Servico` (INT): Identificador único do serviço.
- `Descricao` (VARCHAR): Descrição do serviço.
- `Valor_Mao_de_Obra` (DECIMAL): Valor da mão-de-obra do serviço.

### Tabela `OS_Servico`

Relaciona serviços às ordens de serviço.

- `ID_OS` (INT): Identificador único da ordem de serviço.
- `ID_Servico` (INT): Identificador único do serviço.



## Consultas SQL Complexas

```sql

### Pesquisas

### Recuperar todos os clientes
SELECT * FROM Cliente;

### Recuperar todas as ordens de serviço
SELECT * FROM Ordem_de_Servico;


### Filtros com Where

### Recuperar veículos de um cliente específico
SELECT * FROM Veiculo WHERE ID_Cliente = 1;

### Recuperar mecânicos com uma especialidade específica
SELECT * FROM Mecanico WHERE Especialidade = 'Motor';

### Recuperar ordens de serviço com status 'Aguardando Peça'
SELECT * FROM Ordem_de_Servico WHERE Status = 'Aguardando Peça';


### Expressões para gerar atributos derivados

### Calcular o total da ordem de serviço incluindo peças e mão de obra
SELECT os.ID_OS, 
       os.Total + IFNULL(SUM(p.Valor_Peca), 0) AS Total_Com_Pecas, 
       IFNULL(SUM(s.Valor_Mao_de_Obra), 0) AS Total_Mao_de_Obra
FROM Ordem_de_Servico os
LEFT JOIN OS_Peca osp ON os.ID_OS = osp.ID_OS
LEFT JOIN Peca p ON osp.ID_Peca = p.ID_Peca
LEFT JOIN OS_Servico oss ON os.ID_OS = oss.ID_OS
LEFT JOIN Servico s ON oss.ID_Servico = s.ID_Servico
GROUP BY os.ID_OS;


### Ordenações dos dados com ORDER BY

### Ordenar clientes por nome
SELECT * FROM Cliente ORDER BY Nome;

### Ordenar ordens de serviço por data de emissão, em ordem decrescente
SELECT * FROM Ordem_de_Servico ORDER BY Data_Emissao DESC;


### Filtros aos grupos – HAVING Statement

### Recuperar equipes com mais de 2 mecânicos
SELECT e.Nome, COUNT(em.ID_Mecanico) AS Numero_De_Mecanicos
FROM Equipe e
JOIN Equipe_Mecanico em ON e.ID_Equipe = em.ID_Equipe
GROUP BY e.Nome
HAVING COUNT(em.ID_Mecanico) > 2;


### Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

### Recuperar informações detalhadas das ordens de serviço
SELECT os.ID_OS, os.Data_Emissao, os.Total, os.Status, 
       v.Modelo AS Veiculo_Modelo, c.Nome AS Cliente_Nome, e.Nome AS Equipe_Nome
FROM Ordem_de_Servico os
JOIN Veiculo v ON os.ID_Veiculo = v.ID_Veiculo
JOIN Cliente c ON v.ID_Cliente = c.ID_Cliente
JOIN Equipe e ON os.ID_Equipe = e.ID_Equipe;

### Recuperar todas as peças usadas em uma ordem de serviço específica
SELECT os.ID_OS, p.Nome AS Peca_Nome, p.Valor_Peca
FROM Ordem_de_Servico os
JOIN OS_Peca osp ON os.ID_OS = osp.ID_OS
JOIN Peca p ON osp.ID_Peca = p.ID_Peca
WHERE os.ID_OS = 1;

### Recuperar todos os serviços realizados em uma ordem de serviço específica
SELECT os.ID_OS, s.Descricao AS Servico_Descricao, s.Valor_Mao_de_Obra
FROM Ordem_de_Servico os
JOIN OS_Servico oss ON os.ID_OS = oss.ID_OS
JOIN Servico s ON oss.ID_Servico = s.ID_Servico
WHERE os.ID_OS = 1;
