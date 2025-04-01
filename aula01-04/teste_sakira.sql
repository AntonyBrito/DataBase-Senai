create database if not exists Empresa;

use  empresa;

-- drop database empresa;

# criando tabela funcionario
create table if not exists Funcionario( 
	numero integer not null,
    nome varchar(100),
    rua varchar(32),
    nro integer,
    bairro varchar(20), 
    cidade varchar(20),
    estado varchar(20),
    cep varchar(9),
    salario float,
    numeroSupervisor integer, 
    numeroDepto integer,
    primary key(numero),
    foreign key(numeroSupervisor) references Funcionario(numero)
);
-- drop database empresa;
-- insert into Funcionario(numero,nome,rua,nro,bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto) 
-- values (1, 'Gustavo', 'Karl Herman', 180, 'Jd Munique', 'São Carlos', 'São Paulo', '13568-535', 50.000, null, null );

insert into Funcionario(numero, nome, rua, nro, bairro, cidade, estado, cep,salario, numeroSupervisor, numerodepto)
values (1,'João', 'Rua Bahia', 483, 'Cidade Jardim', 'Valinhos', 'SP', 23900-000, 3200.30, null, null);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (2, 'Jose', 'Rua Marechal', 27, 'Paulistano', 'Salto', 'SP', '54621-000', 1820.77, 1, 1);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (3, 'Luciano', 'Rua Teodoro', 83, 'Centro', 'Araras', 'SP', '52412-000', 1700, 2, 4);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (4, 'Danilo', 'Rua Vergueiro', 1022, 'Paraiso', 'Sao Paulo', 'SP', '13140-000', 2200.00, 1, 5);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (5, 'Patricia', 'Rua Lima', 63, 'Itaim', 'Sao Paulo', 'SP', '45123-000', 2300.00, 1, 3);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (6, 'Mariana', 'Rua Sansao', 34, 'Jacare', 'Sao Carlos', 'SP', '55981-000', 1200, 1, 5);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (7, 'Cristiano', 'Rua X', 10, 'Centro', 'Araraquara', 'SP', '14524-000', 3500.00, 2, 5);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (8, 'Fabiano', 'Rua III', 15, 'Centro', 'Sao Carlos', 'SP', '12345-000', 1950.00, 2, 1);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (9, 'Bastiao', 'Rua Sete', 19, 'Centro', 'Araraquara', 'SP', '98745-000', 6500.00, 2, 6);

insert into Funcionario (numero, nome, rua, nro, bairro, cidade, estado, cep, salario, numeroSupervisor, numeroDepto)
values (10, 'Ricardo', 'Rua 13 de Maio', 55, 'Joquei', 'Sao Paulo', 'SP', '33641-000', 2800.00, 1, 2);




create table if not exists Dependente(
	numeroFuncionario integer,
    nome varchar(15) not null,
    dataNasc date,
    parentesc varchar(10),
    primary key (nome),
    foreign key(numeroFuncionario) references Funcionario(numero)
    on delete cascade
    on update cascade
);
alter table Dependente change numeroFuncionario numeroFunc integer;
alter table Dependente change parentesc parentesco varchar(10);
-- insert into Dependente (numeroFunc, nome, dataNasc, parentes) 
-- values (null, 'Jack', '2004-08-12', 'primos', 'Jd Munique', 'São Carlos', 'São Paulo', '13568-535', 50.000, null, null );

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (5, 'Luizinho', '2010-04-02', 'Filho');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (5, 'Mariazinha', '2012-06-06', 'Filha');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (1, 'Julia', '2013-04-02', 'Filha');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (1, 'Ana', '2006-04-03', 'Filha');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (1, 'Maria', '1976-05-03', 'Esposa');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (3, 'Lucas', '1998-11-28', 'Filho');

insert into Dependente (numeroFunc, nome, dataNasc, parentesco)
values (2, 'Joana', '1935-11-28', 'Mae');


create table if not exists Departamento(
	numero integer not null,
    nome varchar(32),
    numeroFuncGer integer,
    dataIniGer date,
    primary key(numero),
    foreign key (numeroFuncGer) references Funcionario(numero)
);
-- -----------------------------------------------

#Adiciona atributos faltantes
alter table Funcionario add numeroDepto integer;
alter table Funcionario add foreign key(numeroDepto) references Departamento(numero);

-- insert into Departamento(numero, nome, numeroFuncGer ,dataIniGer) 
-- values (5, 'Galpão Logístico', null , '2018-08-22');

insert into Departamento (numero, nome, numeroFuncGer, dataIniGer)
    values (1, 'Financeiro', 1, '2010-08-20');
   
insert into Departamento (numeroFuncGer, numero, nome, dataIniGer)
    values (2, 3, 'Auditoria', '2010-08-20');
   
insert into Departamento (numero, nome, numeroFuncGer, dataIniGer)
    values (4, 'Compras', null, null);
   
insert into Departamento (numero, nome)
    values (5, 'Vendas');
   
insert into Departamento (numero, nome)
    values (6, 'Juridico');



-- ------------------------------------------------
create table if not exists LocalDep(
	numeroDepto integer,
    localizacao varchar(20),
    primary key (localizacao),
    foreign key (numeroDepto) references Departamento (numero)

);
insert into LocalDep(numeroDepto, localizacao) values (1, 'Edificio Marte');

insert into localDep(numeroDepto, localizacao)
values (1, 'Edificio Marte');

insert into localDep(numeroDepto, localizacao)
values (1, 'Edificio Planeta Vermelho');

insert into localDep(numeroDepto, localizacao)
values (2, 'Edificio Saturno');

insert into localDep(numeroDepto, localizacao)
values (3, 'Edificio Plutao');

insert into localDep(numeroDepto, localizacao)
values (3, 'Edificio Ex-Planeta');

insert into localDep(numeroDepto, localizacao)
values (4, 'Edificio Jupiter');

insert into localDep(numeroDepto, localizacao)
values (5, 'Edificio Lua');


create table if not exists Projeto(
	numero integer not null,
    nome varchar(32),
    numeroDepto integer,
    primary key(numero)
	
);
alter table Projeto add foreign key(numeroDepto) references Departamento(numero);

insert into Projeto (numero, nome, numeroDepto)
values (1, 'Projeto Serra Leste', 1);

insert into Projeto (numero, nome, numeroDepto)
values (2, 'Projeto Porto Tubarao', 5);

insert into Projeto (numero, nome, numeroDepto)
values (3, 'Projeto sei la', 3);

insert into Projeto (numero, nome, numeroDepto)
values (4, 'Projeto Niquel', 1);

insert into Projeto (numero, nome, numeroDepto)
values (5, 'Projeto COVID', 3);

insert into Projeto (numero, nome, numeroDepto)
values (6, 'Projeto Lava Jato', 5);

insert into Projeto (numero, nome, numeroDepto)
values (7, 'Projeto Serra Pelada', 1);

insert into Projeto (numero, nome, numeroDepto)
values (8, 'Projeto Vale', 3);


create table if not exists FuncionarioProjeto(
	numeroFunc integer,
    numeroProj integer,
    horas time,
    foreign key (numeroProj) references Projeto(numero),
    foreign key(numeroFunc) references Funcionario(numero)
);
alter table FuncionarioProjeto add primary key (numeroFunc, numeroProj);
alter table Dependente change parentesc parentes varchar(10);

insert into FuncionarioProjeto(numeroFunc, numeroProj, horas)
values(10, 1, '10:45:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (1, 1, '10:45:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (1, 2, '09:25:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (1, 3, '10:15:10');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (2, 4, '20:45:15');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (2, 5, '19:45:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (2, 6, '16:13:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (2, 7, '18:00:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (2, 8, '08:25:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (7, 8, '10:25:00');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (8, 2, '11:22:03');

insert into FuncionarioProjeto (numeroFunc, numeroProj, horas)
values (10, 4, '21:55:10');

select nome from funcionario;
select salario from Funcionario;
select * from Funcionario;

delete from funcionario where nome='Paulo Souza';

update Funcionario set salario = salario * 1.05;
update FUncionario set salario = salario * 1.05 where salario <= 5;
#ATIVIDADES
#Antony Brito
-- 1 Liste todos os dados de todos os funcionarios da empresa
select numero, nome, rua, nro, bairro, cidade, estado, cep,salario, numeroSupervisor, numerodepto from funcionario;

-- 2 Liste o estado de origem dos funcionários
select estado from funcionario;

-- 3 Liste os valores distintos de todos os funcionarios
select distinct(salario) from funcionario;

-- 4 Liste os nomes dos funcionários que tenham a letra "R" no seu nome
select nome from funcionario
where nome like '%R%';

-- 5 Liste os numeros e os nomes dos gerentes de todos os departamentos da empresa
select F.nome, F.numero from funcionario F, departamento D
where D.numeroFuncGer = F.numero;

/* 6 Liste o número, nome, salário e data de início de todos os gerentes de departamento
que recebem salários maiores que R$ 2.000,00 e que desempenham essa função a mais de
3 anos */
select f.numero, f.nome, f.salario, d.dataIniGer
from funcionario f join departamento d on d.numeroFuncGer = f.numero
where f.salario > 2000
and timestampdiff(year, d.dataIniGer, curdate()) > 3;

-- 7 Liste todos os dados do funcionário que recebe o maior salário da empresa
select * from funcionario
where salario = (select max(salario) from funcionario);

-- 8 Liste o nome do projeto e o total de horas trabalhadas por funcionários no projeto de número 2
select p.nome, sum(horas) from funcionarioProjeto fp, projeto p
where fp.numeroProj = 2 and fp.numeroProj = p.numero;

-- 9 Liste a média de horas trabalhadas no projeto 3;
select p.nome, avg(horas) from funcionarioProjeto fp, projeto p
where fp.numeroProj = 3 and fp.numeroProj = p.numero;

-- 10 Liste os nomes dos dependentes e suas respectivas idades
select nome, timestampdiff(year, dataNasc, current_date()) as idade
from dependente;

-- 11 Liste funcionários da cidade de São Paulo que possuem salario maior que R$2.200,00
select numero, nome, salario from funcionario 
where cidade = 'Sao Paulo' and salario > 2200;

-- 12 Liste o nome do funcionário e o nome dos seus dependentes
select f.nome as funcionarioNome, d.nome as dependenteNome from funcionario f, dependente d
where f.numero = d.numeroFunc;

-- 13 Liste o nome e o numero do projeto de todos os funcionários que participam de projetos
select funcionario.nome, funcionarioProjeto.numeroProj from funcionario, funcionarioProjeto
where funcionario.numero = funcionarioProjeto.numeroFunc;

/* 14 Liste o nome e o número do projeto de todos os funcionários que participam de projetos 
e trabalham a mais de 20 horas no projeto */
select f.nome, fp.numeroProj from funcionario f, funcionarioProjeto fp
where f.numero = fp.numeroFunc and fp.horas >= '20:00:00';

-- 15 Ordenar funcionários por nome descendente e depois ascendente
select * from funcionario order by nome desc;
select * from funcionario order by nome asc;

-- 16 Ordenar funcionários por cidade (ascendente) e por salário (descendente)
select * from funcionario order by cidade asc, salario desc;

-- 17 Liste os nomes dos funcionário cujo salários estejam entre R$1.000,00 e R$2.000,00
select nome, salario from funcionario where salario >= 1000 and salario <= 2000;
select nome, salario from funcionario where salario between 1000 and 2000;

-- 18 Liste funcionários de cidades que contenham 'ar' no nme da cidade
select * from funcionario
where cidade like '%ar%';

-- 19 Liste o valor do maior salário pago pela empresa
select max(salario) as maior_salario from funcionario;

-- 20 Liste o valor do menor salário pago pela empresa
select min(salario) as menor_salario from funcionario;

-- 21 Liste a media do salário pago pela empresa
select round(avg(salario), 2) as media_salario from funcionario;

-- 22 Liste o valor da folha salarial da empresa
select round(sum(salario)) as folha_salarial from funcionario;

-- 23 Liste a quantidade de funcionário que recebem mais do que R$1.500 de salário mensal
select count(*) as contagem_salario_maior_que_1500 from funcionario
where salario > 1500;

-- 24 Liste funcionário de cidade que começa com 'São'
select * from funcionario
where cidade like('São%');

-- 25 Liste a quantidade de funcionários que recebe mais que a média salarial
select count(*) as contagem_salario_maior_que_media from funcionario
where salario > (select avg(salario) from funcionario);

-- 26 Liste funcinário sem supervisor
select nome from funcionario where numeroSupervisor is null;

-- 27 Liste funcionário com supervisor
select nome from funcionario where numeroSupervisor is not null;

-- 28 Liste o nome dos funcionários e seu supervisor
select f1.nome as funcionario, f2.nome as supervisor from funcionario f1, funcionario f2
where f1.numeroSupervisor = f2.numero;