/* DELIMITER / DELIMITADOR - O delimitador vem de forma padrao como ";" mas é possivel mudar*/
DELIMITER $

/* Stored Procedures - são blocos de programaçao que ficam armazenados no Banco */ 

/*Toda vez que alguem logar no banco trazer o nome da empresa */

DELIMITER $

create Procedure Nome ()
begin  ------ começo
    qualquer programaçao; --- Alterar o Delimiter é necessario para que o banco não termine a leitura antes do fim

end    ------- fim
$

create procedure Nome_Empresa()
begin  ------ começo
    select 'Universidade Newpop' as Empresa;  -------- procedimentos 

end    ------- fim
$

/*Chamando PROCEDURE */

call Nome_Empresa()$

delimiter ;

delimiter $
create procedure Conta(numero1 int, numero2 int) ----- quando for escrever a Procedure, indique os valores 
begin  ------ começo
    select numero1 + numero2 as conta; -------- procedimentos 

end  ------ começo
$
call conta (100, 50) $

drop procedure conta ;