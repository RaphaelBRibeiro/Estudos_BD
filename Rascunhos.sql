/* CRIAÇÃO DE UMA DATABASE E TABELAS*/
create database /*Nome do seu banco de dados*/; 

use /**nome do Banco*/;    /* usar Banco */

create table /*Nome da Tabela*/(
    /*Inserir o Dados da Tabela*/
    /*Inserir o Dados da Tabela*/
    /*Inserir o Dados da Tabela*/
    /*Inserir o Dados da Tabela*/
);

/*Formas de inserir dados na tabela */

insert into c(nome da Tabela) values (...) /*Informar os proprios dados na ordem que a tabela foi criada e é preciso ter a exata quantidade de itens.*/;
insert into (...)/*Os atributos do dado (nome, idade, CPF...*/ (nome da tabela) values (...) /*Os proprios dados sempre na ordem que foi escrita os atributos (Joao, 25, 87244116308... */;


show ;/*Esse comando permite ver algo de forma geral ( show tables (ver quais as tabelas já foram criadas noo BD que esta conectado) show databases (ver os BD que já foram criados) */
desc ;/*(nome da tabela)  ver a estrutura da tabela */


/*Comando Select
Utilizado para fazer uma projeção. quando o usuario quer ver alguam informaçao ou retorno*/
select (oq vai ser projetado) from (de qual tabela); 
/*Exp.: Select nome, sexo, email from cliente; */
/*Quando usado o * irar ser trazido tudo que tem na tabela*/
/* Exp.: Select * From cliente; */

Select NOW 
/*Select NOW () Mosta a data e hora no momento que foi feito essa consulta*/

AS 
/* são chamadas de ALIAS são apelidos temporários atribuídos a tabelas
ou colunas em uma consulta*/

/*FILTRO */ 
WHERE
/* o comando WHERE funciona como um filtro na hora de trazer a informaçao 
(EXP.: "eu só quero as mulheres dessa BD" 
select ....
from ...
WHERE sexo = 'Mulher'; )*/

LIKE 
/*O 'LIKE' trabalha como um coringa e juntamente com o '%' que servo como "Qualquer coisa "
(Exp.: 'Quero todos os endereços da BA' 
select...
from...
WHERE endereço like '%BA';*/


/*Operadores Logicos */ 
        OR e AND
/*OR = para a condição retornar, é preciso que apenas UMA condição seja verdadeira
AND = para a condição retornar, é preciso que TODAS as dondições sejam verdadeiras
(Exp.: 'Eu quero todos os homens que fique no setor da cozinha'
select... 
from...
WHERE sexo = 'homem' and setor = 'cozinha' ; )*/


COUNT(*)
/*O comando COUNT (*) Irar contar quantos registos tem dentro da Tabela 
Pode ser combinada com um Quesito tambem, vai trazer a primeira linha encontrada do quesito selecionado
'Quero saber quantos funcionarios homens tem na empresa'
select sexo, COUNT(*)
from... ;

select sexo, COUNT(*) as "Quant de Homens"
from... ;*/


Group by
/*'Quero saber quantos funcionarios e quantos são homens e quantos são mulheres'
select sexo, count(*) as 'Quant. por Genero'
from funcionarios
GROUP BY sexo;*/


/*VALORES NULOS 
Quando quer trazer os valores Nulos de um atribulo da tabela
select (os atributos)
from (a tabela)
where (o atributo que deseja trazer ) is null*/

/*Caso queira trazer os que estão preenchidos 
select (os atributos)
from (a tabela)
where (o atributo que deseja trazer ) is NOT null*/

/*dessa forma todos os registros serão atualizados, não só o dono do email */ 
update cliente 
set email = 'lilian@hotmail.com';

/* WHERE pode ser usado juntamente com o UPDATE ou com o DELETE */ 
update cliente 
set email = 'lilian@hotmail.com'
where nome ='lilian';


delete from cliente; /*deleta TODA a tabela*/

delete from cliente
where Nome = 'Ana';
/*é bom olhar o select Count(*) from... ;, sempre que deletar tem que ser a quantidade total - a que foi removida
exp.:   totais 6 removidos 1
        sobrados 5 
Antes de fazer um DELETE, troque o "Delete" por "Select * " para garantir que sairar certo */

/*olha apenas o registo de 1 usuario*/
select count(*) from cliente
where nome = 'Ana';

/*APAGAR TABELA */
drop table ...

/*As ligação de tabels são feitas com o comando ( CONSTRAINT )*/ 



/*PRIMEIRA FORMA NORMAL

01 - Todo Campo vetorizado se tornara outra tabela

02 - Todo Campo Multivalorado se tornanra outra Tabela ou quando o campo for divisivel

03 - Toda Tabela Necessita de pelo menos um Campo que identifique todo o registro com send UNICO (chave primaria) 
Chave Natural - Algo que te Pertence (CPF)
Chava Artificial - algo que é criado (ID) */


/*Chave Estrengeira é a chave primaria de uma tabela que vai até outra tabela fazer referencia entre registros

Em relacioamento 1 x 1 a Chave estrangeira fica na Tabela mais Fraca

Em Relacionamento 1 x n a chave estrangeira ficara sempre na Cardinalidade N*/



/*Projeção = Tudo que voce quer ver na Tela (Select * from ...; )*/
/*Seleção = É filtrar e trazer um Subconjunto de um Conjunto total (... Where ) */ 
/* Junção = É juntar duas tabelas para uma Seleção */ 

/* Junta duas tabelas e iguala, se tiver um cliente que n estar na outra tabela ele n irar aparecer */

select nome, sexo, barrio, cidade/* seleciona oq vai ser projetado */
from cliente /* onde vai ser encontrado */
/* caso a projeções usa tabelas diferentes */

Inner Join endereço /*use o 'Inner Joir' para informar qual tabela estar a outra informaçao */ 
on IdCliente = ID_Cliente; /*e o 'on' (onde) as chaves tem que se igualar */



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


/*Criando uma VIEW */
create View V_Jogadores as /*Selecione o nome da View ela irao aparecer no "Show tables", por isso é importante diferenciar ela de outras tabelas */
select nome, estado /*O que voce quer trazer da tabela*/
from jogadores; /* Qual a tabelas */


/* Caso queira fazer um relatorio com mais de uma tabela vinculada: */

create view V_Relatorio as  ------------ /*Selecionar o nome da View */
select C.nome, C.sexo, 
    IFNULL(C.Email, '***********' ) as 'E-mail', 
    T.Numero, T.Tipo, 
    E.Barrio, E.Cidade, E.Estado   ----- /* Oque ira trazer de todas as tabelas */
from cliente C   ----------------------- /*A tabela Princiapal */
    inner join Telefone T   ------------ /* As outras tabelas */  
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente ; 

        -- Estrutura Base de INNER JOIN
select 
from
    inner join 
        on ;      
/*não é possivel utilizar comandos de INSERT nem de DELETE quando um view tem JOIN (mas é possivel utilizar o UPDATE e WHERE) 
e TAMBEM altera na PROPRIA TABELA */

drop view Nome da view; /* Para deletar uma view */

DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTRAOL LANGUAGE


/*Ordenar com Join*/


select * from V_Relatorio
order by 1;


/* DELIMITER / DELIMITADOR - O delimitador vem de forma padrao como ";" mas é possivel mudar*/
DELIMITER $

-- PROCUDURES  
DELIMITER $

create Procedure Nome ()
begin  ------ começo
    qualquer programaçao; --- Alterar o Delimiter é necessario para que o banco não termine a leitura antes do fim

end    ------- fim
$
Delimiter ;

Delimiter & 
create procedure Consul_Curso(P_IDCurso int)
begin
    select Nome, valor
    from cursos
    where iDCurso = P_IDCurso;
end
&

Delimiter ;
