/*Criação do Banco e das Tabelas*/
create database Biblioteca

create table Livros(
    idLivro int primary key Auto_Increment,
    Titulo varchar (255) not null,
    Autor Varchar (255) not null,
    Ano_Publicado int,
    Disponibilidade boolean default True
);

create table Usuarios(
    idUsuarios int primary key Auto_Increment,
    Nome varchar (40) not null,
    Email varchar (60) not null,
    telefone varchar (15)
);

create table Emprestimos(
    idEmprestimo int primary key Auto_Increment, 
    data_emprestimo Date not null,
    data_devolucao Date not null,
    estado varchar (20) not null,
    ID_Livro int not null,
    ID_Usuario int not null,
    foreign key (ID_Livro) References Livros (idLivro),
    foreign key (ID_Usuario) References Usuarios (idUsuarios)
);