drop * database AVALIAÇão1;
create database if not exists Avaliação1;
use Avaliação1;

CREATE TABLE CATEGORIA(
IDCATEGORIA INT, 
DESCRICAO varchar(45),
primary key (IDCATEGORIA));

create table FILME(
IDFILME INT, 
DESCRICAO VARCHAR(45), 
DATALANCAMENTO DATE,
IDCATEGORIA INT NOT NULL, 
primary key (IDFILME),
foreign key(IDCATEGORIA)REFERENCES CATEGORIA(IDCATEGORIA));

CREATE TABLE COMENTARISTA(
IDCOMENTARISTA INT, 
NOME VARCHAR(45),
CELULAR INT, 
SEXO CHAR (1), 
DATANASC DATE, 
SALARIO DECIMAL(7,2), 
primary key (IDCOMENTARISTA));

CREATE TABLE CRITICA(
IDCRITICA INT, 
DESCRICAO VARCHAR(45), 
DATA DATE, 
CLASSIFICACAO INT, 
IDCOMENTARISTA INT, 
IDFILME INT, 
primary key (IDCRITICA), 
foreign key (IDCOMENTARISTA) REFERENCES COMENTARISTA(IDCOMENTARISTA),
foreign key (IDFILME) REFERENCES FILME(IDFILME));

INSERT INTO CATEGORIA VALUES
(1, 'DRAMA'), (2, 'AÇÃO'), (3, 'DOCUMENTARIO'), (4, 'ECONOMIA'), (5, 'MUSICAL'), (6, 'ROMANCE');




INSERT INTO COMENTARISTA VALUES
(1, 'Ruy Castro',  121212, 'M', '1956-06-06', 8590.00), 
(2, 'Luís Felipe Pondé', 444444, 'M', '1960-08-26', 5600.00),
(3, 'Sylvia Colombo', 88888, 'F', '1964-09-09', 3908.00 ),
(4, 'Alexa Salomão', 567890, 'F', '1972-07-27', 4500.00 );

INSERT INTO FILME VALUES
(1, 'Animais Fantásticos: Os Crimes de Grindelwald', '2018-11-15', 4),
(2, 'O Grinch', '2018-11-08', 4),
(3, 'Bohemian Rhapsody', '2018-11-01', 1),
(4, 'Millennium: A Garota na Teia de Aranha', '2018-10-15', 1), 
(5, 'Tudo por um Popstar', '2017-11-08', 6),
(6, 'Chacrinha - O Velho Guerreiro', '2018-08-01', 1);

INSERT INTO CRITICA VALUES
(1, 'Da primei.', '2018-11-14', 3, 1, 1),
(2,  'Biografia Fredie Mercury', '2018-11-19', 4, 2, 3),
(3,  'Biografia Fredie Mercury', '2018-11-18', 5, 3, 3),
(4, 'A Garota na Teia a', '2018-11-20', 4, 3, 4);

select idcomentarista,count(idcritica)
from critica
GROUP by idcomentarista;

 alter table comentarista drop column celular;
 DESC COMENTARISTA;
 
 
insert into categoria (descricao) values ('Terror');
insert into filme values (null, 'Parque do Inferno',  curdate(),7);

 insert into critica values  (6,'  Biografia Fredie Mercury',  '2023-10-19',4,5,3);
 
 
select nome, salario
from comentarista
order by salario desc
limit 2;

select c.idfilme, idcritica  , f.descricao,  c.descricao, c.data
from critica c inner join filme f
on f.idfilme = c.idfilme 
and month(curdate())=month(dataCritica)
order by dataCritica asc;

select c.idCritica, c.descricao, t.idcomentarista, t.nome, t.sexo
from critica c inner join comentarista t
on c.idcomentarista = t.idcomentarista
where idFilme=1;

select format(avg(salario),2) 'media' 
    from comentarista
    where sexo="M" ;
    
    
select format(avg(salario),2)  
    from comentarista
    on sexo="M" ;
    
    
select format(avg(salario),2) 'media' 
    from comentarista
    where sexo="M" ;
    
    select c.descricao, f.descricao,f.datalancamento
 from categoria c left join filme f
 on c.idCATEGORIA=f.idCATEGORIA
 order by 2;
 
 
delete from critica where idcomentarista=3;
select * from critica;

drop from critica where idcomentarista=4;