/*Encontre os títulos e autores dos livros emprestados.*/

select L.Titulo, L.Autor, E.estado 
from Livros L
    inner join Emprestimos E
      on L.idLivro = E.ID_Livro
where estado = 'Pendente';