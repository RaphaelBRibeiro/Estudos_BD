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


insert into cliente values ( null, 'Joao', 'M', 'joao@ig.com','9281429441');
insert into cliente values ( null, 'Carlos', 'M', 'carlos@ig.com','43145677322');
insert into cliente values ( null, 'Ana', 'F', 'ana@ig.com','76128736300');
insert into cliente values ( null, 'Clara', 'F', null,'56248831963');
insert into cliente values ( null, 'Jorge', 'M', 'jorge@ig.com','92731225661');
insert into cliente values ( null, 'Celia', 'F', 'Celia@ig.com','71943824150');



insert into endereço values ( null, 'Antonio Sa', 'Centro', 'Belo Horizonte', 'MG', 4);

update endereço 
set Rua = 'Rua Antonio Sa'
where Rua ='Antonio Sa';


insert into endereço values ( null, 'Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1);
insert into endereço values ( null, 'Rua Pres Vargas','Jardins', 'Sao Paulo', 'SP', 3 );
insert into endereço values ( null, 'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2 );
insert into endereço values ( null, 'Rua do Ouvidor', 'Flamengo', 'Rio de Janeir', 'RJ',6);
insert into endereço values ( null, 'Rua Urugauiana', 'Centro', 'Vitoria', 'ES',5);


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

/*Seleção Projeção e Junção

Projeção = Tudo que voce quer ver na Tela

Seleção =

Junção =*/