/*Calcule o número de empréstimos pendentes por usuário.*/

SELECT U.Nome, COUNT(*) AS Emprestimos_Pendentes
FROM Usuarios U
JOIN Emprestimos e ON U.idUsuarios = E.id_Usuario
WHERE E.Estado = 'Pendente'
GROUP BY U.Nome;