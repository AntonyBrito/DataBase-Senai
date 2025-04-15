# <<<<<<<< SCRIPT COMPLETO >>>>>>>>>>>
DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE IF NOT EXISTS EMPRESA;

USE EMPRESA;
-- show databases;
-- describe ou desc funcionario;
-- show tables

# Criando tabela DFuncionario
create table IF NOT EXISTS Funcionario (
    numero integer not null,
    nome varchar(64),
    rua varchar(32),
    nro integer,
    bairro varchar(20),
    cidade varchar(20),
    estado varchar(2),
    cep varchar(9),
    salario float,
    numeroSupervisor integer,
    primary key(numero),
    foreign key (numeroSupervisor) references Funcionario(numero)
);

# Criando tabela Departamento
create table IF NOT EXISTS Departamento (
    numero integer not null,
    nome varchar(32),
    numeroFuncGer integer,
    dataIniGer date,
    primary key (numero),
    foreign key (numeroFuncGer) references Funcionario(numero)
   
);
alter table Funcionario add numerodepto integer;
desc Funcionario;

create table IF NOT EXISTS Projeto (
    numero integer not null,
    nome varchar(32),
    numeroDepto integer,
    primary key (numero),
    foreign key (numeroDepto) references Departamento(numero)
);

create table IF NOT EXISTS Dependente (
    numeroFunc integer not null,
    nome varchar(64) not null,
    dataNasc date,
    parentescpo varchar(16),
    primary key (numeroFunc, nome),
    foreign key (numeroFunc) references Funcionario(numero)
    on delete cascade
    on update cascade
    );
create table IF NOT EXISTS LocalDep (
    numeroDepto integer not null,
    localizacao varchar(32),
    primary key (numeroDepto, localizacao),
    foreign key (numeroDepto) references Departamento(numero)
);
create table IF NOT EXISTS FuncionarioProjeto (
    numeroFunc integer,
    numeroProj integer,
    horas time,
    primary key (numeroFunc, numeroProj),
    foreign key (numeroFunc) references Funcionario(numero),
    foreign key (numeroProj) references Projeto(numero)
);


# *************** INSERINDO VALORES NAS TABELAS FUNCIONARIO **************

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

# *************** INSERINDO VALORES NAS TABELAS DEPARTAMENTO **************
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

# *************** INSERINDO VALORES NAS TABELAS LOCALDEP **************
#insert into LocalDep(numeroDepto, localizacao) values (1, 'Edificio Marte');

insert into localDep(numeroDepto, localizacao)
values (1, 'Edificio Marte');

insert into localDep(numeroDepto, localizacao)
values (1, 'Edificio Planeta Vermelho');

#insert into localDep(numeroDepto, localizacao)
#values (2, 'Edificio Saturno');

insert into localDep(numeroDepto, localizacao)
values (3, 'Edificio Plutao');

insert into localDep(numeroDepto, localizacao)
values (3, 'Edificio Ex-Planeta');

insert into localDep(numeroDepto, localizacao)
values (4, 'Edificio Jupiter');

insert into localDep(numeroDepto, localizacao)
values (5, 'Edificio Lua');

alter table Dependente change parentescpo parentesco varchar(16);
# *************** INSERINDO VALORES NAS TABELAS DEPENDENTE **************
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


# *************** INSERINDO VALORES NAS TABELAS PROJETO **************
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

# *************** INSERINDO VALORES NAS TABELAS FUNCIONARIOPROJETO **************
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

-- *********  SELECTS  *********
-- 1 Liste todos os dados de todos os funcionários da empresa
select * from Funcionario;

-- 2 Liste os estados de origem dos funcionários da empresa
select estado from Funcionario;

-- 3 Liste os valores distintos de salários pagos aos funcionários
select distinct salario from Funcionario;

-- 4 Liste os nomes dos funcionários que tenham a letra “R” no seu nome
select * from Funcionario where nome like '%r%';

-- 5 Liste os numeros e os nomes dos gerentes de todos os departamentos da empresa    
select f.nome, f.numero from Departamento d, Funcionario f where d.numeroFuncGer = f.numero;
   
-- 6 Liste o número, nome, salário e data de início de todos os gerentes de departamento
#que recebem salários maiores que R$ 2.000,00 e que desempenhem essa função a mais de 3 anos
select f.numero, f.nome, f.salario, d.dataIniGer from Departamento d, Funcionario f
where d.numeroFuncGer = f.numero and f.salario > 2000 and
timestampdiff(year, dataIniGer, current_date()) >= 3;

-- 7 Liste todos os dados do funcionário que recebe o maior salário da empresa
select * from Funcionario where salario = (select max(salario) from Funcionario);
   
-- 8 Liste o nome do projeto e o total de horas trabalhadas por funcionários no projeto de número 2
select p.nome, sum(horas) from FuncionarioProjeto fp, Projeto p
where fp.numeroProj = 2 and fp.numeroProj = p.numero;

-- 9 Liste a média(average) de horas trabalhadas no projeto 3
select p.nome, avg(horas) from FuncionarioProjeto fp, Projeto p
where fp.numeroProj = 3 and fp.numeroProj = p.numero;

-- 10 Liste os nomes dos dependentes e suas respectivas idades
select nome, timestampdiff(year, dataNasc, current_date()) from Dependente;
   
-- 11 Liste funcionarios da cidade de São Paulo que possuem salario maior que R$ 2200,00
select numero, nome, salario from Funcionario where cidade = 'São Paulo' and salario > 2200;

-- 12 Liste o nome do funcionário e o nome dos seus dependentes
select * from Dependente, Funcionario where Funcionario.numero = Dependente.numeroFunc;

select Dependente.nome, Funcionario.nome from Dependente, Funcionario
where Funcionario.numero = Dependente.numeroFunc;
   
 -- 13 Liste o nome e o numero do projeto de todos os funcionários que participam de projetos
select * from FuncionarioProjeto;

select Funcionario.nome, FuncionarioProjeto.numeroProj from Funcionario, FuncionarioProjeto
where Funcionario.numero = FuncionarioProjeto.numeroFunc;

select f.nome, fp.numeroProj from Funcionario f, FuncionarioProjeto fp
where f.numero = fp.numeroFunc;
   
 -- 14 Liste o nome e o número do projeto de todos os funcionários que participam de projetos
 # e trabalham mais do que 20 horas no projeto
 select f.nome, fp.numeroProj from Funcionario f, FuncionarioProjeto fp
 where f.numero = fp.numeroFunc and fp.horas >= '20:00:00';
 
   
-- 15 Ordenar funcionarios por nome descendente e depois ascendente
select * from Funcionario order by nome desc;
select * from Funcionario order by nome asc;

-- 16 Ordenar funcionarios por cidade (ascendente) e por salário (descendente)
select * from funcionario order by cidade asc, salario desc;

-- 17 Liste os nomes dos funcionarios cujos salarios estejam entre R$1.000,00 e R$2.000,00
select nome,salario from Funcionario where salario >= 1000 and salario <= 2000;
select nome,salario from Funcionario where salario between 1000 and 2000;

-- 18 Liste funcionarios de cidades que contenham 'ar' no nome da cidade
select nome, cidade from Funcionario where cidade like '%ar%';

-- 19 Liste o valor do maior salario pago pela empresa
select max(salario) as 'maior salario' from Funcionario;
 
-- 20 Liste o valor do menor salario pago pela empresa
select min(salario) as 'menor salario' from Funcionario;

-- 21 Liste a media do salario pago pela empresa
select avg(salario) as 'media salarial' from Funcionario;
select round(avg(salario)) as 'media salarial arredondado' from Funcionario;


-- 22 Liste o valor da folha salarial da empresa
select round(sum(salario)) as 'folha salarial' from Funcionario;

-- 23 Liste a quantidade de fucionario que recebem mais
# do que R$1500 de salario mensal
select count(*) from Funcionario where salario >= 1500;

-- 24 Liste funcionário de cidades que começam com ‘São’
select nome, cidade from Funcionario where cidade like 'são%';
   
-- 25 Liste a quantidade de funcionário que recebe mais que a média salarial    
 select count(*) from Funcionario where salario >= (select round(avg(salario)) from Funcionario);
   
-- 26 Liste funcionarios sem supervisor    
select nome from funcionario where numeroSupervisor is null;

-- 27 Liste funcionarios com supervisor    
select nome from funcionario where numeroSupervisor is not null;

-- 28 Liste o nome dos funcionários e seu supervisor
select f1.nome as 'funcionario', f2.nome as 'supervisor' from Funcionario f1, Funcionario f2
where f1.numero = f2.numeroSupervisor;

-- 29 Liste o funcionario que tenha trabalhado a maior quantidade de horas em um projeto
select f.nome, fp.horas from Funcionario f, funcionarioprojeto fp where f.numero = fp.numeroFunc
and horas = (select max(horas) from funcionarioprojeto);

-- 30 Liste todos os funcionarios que trabalham em projetos
select nome from Funcionario where numero in (select numeroFunc from funcionarioprojeto);

-- 31 Liste todos os funcionarios que não trabalham em projetos
select nome from Funcionario where numero not in (select numeroFunc from funcionarioprojeto);
   
-- 32 Liste os nomes dos funcionarios que trabalham mais horas do que todas as horas trabalhadas
-- por funcionarios no projeto 3
select f.nome, fp.horas from Funcionario f, funcionarioprojeto fp
where f.numero = fp.numeroFunc and fp.horas = (select distinct horas from funcionarioprojeto where
numeroProj = 3);

-- JOINS --
# exemplos material de aula

# slide 8
Select nome, horas
From(funcionario F JOIN FuncionarioProjeto P 
ON F.numero=P.numeroFunc)
Where horas in('10:45:00','5:48:54');

# slide 11
Select nome, numeroProj, horas
From (funcionario F INNER JOIN FuncionarioProjeto P 
ON F.numero=P.numeroFunc);

Select nome, numeroProj, horas
From funcionario F, FuncionarioProjeto P
Where F.numero=p.numeroFunc;

# slide 13
Select nome, numeroProj
From (funcionario F 
LEFT OUTER JOIN FuncionarioProjeto P
ON F.numero=P.numeroFunc);

# slide 15
Select numeroFunc, F.nome, numeroProj, P.nome
From (funcionario F RIGHT OUTER JOIN FuncionarioProjeto FP ON
F.numero=FP.numeroFunc) RIGHT OUTER JOIN Projeto P ON
FP.numeroProj=P.numero;

# slide 17
Select F.numero AS FuncionarioNumero, F.nome AS FuncionarioNome, P.numero AS
ProjetoNumero, P.nome AS ProjetoNome FROM funcionario F
LEFT OUTER JOIN FuncionarioProjeto FP ON F.numero = FP.numeroFunc
LEFT OUTER JOIN Projeto P ON FP.numeroProj = P.numero
UNION
SELECT F.numero AS FuncionarioNumero, F.nome AS FuncionarioNome, P.numero AS ProjetoNumero,
P.nome AS ProjetoNome FROM funcionario F 
LEFT OUTER JOIN FuncionarioProjeto FP ON F.numero = FP.numeroFunc
LEFT OUTER JOIN Projeto P ON FP.numeroProj = P.numero;

# slide 19
Select F.numero, F.nome, P.numero, P.nome
From (funcionario F LEFT OUTER JOIN FuncionarioProjeto FP ON
F.numero=FP.numeroFunc) LEFT OUTER JOIN Projeto P ON
FP.numeroProj=P.numero where FP.numeroProj is NULL;

# slide 20
Select F.numero, F.nome, P.numero, P.nome
From (funcionario F RIGHT OUTER JOIN FuncionarioProjeto FP ON
F.numero=FP.numeroFunc) RIGHT OUTER JOIN Projeto P ON
FP.numeroProj=P.numero where FP.numeroFunc is NULL;

# slide 21
Select F.numero, F.nome, P.numero, P.nome From(funcionario F LEFT OUTER JOIN
FuncionarioProjeto FP ON F.numero=FP.numeroFunc) LEFT OUTER JOIN Projeto P ON
FP.numeroProj=P.numero where FP.numeroProj is NULL
UNION
Select F.numero, F.nome, P.numero, P.nome From (funcionario F RIGHT OUTER JOIN
FuncionarioProjeto FP ON F.numero=FP.numeroFunc) RIGHT OUTER JOIN Projeto P ON
FP.numeroProj=P.numero where FP.numeroFunc is NULL;

# slide 23
SELECT D.numero, D.nome, avg(salario) as media FROM
departamento D, funcionario F where
D.numero=F.numeroDepto
GROUP BY f.numeroDepto;

# slide 27
select * from
(Select numeroFunc, sec_to_time(sum(time_to_sec(horas))) as total
from funcionarioProjeto
group by numeroFunc) AS X
inner join funcionario AS F ON X.numeroFunc=F.numero and
X.total=(select max(total) from
(select numeroFunc, sec_to_time(sum(time_to_sec(horas))) as total
from funcionarioProjeto group by numeroFunc) B);

# slide 29
SELECT D.numero, D.nome, avg(salario) as media FROM Departamento D, Funcionario F
WHERE D.numero = F.numeroDepto
GROUP BY F.numeroDepto
HAVING media > 2300.00;

-- -- -- ATIVIDADES -- -- --
# 1) Liste os números, nomes dos projetos e nomes de seus respectivos funcionários;
Select P.numero, P.nome, F.nome from projeto P 
join funcionarioProjeto FP on P.numero = FP.numeroProj
join funcionario F on F.numero = FP.numeroFunc;

# 2) List os números, nomes dos projetos e nomes de seus respectivos funcionário,
# independente se existem funcionários trabalhando no projeto;
Select p.numero, p.nome, f.nome from projeto p
left join funcionarioProjeto FP on P.numero = FP.numeroProj
left join funcionario F on F.numero = FP.numeroFunc;

# 3) Liste a média salarial de todos os funcionários da empresa. Arredonde para duas
# casas decimais e dê o nome da coluna restante de "Média Salarial";
select round(avg(salario), 2) as 'Média Salarial' from funcionario;

# 4) Liste o número, o nome e a média salarial de cada departamento;
Select d.numero, d.nome, avg(f.salario) as 'Média' 
from departamento d join funcionario f
on f.numeroDepto = d.numero
group by d.numero;

# 5) Liste o número, o nome do departamento, o total de funcionários de cada um deles e
# a média salarial departamento;
select d.numero, d.nome, count(salario) as 'nro funcionario',
avg(f.salario) as 'média' from departamento d join funcionario f 
on f.numeroDepto = d.numero
group by d.numero;

# 6) Liste o número, o nome do departamento, o total de funcionários de cada um deles e
# a média salarial departamento. Liste, inclusive, departamento sem funcionários;
select d.numero, d.nome, count(salario) as 'nro funcionario',
avg(f.salario) as 'média' from departamento d left join funcionario f 
on f.numeroDepto = d.numero
group by d.numero;

# 7) List o número e o nome dos departamentos que possui mais de 2 funcionários;
select d.numero, d.nome, count(salario) as 'nro_funcionario',
avg(f.salario) as 'média' from departamento d left join funcionario f 
on f.numeroDepto = d.numero
group by d.numero
having nro_funcionario > 2;

# 8) Liste para cada gerente de departamento, o seu nome, o departamento e os subordinados que este possui;
select f1.nome as 'gerente', d.nome, f2.nome as 'subordinado' 
from Funcionario f1 join departamento d
on f1.numero = d.numeroFuncGer
join funcionario f2
on f2.numeroDepto = d.numero;





