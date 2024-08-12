/* PROCEDURES */
create database projeto;
use projeto;

create table Cursos (
    iDCurso int primary key Auto_Increment,
    Nome varchar (30) Not Null,
    Horas int (3) not null,
    valor float (10,2) not null
);

insert into Cursos values (null,'Java', 30, 500.00);
insert into Cursos values (null, 'Fundamento de Banco de Dados', 40, 700.00);

Delimiter #

create procedure Cad_Curso(P_nome varchar(30), P_horas int (3), P_valor float (10,2))

begin
    insert into Cursos values (null, P_nome, P_horas, P_valor);

end
#

Delimiter ;

call Cad_Curso ('BI SQL Server', 35, 3000.00);
call Cad_Curso ('Power BI', 20, 1000.00);
call Cad_Curso ('Tableau', 30, 1200.00);

-- entrar com mais dados com procedures e criar uma procedures para consultar cursos

call Cad_Curso ('Logica de Programacao', 40, 1500.00);
call Cad_Curso ('Rede de Computadores', 30, 1500.00);
call Cad_Curso ('Desenvovimento Python ', 45, 300.00);


Delimiter & 
create procedure Consul_Curso(P_IDCurso int)
begin
    select Nome, valor
    from cursos
    where iDCurso = P_IDCurso;
end
&

Delimiter ;

call Consul_Curso (5);