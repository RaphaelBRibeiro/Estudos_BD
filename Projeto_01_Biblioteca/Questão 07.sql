/*Quantos livros já foram devolvidos?*/

select count(*) AS Livros_Devolvidos
from Emprestimos
where estado = 'Devolvido';



