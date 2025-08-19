-- Creación squema y tablas

CREATE DATABASE Pokeproject;
USE Pokeproject;


CREATE TABLE pokeDB (
   pokemon_id int primary key,	
   name VARCHAR(30),	
   primary_type VARCHAR(30),
   secondary_type VARCHAR(30),
   first_appreance VARCHAR(30),
   generation VARCHAR(30),
   category VARCHAR(30),
   total_base_stats int,
   hp int,	
   attack int,
   defense int,
   special_attack int,
   special_defense int,
   speed int
);






SELECT * FROM pokeDB;

### Nivel Básico
-- 1. Listar todos los Pokémon con su tipo primario y secundario.
SELECT name, primary_type, secondary_type FROM pokeDB;


-- 2. Mostrar todos los Pokémon ordenados por `total_base_stats` de mayor a menor.
SELECT * FROM pokeDB
order by total_base_stats DESC;

SELECT name, total_base_stats FROM pokeDB
order by total_base_stats DESC;


-- 3. Filtrar Pokémon por tipo secundario específico.
SELECT  DISTINCT(secondary_type) as Second_type FROM pokeDB;


SELECT name, secondary_type FROM pokeDB
WHERE secondary_type = "fairy";


SELECT name, secondary_type FROM pokeDB
WHERE secondary_type = "dragon";


-- 4. Contar cuántos Pokémon hay por `primary_type`.

SELECT upper(), COUNT(primary_type) number_of_pokemon FROM pokeDB
group by primary_type
ORDER BY number_of_pokemon DESC;


### Nivel Intermedio
-- 1. Promedio de `attack` y `defense` por tipo primario.
SELECT primary_type, round(AVG(attack),2)as Promedio_ataque, round(AVG(defense),2) as Promedio_defensa FROM pokeDB
GROUP BY primary_type;

-- 2. Pokémon más rápido (`speed`) de cada generación.

-- MEDIANTE SUBCONSULTAS y JOINS

select p.generation, p.name,  p.speed from pokeDB as p
JOIN (SELECT generation, MAX(speed) as max_speed FROM  pokeDB
GROUP BY  generation
) AS vm
ON p.generation = vm.generation
AND p.speed = vm.max_speed
ORDER BY p.generation;


-- USANDO RANK(), subconsultas y filtro

SELECT generation, name, speed 
FROM(
SELECT generation, name, speed, Rank() OVER(partition by generation ORDER BY speed DESC) AS ranked_speed
FROM pokeDB
) as ranked
WHERE ranked_speed = 1
ORDER BY generation;


-- 2b. Pokémon con mayor attack en cada tipo primario

-- SUBCONSULTAS

SELECT p.primary_type, p.name, p.attack FROM pokeDB as p

JOIN
(SELECT primary_type, MAX(attack) as max_attack FROM pokeDB
GROUP BY primary_type) AS ma
ON p.primary_type = ma.primary_type
AND p.attack = ma.max_attack 
ORDER BY p.attack DESC
;


-- RANK() 
SELECT primary_type, name, attack 
FROM(
SELECT primary_type, name, attack, RANK() OVER(PARTITION BY primary_type ORDER BY attack DESC) AS ranked_attack
FROM pokeDB) AS r
WHERE r.ranked_attack = 1
ORDER BY r.attack DESC;



-- 3. Top 10 Pokémon con mayor `special_attack`.

SELECT name, special_attack FROM(
SELECT name, special_attack, DENSE_RANK() OVER(ORDER BY special_attack DESC) FROM pokeDB
limit 10) AS top_ten;



SELECT name, special_attack FROM pokeDB
ORDER BY special_attack DESC
limit 10;



-- 4. Cantidad de Pokémon sin tipo secundario.
SELECT pokemon_id, name, secondary_type FROM pokeDB
WHERE secondary_type = "";
 

SELECT count(pokemon_id) as number_whit_no_secondary_type FROM pokeDB
WHERE secondary_type = "";

-- 5. Distribución de Pokémon por generación.
SELECT generation, COUNT(generation) as number_of_pokemon_by_generation FROM  pokeDB
group by generation;


### Nivel Avanzado ######################################### †


-- 1. Tipos primarios cuyo promedio de `total_base_stats` es mayor a 500.

SELECT primary_type, AVG(total_base_stats) as mean FROM pokeDB
GROUP BY primary_type
HAVING mean > 500;


SELECT primary_type, round(AVG(total_base_stats),1) as mean FROM pokeDB
GROUP BY primary_type
HAVING mean > 400;

SELECT primary_type, round(AVG(total_base_stats),1) as mean FROM pokeDB
GROUP BY primary_type
HAVING mean <400;

-- 2. Pokémon más fuerte de cada generación (subconsulta).
SELECT name, generation, attack FROM(
SELECT name, generation, attack, DENSE_RANK() OVER (PARTITION BY generation ORDER BY attack DESC) as rank_strong FROM pokeDB) as r
WHERE r.rank_strong = 1;


-- 3. Comparación de promedios de ataque y defensa entre Pokémon con y sin tipo secundario.
-- 4. Clasificación de Pokémon por rango de poder usando `CASE`.
-- 5. Ranking de Pokémon por velocidad dentro de cada tipo primario (`RANK()`).



