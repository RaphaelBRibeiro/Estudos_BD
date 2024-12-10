/*Quem são os usuários que têm empréstimos pendentes?*/

select U.idUsuarios, U.Nome, E.estado
from Usuarios U
    inner join Emprestimos E
        on U.idUsuarios = E.ID_Usuario
where estado = 'Pendente';