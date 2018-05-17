-- Banco de dados
create database empresa;

-- Tabelas
create table empregado(
pnome varchar(20),
minicial char,
unome varchar(20),
ssn integer,
datanasc date,
endereco varchar(50),
sexo char,
salario float,
superssn integer,
dno integer
);

create table departamento(
dnome varchar(30),
dnumero integer,
gerssn integer,
gerdatainicio date
);

create table dept_localizacoes(
dnumero integer,
dlocalizacao varchar(30)
);

create table trabalha_em(
essn integer,
pno integer,
horas decimal(3,1)
);

create table projeto(
pjnome varchar(30),
pnumero integer,
plocalizacao varchar(30),
dnum integer
);

create table dependente(
essn integer,
nome_dependente varchar(50),
sexo char,
datanasc date,
parentesco varchar(20)
);

-- Povoando
insert into empregado (pnome, minicial, unome, ssn, datanasc,endereco, sexo, salario, superssn, dno)
values
('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston, TX', 'M', 30000, 333445555, 5),
('Franklin','T','Wong',333445555,'1955-12-08','683 Voss, Houston, TX', 'M', 40000, 888665555,5),
('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring, TX', 'F', 25000, 987654321,4),
('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire, TX', 'F', 43000, 888665555,4),
('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble, TX', 'M', 38000,
333445555,5),
('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston, TX', 'F', 25000, 333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston, TX', 'M', 25000, 987654321,4),
('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston, TX', 'M', 55000, null,1);
insert into departamento (dnome, dnumero, gerssn, gerdatainicio)
values
('Pesquisa',5,333445555,'1968-05-22'),
('Administração',4,987654321,'1995-01-01'),
('Sede administrativa',1,888665555,'1981-06-19');
insert into dept_localizacoes (dnumero, dlocalizacao)
values
(1,'Houstong'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(4,'Houston');
insert into trabalha_em (essn, pno, horas)
values
(123456789, 1, 35.5),
(123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
(453453453,2,20.0),
(333445555,2,10.0),
(333445555,3,10.0),
(333445555,10,10.0),
(333445555,20,10.0),
(999887777,30,30.0),
(999887777,10,10.0),
(987987987,10,35.0),
(987987987,30,5.0),
(987654321,30,20.0),
(987654321,20,15.0),
(888665555,20,null);
insert into projeto (pjnome, pnumero, plocalizacao, dnum)
values
('ProdutoX', 1, 'Bellaire',5),
('ProdutoY', 2, 'Sugarland',5),
('ProdutoZ', 3, 'Houston',5),
('Automatização', 10, 'Stafford',4),
('Reorganização', 20, 'Houston',1),
('Novos Benefícios', 30, 'Stafford',4);
insert into dependente (essn, nome_dependente, sexo, datanasc, parentesco)
values
(333445555, 'Alice', 'F','1986-04-05','FILHA'),
(333445555, 'Theodore', 'M','1983-10-25','FILHO'),
(333445555, 'Joy', 'F','1958-05-03','CÔNJUGE'),
(987654321, 'Abner', 'M','1942-02-28','CÔNJUGE'),
(123456789, 'Michael', 'M','1988-01-04','FILHO'),
(123456789, 'Alice', 'F','1988-12-30','FILHA'),
(123456789, 'Elizabeth', 'F','1967-05-05','CÔNJUGE');

-- Restrições de integridades: chave e referencial
alter table empregado add constraint pk_empregado primary key (ssn);
alter table departamento add constraint pk_departamento primary key (dnumero);
alter table dept_localizacoes add constraint pk_dept_localizacoes primary key (dnumero, dlocalizacao);
alter table trabalha_em add constraint pk_trabalha_em primary key (essn, pno);
alter table projeto add constraint pk_projeto primary key (pnumero);
alter table dependente add constraint pk_dependente primary key (essn, nome_dependente);
alter table empregado add constraint fk_empregado_empregado foreign key (superssn) references empregado(ssn);
alter table empregado add constraint fk_empregado_departamento foreign key (dno) references departamento(dnumero);
alter table departamento add constraint fk_departamento_empregado foreign key (gerssn) references empregado(ssn);
alter table dept_localizacoes add constraint fk_dept_localizacoes_departamento foreign key (dnumero) references
departamento(dnumero);
alter table trabalha_em add constraint fk_trabalha_em_empregado foreign key (essn) references empregado(ssn);
alter table trabalha_em add constraint fk_trabalha_em_projeto foreign key (pno) references projeto(pnumero);
alter table projeto add constraint fk_projeto_departamento foreign key (dnum) references departamento(dnumero);
alter table dependente add constraint fk_dependente_empregado foreign key (essn) references empregado(ssn);
