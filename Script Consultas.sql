--1 - Buscar o nome e ano dos filmes
select Nome, Ano from Filmes
--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
select Nome, Ano from Filmes order by Ano
--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
select Nome, Ano, Duracao from Filmes where LOWER(Nome) = 'de volta para o futuro'
--4 - Buscar os filmes lançados em 1997
select Nome, Ano, Duracao from Filmes where Ano = 1997
--5 - Buscar os filmes lançados APÓS o ano 2000
select Nome, Ano, Duracao from Filmes where Ano > 2000
--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
select Nome, Ano, Duracao from Filmes where Duracao > 100 and Duracao < 150 order by Duracao
--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
select * from (select Ano, COUNT(*) as 'Quantidade' from Filmes group by Ano) as t1 order by 2 desc
--8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
select PrimeiroNome, UltimoNome from Atores where lower(Genero) = 'm'
--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
select PrimeiroNome, UltimoNome from Atores where lower(Genero) = 'f' order by PrimeiroNome
--10 - Buscar o nome do filme e o gênero
select t1.Nome, t3.Genero from Filmes as t1
inner join FilmesGenero as t2
on t1.Id = t2.IdFilme
inner join Generos as t3
on t3.Id = t2.IdGenero
--11 - Buscar o nome do filme e o gênero do tipo "Mistério"
select t1.Nome, t3.Genero from Filmes as t1
inner join FilmesGenero as t2
on t1.Id = t2.IdFilme
inner join Generos as t3
on t3.Id = t2.IdGenero
where t3.Genero = 'Mistério'
--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
select t1.Nome, t3.PrimeiroNome + ' ' + t3.UltimoNome as 'Ator', t2.Papel from Filmes as t1
inner join ElencoFilme as t2
on t1.Id = t2.IdFilme
inner join Atores as t3
on t2.IdAtor = t3.Id