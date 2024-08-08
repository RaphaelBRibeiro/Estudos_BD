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
drop view relatorio
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

insert into V_Relatorio values(
    'Andreia,', 'F', 'Andreia@Uol.com.br', 
    'CEL', '873547864', 
    'Centro', 'Vitoria', 'ES'
);

create table jogadores(
    idjogador int,
    nome varchar(30),
    Estado chat(2)
);

insert into jogadores values (1, 'Leo Gamalho', 'SP');
insert into jogadores values (2, 'Rodrigo Andrade', 'SP');
insert into jogadores values (3, 'Daniel JR', 'PR' );
insert into jogadores values (4, 'Gege', 'BA');
insert into jogadores values (5, 'Mateuzinho', 'BA');

create View V_Jogadores as
select nome, estado
from jogadores;

delete from V_Jogadores
where nome = 'Daniel JR';

insert into jogadores values (3, 'Daniel JR', 'PR' );




/*ORDER BY - Permite ordenar por... */

create table alunos (
    numero int,
    nome Varchar (30)
);

insert into alunos values (1, 'joao');
insert into alunos values (2, 'Maria');
insert into alunos values (2, 'Zoe');
insert into alunos values (2, 'Andre');
insert into alunos values (3, 'Clara');
insert into alunos values (1, 'Clara');
insert into alunos values (4, 'Mafra');
insert into alunos values (5, 'Janaina');
insert into alunos values (1, 'Janaina');
insert into alunos values (3, 'Marcelo');
insert into alunos values (4, 'Giovani');
insert into alunos values (5, 'Antonio');
insert into alunos values (6, 'Ana');
insert into alunos values (6, 'Viviane');

/*é possovel ordenar de duas formas pelo nome da coluna*/
select numero, nome
from alunos 
order by numero;

select * from alunos 
order by nome;


/*Ou então pelo o indice das colunas */
select * from alunos 
order by 1;  ------------  /*coluna numero 1 (numero)*/

select numero, nome
from alunos 
order by 2; -------------  /*coluna numero 2 (nome)*/


/*Podemos tambem ordenar por mais de uma coluna */
select * from alunos 
order by numero, nome; ----------- Ordenando pelos nomes da tabela

select * from alunos ------------- Ordenando pelos indices da tabela 
order by 1, 2;


/*Para Mesclar o Order by com a Projeção é preciso que o seja feito com o NOME do indice e nao com o numero */
select nome from alunos
order by 1, 2;
ERROR 1054 (42S22): Unknown column '2' in 'order clause'

select nome from alunos
order by numero, nome;


/*Oder by Desc / Asc */
select * from alunos 
order by 1 Asc; ---------- Crecente (forma padão)

select * from alunos 
order by 1 Desc; --------- Decrescente 


/*Ordenar com Join e pelas Views*/

select C.nome, C.sexo,
    IFNULL(C.Email, '***********' ) as 'E-mail', 
    T.Numero, T.Tipo, 
    E.Barrio, E.Cidade, E.Estado 
from cliente C
    inner join Telefone T
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente 
order by 1; 

select * from V_Relatorio
order by 1;