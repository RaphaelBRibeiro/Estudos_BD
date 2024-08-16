-- QUESTAO 02 

create database Universidade;
use Universidade;

-- Criacao de tabelas
create table Alunos (
    MAT int primary key,
    nome Varchar (30),
    Endereco varchar (30),
    Cidade Varchar (30)
);

create table diciplina (
    Cod_Disc varchar (5) primary key,
    nome_disc varchar (30),
    carga_hora varchar (5)
);

create table Professor (
    Cod_Prof int primary key,
    Nome varchar (30),
    Endereco varchar (30),
    Cidade varchar (30)
);

create table Turma (
    Cod_Turma int primary key,
    Cod_Disc varchar (5),
    Cod_Prof int, 
    Ano int,
    horario varchar (20),
    foreign key (Cod_Disc) references diciplina (Cod_Disc),
    foreign key (Cod_Prof) references Professor (Cod_Prof)
);

CREATE TABLE Historico (
    MAT INT,
    Cod_Disc VARCHAR(5),
    Cod_Turma INT,
    Cod_Prof INT,
    Ano INT,
    Frequencia INT,
    Nota INT,
    PRIMARY KEY (MAT, Cod_Disc, Cod_Turma),
    FOREIGN KEY (MAT) REFERENCES Alunos (MAT),
    FOREIGN KEY (Cod_Disc) REFERENCES diciplina (Cod_Disc),
    FOREIGN KEY (Cod_Turma) REFERENCES Turma (Cod_Turma),
    FOREIGN KEY (Cod_Prof) REFERENCES Professor (Cod_Prof)
);



-- CRINANDO PROCEDURES
Delimiter &
create procedure Cadastro_Alunos (P_Mat int, P_nome varchar (30), P_Endereco varchar (30), P_Cidade (30))
    begin 
        insert into Alunos Values (P_Mat, P_Nome, P_Endereco, P_Cidade);
    end 
&
Delimiter ;


Delimiter &
create procedure Cadastro_Diciplinas (P_Cod_Disc varchar (5), P_Nome_Disc varchar (30), P_Carga_Hora varchar (5))
    begin 
        insert into diciplina Values (P_Cod_Disc, P_Nome_Disc, P_Carga_Hora);
    end 
&
Delimiter ;


Delimiter &
create procedure Cadastro_Professor (P_Cod_Prof int, P_Nome varchar (30), P_Endereco varchar (30), P_cidade varchar (30))
    begin 
        insert into Professor values (P_Cod_Prof, P_Nome, P_Endereco, P_cidade);
    end
&
Delimiter ;


Delimiter &
create procedure Cadastro_Turma (P_Cod_Turma int, P_Cod_Disc varchar (5), P_Cod_Prof int, P_Ano int, P_horario varchar (20))
begin 
    insert into Turma values (P_Cod_Turma, P_Cod_Disc, P_Cod_Prof, P_Ano, P_horario);
end
&
Delimiter ;

/*FALTA TABELA HISTORICO*/


-- INSERINDO DADOS
call Cadastro_Alunos (2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL');
call Cadastro_Alunos (2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');
call Cadastro_Alunos (2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE' );
call Cadastro_Alunos (2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA');
call Cadastro_Alunos (2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
call Cadastro_Alunos (2015010106, 'JOSUÉLISSON', 'CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
call Cadastro_Alunos (2015010107, 'ANA SOUZA', 'RUA DAS FLORES', 'SÃO PAULO');
call Cadastro_Alunos (2015010108, 'CARLOS PEREIRA','AVENIDA BEIRA MAR', 'FORTALEZA');
call Cadastro_Alunos (2015010109, 'FERNANDA SILVA', 'RUA DO SOL', 'RECIFE');
call Cadastro_Alunos (2015010111, 'JOÃO COSTA', 'RUA DAS PALMEIRAS', 'CURITIBA');


call Cadastro_Diciplinas ('BD', 'BANCO DE DADOS', '100');
call Cadastro_Diciplinas ('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', '100');
call Cadastro_Diciplinas ('WEB', 'AUTORIA WEB', '50');
call Cadastro_Diciplinas ('ENG', 'ENGENHARIA DE SOFTWARE', '80');


call Cadastro_Professor (212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA');
call Cadastro_Professor (122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');
call Cadastro_Professor (192011, 'DIEGO OLIVEIRA',	'AVENIDA ROBERTO FREIRE',	'NATAL');


call Cadastro_Turma (1, 'BD', 212131, 2015, '11h_12h');
call Cadastro_Turma (2, 'BD', 212131, 2015, '13h_14h');
call Cadastro_Turma (1, 'POO', 192011, 2015, '08h-09h');
call Cadastro_Turma (1, 'WEB', 192011, 2015, '07h_08h');
call Cadastro_Turma (1, 'ENG', 122135, 2015, '10h_11h');
call Cadastro_Turma (2, 'ENG', 122135, 2015, '09h_10h');