create database Aluguel_Carros;

use Aluguel_Carros;

-- TABELA DE CARROS
create table Carros(
    IdCarros int primary key Auto_Increment,
    Modelo varchar (30),
    Marca varchar (30),
    Ano char (4),
    Cor varchar (20)
);




-- TABELA DE CLIENTES
create table cliente(
    IDCliente int primary key Auto_Increment,
    Nome varchar (30) not null,
    Sexo Enum ('M','F') not null,
    Email varchar (50)unique not null,
    CPF varchar (15) unique not null,
);

Delimiter &
create procedure Cad_Cliente(P_nome varchar (30), P_sexo Enum ('M','F'), P_email varchar (50),P_CPF varchar(15))
    begin
        insert into cliente values (null, P_nome, P_sexo, P_email, P_CPF );

    end 
&

Delimiter ;

create table Endereco_Client(
    id_Endereco_C int primary key Auto_Increment,
    Rua varchar (30)not null,
    Barrio varchar (30) not null,
    Cidade Varchar (30) not null,
    Estado Char (2) not null,
    ID_Cliente int Unique,
    foreign key (ID_Cliente)
    References cliente (IDCliente)
);

Delimiter &
create procedure Cad_Endereco_C(P_Rua varchar (30), P_Barrio varchar (30), P_Cidade varchar (30),P_Estado char (2))

    begin
        insert into cliente values (null, P_Rua, P_Barrio, P_Cidade, P_Estado );

    end 
&

Delimiter ;

create table Telefone__Client(
    id_Telefone_C int primary key Auto_Increment,
    Numero Varchar (12) not null,
    Tipo Enum ('Res','Cel') not null,
    ID_Cliente int unique,
    foreign key (ID_Cliente)
    References cliente (IDCliente)
);

Delimiter &
create procedure Cad_Telefone_C(P_Numero varchar (12), P_Tipo Enum ('Res','Cel'))

    begin
        insert into Telefone__Client values (null, P_Numero, P_Tipo );

    end 
&

Delimiter ;


-- TABELA DE VENDEDOR
create table Vendedor(
    IDVendedor int primary key Auto_Increment,
    Nome varchar (30) not null,
    Sexo Enum ('M','F') not null,
    Email varchar (50)unique not null,
    CPF varchar (15) unique not null
);

Delimiter &
create procedure Cad_Vendedor(P_Nome varchar (30), P_Sexo Enum ('M','F'), P_Email varchar (50), P_CPF varchar (15))

    begin
        insert into Vendedor values (null, P_Nome, P_Sexo, P_Email, P_CPF );

    end 
&

Delimiter ;


create table Endereco_Vend(
    id_Endereco_V int primary key Auto_Increment,
    Rua varchar (30) not null,
    Barrio varchar (30) not null,
    Cidade Varchar (30) not null,
    Estado Char (2) not null,
    ID_Vendedor int unique,
    foreign key ID_Vendedor
    References Vendedor (IDVendedor)
);

Delimiter &
create procedure Cad_Endereco_V (P_Rua varchar (30), P_Barrio varchar (30), P_Cidade varchar (30), P_Estado char (2))

    begin
        insert into Endereco_Vend values (null, P_Rua, P_Barrio, P_Cidade, P_Estado);

    end 
&

Delimiter ;


create table Telefone_Vend(
    id_Telefone_V int primary key Auto_Increment,
    Numero Varchar (12) not null,
    Tipo Enum ('Res','Cel') not null,
    ID_Vendedor int unique,
    foreign key ID_Vendedor
    references Vendedor (IDVendedor)
);

Delimiter &
create procedure Cad_Telefone_V (P_Numero varchar (12), P_Tipo Enum ('Res', 'Cel'))

    begin
        insert into Telefone_Vend values (null, P_Numero, P_Tipo );

    end 
&

Delimiter ;