--operadores ariméticos +,-,*,/,^,%

-- ex criação de coluna calculada
--crie uma coluna contendo a idade do cliente da tabel a sales.customers

select *
from sales.customers
limit 10

select email,birth_date, (current_date - birth_date) / 365 as "idade do cliente" --current_date função serve para calcular a data de hoje
from sales.customers											--"" aspas duplas server para nomear o nome das tabelas, só serve para nomear.
order by birth_date
limit 10

--ex 2 Utilizando a coluna calculadas nas queries, liste os 10 cliente mais novos da tabela customers

select birth_date,email, first_name,(current_date - birth_date) /365 as "idade do cliente"
from sales.customers
order by "idade do cliente" 
limit 10

--ex 3 crie uma coluna calculada com string
--crie a coluna "nome_completo" contendo o nome completo do cliente

select first_name || ' ' || last_name as "nome completo" -- || esse operador faz a soma de strings, deve-se colocar os abrindo e fechando || '' || e aspas simples
from sales.customers				-- as serve para dar nome a uma nova coluna

-- operadores de comparação,servem para comparar dois valores retornando true e false
-- tipos =, >, <, >=, =<, <>

--ex 1 crie uma coluna que retorne true sempre que um cliente for profissional clt

select customer_id,first_name,professional_status,
(professional_status = 'clt')as cliente_clt -- () serve para criar uma comparação, no caso foi utilizado a comparação na tabela professional_status para retornar caso o cliente seja clt ou não.
from sales.customers
order by "cliente_clt" desc

--operadores para unir expressões simples em compostas
--and,or,not,between,in,like,ilike,,is null

--ex uso do comando between
--selecione veiculos que custam entre 100k e 200k na tabeça products

select *
from sales.products
where price >= 100000 and price <= 200000

select *
from sales.products
where price between 100000 and 200000 --between serve para filtrar de maneira mais simples na hora de buscar

--ex 2 uso do comando not
-- selecione veiculos que custam abaixo de 100k ou acima de 200k

select *
from sales.products
where price < 100000 or price > 200000

select *
from sales.products
where price not between 100000 and 200000 -- comando not pode ser usado junto com o comando between e com outros 

--ex 3 uso do comando IN
-- selecionar prodtuos que sejam da marca honda, toyota ou renault

select *
from sales.products
where brand = 'HONDA' or brand = 'TOYOTA' OR brand = 'RENAULT'

select *
from sales.products
where brand in  ('HONDA','TOYOTA','RENAULT')-- comando IN serve para procurar, tudo aquilo que está na seleção () entre paranteses

select *
from sales.products
where brand not in  ('HONDA','TOYOTA','RENAULT') -- comando not usado junto com outro operador

--ex 4 uso do like (matchs imperfeitos)
-- selecione os primeiros nomes distintos da tabela customers que começam com as iniciais ANA

select distinct first_name
from sales.customers
where first_name like 'ANA%' -- like serve para filtrar tudo que começa com a palavra que você colocou dentro das aspas junto
-- com o percentual %, indica ao SQL que toda string que vem antes do % eles irá filtrar. Ex ANA%, tudo que começar com ANA ele irá filtrar 

select distinct first_name
from sales.customers
where first_name like '%ANA' -- com o percentual antes da palavra, indica que antes da palavra, pode ter qualquer sequencia de caracteres, ele irá fazer um filtro em tudo que
--terminar com a string que você colocou no final

--ex 5 
-- comando ILIKE, ignora letras maiusculas e minusculas
--tem a mesma função do like com a % ex '%ANA'

select distinct first_name as "nomes com final ana" -- fiz uma tabela temporária com o comando as
from sales.customers
where first_name ilike '%ana' --comando ILIKE, ignora letras maiusculas e minusculas
-- mais utilizado para fazer buscar, sem precisar escrever minusculo ou maiusculo

--ex 6 comando IS NULL
--selecionar apenas as linhas que contém nulo no campo "population" na tabela
--temp_tables.regions

select *
from temp_tables.regions 

select *
from temp_tables.regions
where population is null-- quando estamos tratando de dados nulos, o comando que se utilizar 
--para saber se é igual a nulo é 'is'

--1 and: verifica se duas comparações são simultaneamente verdadeiras
--2 or: verifica se uma ou outra comparação é verdadeira
--3 between: verifica quais valores estão dentro do range difinido
--4 in: funiona com multiplos ORs
--5 LIKE e ILIKE: comparam textoos e são utilizados m conjunto com o operador %, que indica que 
--qualquer texto pode aparecer no lugar do campo
--6 ILIKE ignora se o campo tem letras maiusculas e minusculas
--7 IS NULL verifica se o campo é nulo


