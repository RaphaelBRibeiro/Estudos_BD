create database projeto; 

use Projeto;

create table cliente (
    nome varchar (30),
    sexo char (1),
    email varchar (30),
    cpf int (11),
    telefone varchar (30),
    endereço varchar (100)
);

insert into cliente values ('Joao','M','joao@gmail.com',988638273,'22923110','Maia Lacerda - Estacio - Rio de Janeiro - RJ');
insert into cliente values ('Celia','F',"celia@gmail.com",541521456,'25078869','Riachuelo - Centro - Rio de Janeiro - RJ');


insert into cliente (nome, sexo, cpf, telefone, endereço) values ('Jorge','M',885755896,'58748895','Oscar Cury - Bom Retiro - Patos de Minas - MG');
insert into cliente (nome, sexo, endereço, telefone, cpf) values ('Lilian','F','Senador Soares - Tijuca - Rio de Janeiro - RJ','947785696', 887774856);


insert into cliente values ('Ana','F','Ana@gmail.com',85548962,'548556985','Pres Antonio  Centro - Sao Paulo - SP'),
    ('Carla','F','Carla@gmail.com.br',77455828,'66587458', 'Samuel Silva - Centro - Belo Horizonte  MG');


Select nome, sexo, email from cliente;
Select nome, sexo, endereço, email from cliente;

Select * From cliente;


select nome, sexo from cliente
where endereço like 'MG'; 

/*Atualizando registros da tabela */ 
select nome, email
from cliente;

update cliente 
set email = 'lilian@hotmail.com'
where nome ='lilian';

/*Deletar registro da tabela */

delete from cliente
where Nome = 'Ana';

select count(*) from cliente
where nome = 'Ana';

insert into cliente values ('Joana', 'F','J.Lopez@Uol.com', 813983345,'81655218914',
'Rua copper leaf - Williamsburg  Kitchener');

update cliente 
set nome = 'Carla'
Where nome = 'Joana';

select * from cliente 
where nome = 'Carla'
And email like 'Carla@%';

delete from cliente 
where nome = 'Carla'
And email like 'Carla@%';

update cliente 
set email = 'C.Lopez@Uol.com'
where email = 'J.Lopez@Uol.com';

update cliente
set telefone = 978665434
where nome = 'Joao';