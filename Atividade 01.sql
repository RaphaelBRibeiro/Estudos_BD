/* ATIVIDADE 
O nosso cliente solicitou uma tabela para armazenar os livros que são comercializados pela empresa. A solicitação é somente para livros e não há a necessidade de realizar busca em outras tabelas. 
Hoje há um funcionário de vendas que tem uma tabela do Excel para guardar esses registros, mas as buscas estão ficando complexas. Decidiu-se então criar um banco de dados separado para esse funcionário. */

create database Livraria;
use Livraria;

create table Livros(
Livro varchar (30),
Autor varchar (30),
Sexo char (1),
Paginas int (5),
Editora varchar (30),
Valor Float(5,2),
UF char (2),
Publicacao int (4)
);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Cavaleiro Real', 'Ana Claudia', 'F', 465,	'Atlas', 49.9, 'RJ', 2009);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('SQL para leigos', 'Joao Nunes', 'M', 450, 'Addison', 98, 'SP', 2018);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Receitas Caseiras ', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Habitoos Saudaveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('A Casa Marrom', 'Hermes Macedo', 'M', 250,'Bubba', 60, 'MG', 2016);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Estacio Querido ', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2015);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Pra Sempre Amigas','Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018);

insert into Livros (Livro, Autor, Sexo, Paginas, Editora, Valor, UF, Publicacao) values ('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017); 




/*  1  Trazer todos os dados. */ 
Select * 
from Livros;

/*    2  Trazer o nome do livro e o nome da editora*/
Select Livro,Editora 
From Livros;


/*    3  Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
Select  Livro, UF 
from Livros
where Sexo = 'M';

/*    4  Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
Select Livro, Paginas 
from Livros
Where Sexo = 'F';

/*    5  Trazer os valores dos livros das editoras de São Paulo.*/
Select Valor 
From Livros 
Where UF like 'SP';


/*    6  Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).*/
select Autor, livro, sexo, UF
from livros
where sexo = 'M'
and (UF = 'RJ' 
or UF = 'SP');