/*COM ESSA BASE DE DADOS TRAGA OS DADOS DAS QUESTOS A SEGUIR */


/* CADASTRO DE CLIENTES */
insert into cliente values (null, 'Joao', 'M', 'joao@ig.com','9281429441');
insert into cliente values (null, 'Carlos', 'M', 'carlos@ig.com','43145677322');
insert into cliente values (null, 'Ana', 'F', 'ana@ig.com','76128736300');
insert into cliente values (null, 'Clara', 'F', null,'56248831963');
insert into cliente values (null, 'Jorge', 'M', 'jorge@ig.com','92731225661');
insert into cliente values (null, 'Celia', 'F', 'Celia@ig.com','71943824150');
INSERT INTO cliente VALUES (NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO cliente VALUES (NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO cliente VALUES (NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO cliente VALUES (NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO cliente VALUES (NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO cliente VALUES (NULL,'LORENA','M',NULL,'774557887');
INSERT INTO cliente VALUES (NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO cliente VALUES (NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO cliente VALUES (NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO cliente VALUES (NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO cliente VALUES (NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO cliente VALUES (NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO cliente VALUES (NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRO DE ENDERECO PARA OS CLIENTES */

insert into endereço values (null, 'Rua Capitao Hermes', 'Centro', 'Rio de Janeiro', 'RJ', 1);
insert into endereço values (null, 'Rua Pres Vargas','Jardins', 'Sao Paulo', 'SP', 3 );
insert into endereço values (null, 'Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ', 2 );
insert into endereço values (null, 'Rua do Ouvidor', 'Flamengo', 'Rio de Janeir', 'RJ',6);
insert into endereço values (null, 'Rua Urugauiana', 'Centro', 'Vitoria', 'ES',5);
INSERT INTO endereço VALUES (NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO endereço VALUES (NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO endereço VALUES (NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO endereço VALUES (NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO endereço VALUES (NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO endereço VALUES (NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO endereço VALUES (NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO endereço VALUES (NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO endereço VALUES (NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO endereço VALUES (NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO endereço VALUES (NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO endereço VALUES (NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO endereço VALUES (NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRO DE TELEFONES PARA OS CLIENTES */

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
INSERT INTO telefone VALUES (NULL,'RES','68976565',9);
INSERT INTO telefone VALUES (NULL,'CEL','99656675',9);
INSERT INTO telefone VALUES (NULL,'CEL','33567765',11);
INSERT INTO telefone VALUES (NULL,'CEL','88668786',11);
INSERT INTO telefone VALUES (NULL,'COM','55689654',11);
INSERT INTO telefone VALUES (NULL,'COM','88687979',12);
INSERT INTO telefone VALUES (NULL,'COM','88965676',13);
INSERT INTO telefone VALUES (NULL,'CEL','89966809',15);
INSERT INTO telefone VALUES (NULL,'COM','88679978',16);
INSERT INTO telefone VALUES (NULL,'CEL','99655768',17);
INSERT INTO telefone VALUES (NULL,'RES','89955665',18);
INSERT INTO telefone VALUES (NULL,'RES','77455786',19);
INSERT INTO telefone VALUES (NULL,'RES','89766554',19);
INSERT INTO telefone VALUES (NULL,'RES','77755785',20);
INSERT INTO telefone VALUES (NULL,'COM','44522578',20);


/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
desc cliente; 
desc endereço;
desc telefone;
select C.IdCliente, C.nome, C.sexo, C.email, C.CPF, 
    E.Rua, E.barrio, E.Cidade, E.Estado,
    Tipo, numero
from cliente C
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente
    inner join Telefone T 
        on C.IdCliente = T.ID_Cliente;


/* RELATORIO DE HOMENS */
select C.IdCliente, C.nome, C.sexo, C.email, C.CPF,
    E.Cidade, E.Estado,
    T.Tipo, T.Numero
from cliente C
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente
    inner join Telefone T
        on C.IdCliente = T.ID_Cliente
where sexo = 'M';

select * 
from cliente 
where IdCliente in (12, 13, 18 ,19);

update cliente
set sexo = 'F'
where IdCliente in (12, 13, 18, 19);

/* RELATORIO DE MULHERES */
select C.IdCliente, C.nome, C.sexo, C.email, C.CPF,
        E.Cidade, E.Estado,
        T.Tipo, T.Numero
from cliente C
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente
    inner join Telefone T 
        on C.IdCliente = T.ID_Cliente
where sexo = 'F';

update cliente
set sexo = 'M'
where IdCliente in (16);


/* QUANTIDADE DE HOMENS E MULHERES */
select count(*) as Quantidade, sexo
from cliente
GROUP by sexo;


/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */
select C.IdCliente, C.email, C.sexo,
    E.Barrio, E.Estado
from cliente C
    inner join endereço E
        on C.IdCliente = E.ID_Cliente
    inner join telefone T
        on C.IdCliente = T.ID_Cliente
where sexo = 'F'
    and barrio = 'Centro' and estado = 'RJ'
    and (tipo = 'res' or tipo = 'Com' );



/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
select C.nome, C.email, 
    T.Numero, T.tipo,
    E.Estado, E.Cidade
from cliente C
    inner join telefone T
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente
where tipo = 'Cel'
    and Estado = 'RJ';   

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
select C.nome, C.email, Sexo,
    T.Numero as Celular,
    E.Estado
from cliente C
    inner join Telefone T
        on C.IdCliente = T.ID_Cliente
    inner join Endereço E
        on C.IdCliente = E.ID_Cliente
where sexo = 'F'
    and tipo = 'Cel'
    and estado = 'SP';