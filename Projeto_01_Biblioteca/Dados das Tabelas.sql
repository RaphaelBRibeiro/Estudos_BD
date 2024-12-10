/**/

/*Tabela de Livros*/
insert into Livros values (null,'Dom Casmurro', 'Machado de Assis', 1899, True);
insert into Livros values (null,'O Pequeno Principe', 'Antoine de Saint-Exupery', 1943, True);
insert into Livros values (null,'1984', 'Geoge Orwell', 1949, False);
insert into Livros values (null,'Cem Anos de Solidao', 'Gabriel Garcia Marquez', 1967, True);
insert into Livros values (null,'A Revolucao dos Bichos', 'Geoge Orwell', 1945, True);

/*Tabela de Usuarios*/
insert into Usuarios values (null, 'Ana Silva', 'ana.silva@email.com','123456789');
insert into Usuarios values (2,'Joao Oliveira', 'joao.oliveira@email.com','987654321');
insert into Usuarios values (3,'Maria Santos', 'maria.santos@email.com', '1122334455');
insert into Usuarios values (null,'Pedro Almeida','pedro.almeida','667789900');
insert into Usuarios values (null,'Carla Ferreira','carla.ferreira@email.com','556677889');

/*Tabela Emprestimos*/
insert into Emprestimos (idEmprestimo, ID_Livro, ID_Usuario, data_emprestimo, data_devolucao, estado)
VALUES
(1, 3, 3, '2024-11-20', '2024-12-01', 'Pendente'),
(2, 2, 1, '2024-11-15', '2024-11-25', 'Devolvido'),
(3, 1, 4, '2024-11-22', '2024-12-02', 'Pendente'),
(4, 4, 5, '2024-11-23', '2024-12-04', 'Pendente'),
(5, 5, 2, '2024-11-10', '2024-11-20', 'Devolvido');
