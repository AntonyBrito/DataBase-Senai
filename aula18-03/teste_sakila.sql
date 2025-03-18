CREATE DATABASE IF NOT EXISTS empresa;
#CREATE DATABASE IF NOT EXISTS EMPRESA2;
-- DROP DATABASE IF EXISTS EMPRESA2;

use Empresa;
show tables;
show databases;
# criando tabela Funcionario
CREATE TABLE IF NOT EXISTS Funcionario (
    numero INTEGER NOT NULL,
    nome VARCHAR(100),
    rua VARCHAR(32),
    nro INTEGER,
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado VARCHAR(20),
    cep VARCHAR(9),
    salario FLOAT,
    numeroSupervisor INTEGER,
    PRIMARY KEY (numero),
    FOREIGN KEY (numeroSupervisor)
        REFERENCES Funcionario (numero)
);

create table IF NOT EXISTS Dependente(
	numeroFunc integer not null,
	nome varchar(64) not null,
    dataNasc date,
    parentescpo varchar(16),
    primary key(numeroFunc, nome),
    foreign key(numeroFunc) references Funcionario(numero)
    on delete cascade
    on update cascade
);
alter table Dependente change parentescpo parentesco varchar(16);

create table IF NOT EXISTS Departamento(
	numero integer not null,
    nome varchar(32),
    numeroFuncGer integer,
    dataIniGer date,
    primary key(numero),
    foreign key(numeroFuncGer) references Funcionario(numero)
);
alter table Funcionario add numeroDepto integer;
alter table Funcionario add foreign key(numeroDepto) 
	references Departamento(numero);
    
create table IF NOT EXISTS Projeto(
	numero integer not null,
    nome varchar(32),
    numeroDepto integer,
    primary key(numero),
    foreign key(numeroDepto) references Departamento(numero)
);

create table IF NOT EXISTS LocalDep(
	numeroDepto integer not null,
    localizacao varchar(32),
    primary key(numeroDepto, localizacao),
    foreign key(numeroDepto) references Departamento(numero)
);

create table IF NOT EXISTS FuncionarioProjeto(
	numeroFunc integer,
    numeroProj integer,
    horas time,
    primary key(numeroFunc, numeroProj),
    foreign key(numeroFunc) references Funcionario(numero),
    foreign key(numeroProj) references Projeto(numero)
);

desc Funcionario;
desc Dependente;

#insert into Departameto values (1, 'Financeiro', 1, '2010-08-20')

INSERT INTO Funcionario(numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
	VALUES (1, 'João', 'Rua Bahia', 444, 'Cidade Jardim', 'Valinhos', 'SP', 23900-000, 3200.50, null, null);
    
INSERT INTO Dependente(numeroFunc, nome, dataNasc, parentesco)
	VALUES (1, 'Maria', '2000-08-20', 'Irmã');
    
INSERT INTO Departamento (numero, nome, numeroFuncGer, dataIniGer)
	values (1, 'Bogas Parafuso', 1, '2024-03-13'); 
    
INSERT INTO Projeto(numero, nome, numeroDepto)
	values(1, 'ChatBot', 1); #Falta instanciar essa

INSERT INTO LocalDep (numeroDepto, localizacao)
	VALUES(1, 'Entrada');
    
insert into FuncionarioProjeto(numeroFunc, numeroProj, horas)
	values (1, 1, 10-45-37);
