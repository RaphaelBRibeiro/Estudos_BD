-- Organizaçao de chaves - CONSTRAINT (REGRA) 
create table jogador (
idJogador int primary key Auto_Increment,
nome varchar (30)
);

create table Time (
idtime int primary key Auto_Increment,
Time varchar (30),
id_jogador int,
foreign key  (Id_jogador)
references jogador (idJogador)
);

insert into jogador values (null, 'Mateusinho');
insert into Time Values (null, 'Vitoria', 1);

show create table Time;

/* CONSTRAINT `time_ibfk_1` FOREIGN KEY (`id_jogador`) REFERENCES `jogador` (`idJogador`) */

/*A CRIAÇÃO DE CHAVES ESTRANGEIRAS O PROPRIO BANCO DE DADOS DA UMA NOME ALEATORIO PARA ELA E ISSO N É UMA BOA PRATICA 
CRIAÇAO DE  TABELA E POR FORA A CRIAÇAO DA TABELA PARA CRIAR NOMES AS CONSTRAINTS ( por conta do dicionario de dados) */

create table cliente (
idCliente int,
nome varchar (30)
);

create table telefone (
idTelefone int,
tipo char (3) not null,
numero varchar (10) not null,
ID_Cliente int
);

alter table cliente 
add constraint PK_cliente
primary key (IdCliente);

alter table telefone 
add constraint FK_Cliente_Telefone
foreign key (Id_Cliente) 
references cliente (IdCliente);

show create table telefone;
/*CONSTRAINT `FK_Cliente_Telefone` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`idCliente`)*/

--DICIONARIO DE DADOS. nele sao guardados os metadados. 
--Todos os objetos armazenados em qualquer banco de dados é possivel encontrar no Dicionario de dados
/* information_schema performance_schema  mysql */

use information_schema;

desc TABLE_CONSTRAINTS;

select constraint_Schema as 'Banco',
    table_name as 'Tabela',
    constraint_name as 'Nome da Regra',
    constraint_Type as'Tipo'
from TABLE_CONSTRAINTS
where constraint_Schema = 'exercicio01';


-- APAGANDO CONSTRAINTS 
use exercicio01;

alter table telefone 
drop foreign key FK_Cliente_Telefone;

alter table telefone 
drop foreign key FK_Cliente_Telefone;
