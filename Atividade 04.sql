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

create table Telefone (
    IdTelefono Int Primary Key Auto_Increment,
    Tipo Enum ('Residencial', 'Comercial', 'Celular') Not null,
    Numero Varchar (10) Not Null,
    ID_Cliente int Unique,
    foreign key (ID_Cliente)
    References cliente (IdCliente)
);



create table endereco (
    IdEndereco int Primary key Auto_Increment,
    Rua varchar (30) not null,
    Barrio varchar (30) not null, 
    Cidade Varchar (30) not null,
    Estado char (2) not null,
    IdCliente int Unique,
    Foreign key 
);