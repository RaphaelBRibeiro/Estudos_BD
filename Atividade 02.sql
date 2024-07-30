create database exercicio01;

use exercicio01;

create table funcionarios (
    idFuncionario integer,
    nome varchar (100),
    email varchar (200),
    sexo varchar (10),
    departamento varchar (100),
    admissao varchar (10),
    salario integer,
    cargo varchar (100),
    idRegiao int
);

/* essa função serve para ser quantos funcionarios tem por departamento. 
Assim podendo definir qual vai ser a primeira a ser puxada (priferencialmente a maior com o OR com o AND o menor) já que estamos trabalhando com OR.  */
select count(*), departamento  
from funcionarios 
group by departamento
order by 1;

            /*QUESTAO 01*/ 
/*Traga os funcionarios que trabalhem no departamento de filmes OU no departamento de Roupas*/           
select nome, sexo, departamento
from funcionarios
where departamento = 'filmes' or departamento = 'roupas'; 


            /*QUETAO 02*/
/*O gestor de Marketing pediu a lista das funcionarias que trabalham no departamento de Filmes  ou no Departamento de lar.
Ele necessita enviar um email para as colaboradoras desses dois setores*/           
select nome, sexo, departamento, idFuncionario, email
from funcionarios
where (departamento = 'lar' and sexo = 'feminino')
or (departamento = ' filmes' and sexo = 'feminino');


            /*QUETAO 03*/
/*Traga os funcionarios do sexo Masculino ou Funcionarios que trabalhem no Jardim*/
select nome, sexo, departamento
from funcionarios
where sexo = 'Masculino' or departamento = 'jardim';
