/*Endereço - Obrigatorio 
Cadastro de Apenas um 

Telefone - Nao Obrigatorio 
Cadastro de mais de um (Opcional) */

create database Comercio;

use Comercio;

Show databases;

create Table cliente(
    IdCliente INT Primary Key Auto_Increment,
    Nome Varchar (30) Not Null,
    Sexo Enum ('M','F') Not Null,
    Email Varchar (50) Unique,
    CPF Varchar (15) Unique
);
/*Relação 1 x 1 */
create table endereço (
    IdEndereço Int Primary Key Auto_Increment,
    Rua varchar (30) Not Null,
    Barrio Varchar (30) Not Null,
    Cidade Varchar (30) Not Null,
    Estado Char (2) Not Null,
    ID_Cliente INT Unique ,
    foreign key (ID_Cliente)
    References cliente (IdCliente)
    );


/*Relação 1 x n */
create table Telefone (
    IdTelefono Int Primary Key Auto_Increment,
    Tipo Enum ('Res', 'Com', 'Cel') Not null,
    Numero Varchar (10) Not Null,
    ID_Cliente int,
    foreign key (ID_Cliente)
    References cliente (IdCliente)
);


insert into cliente values (null, 'Joao', 'M', 'joao@ig.com','9281429441');
insert into cliente values (null, 'Carlos', 'M', 'carlos@ig.com','43145677322');
insert into cliente values (null, 'Ana', 'F', 'ana@ig.com','76128736300');
insert into cliente values (null, 'Clara', 'F', null,'56248831963');
insert into cliente values (null, 'Jorge', 'M', 'jorge@ig.com','92731225661');
insert into cliente values (null, 'Celia', 'F', 'Celia@ig.com','71943824150');



insert into endereço values ( null, 'Antonio Sa', 'Centro', 'Belo Horizonte', 'MG', 4);

update endereço 
set Rua = 'Rua Antonio Sa'
where Rua ='Antonio Sa';


insert into endereço values (null, 'Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1);
insert into endereço values (null, 'Rua Pres Vargas','Jardins', 'Sao Paulo', 'SP', 3 );
insert into endereço values (null, 'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2 );
insert into endereço values (null, 'Rua do Ouvidor', 'Flamengo', 'Rio de Janeir', 'RJ',6);
insert into endereço values (null, 'Rua Urugauiana', 'Centro', 'Vitoria', 'ES',5);


insert into telefone values (null, 'Cel', '78458743', 5);
insert into telefone values (null, 'Res', '56576876', 2);
insert into telefone values (null, 'Cel', '81273251', 1);
insert into telefone values (null, 'Com', '90452362', 2);
insert into telefone values (null, 'Res', '99176510', 1);
insert into telefone values (null, 'Cel', '10924569', 3);
insert into telefone values (null, 'Res', '18642600', 3);
insert into telefone values (null, 'Com', '21004125', 1);
insert into telefone values (null, 'Res', '98712402', 5);
insert into telefone values (null, 'Cel', '19059578', 2);

/*Seleção Projeção e Junção*/

/*Projeção = Tudo que voce quer ver na Tela (Select * from ...; )*/
Select nome from cliente;

Select IdTelefono, numero, tipo from telefone;
/*Seleção = É filtrar e trazer um Subconjunto de um Conjunto total (... Where ) */ 
select nome, sexo, email from cliente
where sexo = 'F';

select numero from telefone
where tipo = 'cel';

/* Junção = É juntar duas tabelas para uma Seleção */
/* Usando o whre no lugar do Join */
select nome, sexo, barrio, cidade
from cliente, endereço
where IdCliente = ID_Cliente ;

/* Usando o Inner Join */

select nome, sexo, barrio, cidade
from cliente
Inner Join endereço 
on IdCliente = ID_Cliente;

select nome, sexo, barrio, cidade /* Projeçao */
from cliente /* Origem */
    Inner Join endereço  /* Junção */
    on IdCliente = ID_Cliente
where sexo = 'F'; /* Seleção */

/* Quero uma Query com Nome, Sexo, Email, Numero, Tipo */

select nome, sexo, email, numero, tipo 
from cliente
    Inner Join telefone
    on IdCliente =ID_Cliente
where tipo = 'Cel';


/*Junção de mais de duas tabelas*/
select cliente.nome, sexo, barrio, endereço.cidade, telefone.tipo, telefone.numero
from cliente
    inner join endereço
        on cliente.IdCliente = endereço.ID_Cliente
    inner join telefone
        on cliente.IdCliente = telefone.ID_Cliente;
/*Possivel tambem utilizando "Alias" (colocando apelido nas tabelas, conhecido como ponteramento)*/
    select C.nome, C.sexo, E.barrio, E.cidade, T.tipo, T.numero
from cliente C
    inner join endereço E
        on C.IdCliente = E.ID_Cliente
    inner join telefone T
        on C.IdCliente = T.ID_Cliente;

/* DML - DATA MANIPULATION LANGUAGE */
Insert into cliente values (Null,'Paula','M', Null,'77437493');
Insert into endereço values (Null, 'Rua Joaquim Siva', 'Alvorada', 'Niteroi','RJ',7);

select * from cliente
where IdCliente = 7;

update cliente 
set sexo = 'F'
where IdCliente = 7;

Insert into cliente values (Null,'XXX','M', Null,'XXX');

select * from cliente 
where IdCliente = 8;

delete from cliente 
where IdCliente = 8;


/*DDL - DATA DEFINITION LANGUAGE */
create table Produto (
    idProduto int primary key Auto_Increment,
    nome_produto Varchar(30) not null,
    preco int,
    frete float (10,2) not null
);

alter table Produto
Change preco Valor_Unitario int;

alter table Produto
Change Valor_Unitario Valor_Unitario int;

/* Usando o Modify - usar para alterar tipos de coluna  */
alter table produto
modify Valor_Unitario varchar (50) not null;

/* Para adicionar colunas */
alter table produto 
add peso float (10,2) not null;

alter table produto 
drop column peso;

/*é possivel colocar uma coluna em um lugar especifico usado o After ou first */
alter table produto 
add column peso float (10.2) not null
After nome_produto; 


/* IFNULL - */
/*Nome, email, numero, estado (sem aparecer os 'Nulls' de email)*/

select C.nome, 
    IFNULL(C.email,'****************') as Email, 
    E.estado, 
    T.numero
from cliente C
    inner join endereço E
        on C.IdCliente = E.ID_Cliente
    inner join telefone T
        on C.IdCliente = T.ID_Cliente;

/* VIEWS - uma Função para visualização das tabelas */
/*Nome, sexo, Email, Numero, Tipo, Barrio, Cidade, Estado*/

create view Relatorio as 
select C.nome, C.sexo, C.Email, 
    T.Numero, T.Tipo, 
    E.Barrio, E.Cidade, E.Estado 
from cliente C
    inner join Telefone T
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente ;

select * from Relatorio;
/* para visualiazar as views programadas, use o comando 'Show tables' */

/*Pode utilizar um Prefixo para identificar as view das tabelas*/

create view V_Relatorio as 
select C.nome, C.sexo,
    IFNULL(C.Email, '***********' ) as 'E-mail', 
    T.Numero, T.Tipo, 
    E.Barrio, E.Cidade, E.Estado 
from cliente C
    inner join Telefone T
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente ; 

select Nome, numero, estado 
from V_Relatorio;