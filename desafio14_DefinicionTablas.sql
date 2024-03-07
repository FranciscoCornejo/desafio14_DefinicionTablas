-- 1. Crear una base de datos llamada películas. (1 Punto)
CREATE DATABASE peliculas;



--2. Cargar ambos archivos a su tabla correspondiente y aplicar el truncado de estas. (1 Punto)
/*	Paso a Paso: peliculas */
CREATE TABLE peliculas (id INT PRIMARY KEY, Pelicula VARCHAR(100) NOT NULL, Ano_estreno INT NOT NULL, Director VARCHAR(100) NOT NULL);
/*
- se crea la bd peliculas y la tabla peliculas
-	click a la bd pelicula > click schemas > click tables > click derecho tabla peliculas > Import/Export Data 
 	> file name: ruta o path del csv | enconding: UTF-8  > click submenu opcions > header: ON
	> click columns > columns to imports: id, Pelicula, Ano_estreno, Director | NOT NULL COLUMNS: id, Pelicula, Ano_estreno, Director
	> click save
*/
SELECT * 
FROM peliculas;

/*	Paso a Paso: reparto */
CREATE TABLE reparto (pelicula_id INT, Actor VARCHAR(100) NOT NULL, FOREIGN KEY (pelicula_id) REFERENCES peliculas(id));
/*
- se crea la bd peliculas la tabla reparto
-	click a la bd pelicula > click schemas > click tables > click derecho tabla peliculas > Import/Export Data 
 	> file name: ruta o path del csv | enconding: UTF-8  > click submenu opcions > header: OFF este csv no tiene cabecera
	> click columns > columns to imports:  | NOT NULL COLUMNS: Actor
	> click save
*/
SELECT * 
FROM reparto;


--3. Obtener el ID de la película “Titanic”. (1 Punto)
SELECT id 
FROM peliculas 
WHERE Pelicula = 'Titanic';
--respuesta: 2



--4. Listar a todos los actores que aparecen en la película "Titanic". (1 Punto)
SELECT Actor 
FROM reparto 
WHERE pelicula_id = 
(
	SELECT id FROM peliculas 
	WHERE Pelicula = 'Titanic'
);
/*
respuesta:
"Leonardo DiCaprio"
"Kate Winslet"
"Billy Zane"
"Kathy Bates"
"Frances Fisher"
"Bernard Hill"
"Jonathan Hyde"
"Danny Nucci"
"David Warner"
"Bill Paxton"
"Gloria Stuart"
"Victor Garber"
"Suzy Amis"
*/



--5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
SELECT peliculas.id AS pelicula_id, peliculas.Pelicula, COUNT(*) AS cantidad_apariciones
FROM reparto
JOIN peliculas ON reparto.pelicula_id = peliculas.id
WHERE reparto.Actor = 'Harrison Ford'
GROUP BY peliculas.id, peliculas.Pelicula
ORDER BY peliculas.id;
/*
respuesta:
48	"Star Wars. Episodio IV: Una nueva esperanza"	1
59	"Indiana Jones y la última cruzada"	1
63	"En busca del arca perdida"	1
67	"Star Wars. Episodio V: El imperio contraataca"	1
69	"Star Wars. Episodio VI: El retorno del Jedi"	1
87	"Blade Runner"	1
88	"Apocalypse Now"	1
97	"Indiana Jones y el templo maldito"	1
*/



--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)
SELECT * FROM peliculas 
WHERE Ano_estreno BETWEEN 1990 AND 1999 
ORDER BY Pelicula ASC;
/*
respuesta:
76	"American Beauty"	1999	"Sam Mendes"
20	"American History X"	1998	"Tony Kaye"
9	"Braveheart"	1995	"Mel Gibson"
7	"Cadena perpetua"	1994	"Frank Darabont"
12	"Eduardo Manostijeras"	1990	"Tim Burton"
27	"El club de la pelea"	1999	"David Fincher"
68	"El Padrino. Parte III"	1990	"Francis Ford Coppola"
75	"El profesional"	1994	"Luc Besson"
22	"El sexto sentido"	1999	"M. Night Shyamalan"
45	"El show de Truman"	1998	"Peter Weir"
25	"El silencio de los corderos"	1991	"Jonathan Demme"
61	"Entrevista con el vampiro"	1994	"Neil Jordan"
1	"Forest Gump"	1994	"Robert Zemeckis"
42	"Hombres de negro"	1997	"Barry Sonnenfeld"
10	"La lista de Schindler"	1993	"Steven Spielberg"
31	"La milla verde"	1999	"Frank Darabont"
30	"Matrix"	1999	"Andy y Lana Wachowski"
89	"Mejor... imposible"	1997	"James L. Brooks"
29	"Parque Jurásico"	1993	"Steven Spielberg"
47	"Pesadilla antes de navidad"	1993	"Henry Selick"
23	"Pulp Fiction"	1994	"Quentin Tarantino"
14	"Salvar al soldado Ryan"	1998	"Steven Spielberg"
39	"Seven"	1995	"David Fincher"
86	"Star Wars. Episodio I: La amenaza fantasma"	1999	"George Lucas"
40	"Terminator 2: el juicio final"	1991	"James Cameron"
2	"Titanic"	1997	"James Cameron"
11	"Toy Story"	1995	"John Lasseter"
46	"Toy Story 2"	1999	"John Lasseter"
79	"Trainspotting"	1996	"Danny Boyle"
98	"Uno de los nuestros"	1990	"Martin Scorsese"
*/



--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo 
FROM peliculas 
ORDER BY longitud_titulo ASC;
/*
respuesta:
"E.T"	3
"300"	3
"Saw"	3
"Seven"	5
"Rocky"	5
"Alien"	5
"Rambo"	5
"Grease"	6
"Wall-E"	6
"Amélie"	6
"Matrix"	6
"Titanic"	7
"X-Men 2"	7
"Tiburón"	7
"Ben-Hur"	7
"Iron Man"	8
"Psicosis"	8
"Predator"	8
"King Kong"	9
"Toy Story"	9
"Gladiator"	9
"Casablanca"	10
"Terminator"	10
"Braveheart"	10
"Spider-Man"	10
"El Padrino"	10
"axi driver"	10
"Infiltrados"	11
"Ratatouille"	11
"Toy Story 2"	11
"Forest Gump"	11
"El exorcista"	12
"Transformers"	12
"Blade Runner"	12
"Pulp Fiction"	12
"Spider-Man 2"	12
"Mouling Rouge"	13
"Trainspotting"	13
"El resplandor"	13
"Batman Begins"	13
"V de Vendetta"	13
"El profesional"	14
"Apocalypse Now"	14
"Los increíbles"	14
"Ocean's Eleven"	14
"La milla verde"	14
"Monstruos S.A."	14
"American Beauty"	15
"Parque Jurásico"	15
"Escuela de Rock"	15
"Cadena perpetua"	15
"Buscando a Nemo"	15
"Kill Bill Vol. 1"	16
"El sexto sentido"	16
"Hombres de negro"	16
"Kill Bill Vol. 2"	16
"La vida de Brian"	16
"Full Metal Jacket"	17
"El show de Truman"	17
"Los cazafantasmas"	17
"Regreso al futuro"	17
"Mejor... imposible"	18
"American History X"	18
"El viaje de Chihiro"	19
"El club de la pelea"	19
"El precio del poder"	19
"Uno de los nuestros"	19
"El caballero oscuro"	19
"Eduardo Manostijeras"	20
"El libro de la selva"	20
"El Padrino. Parte II"	20
"Regreso al futuro II"	20
"El Padrino. Parte III"	21
"La lista de Schindler"	21
"El Laberinto del Fauno"	22
"Salvar al soldado Ryan"	22
"El planeta de los simios"	24
"Lo que el viento se llevó"	25
"Entrevista con el vampiro"	25
"En busca del arca perdida"	25
"El bueno el feo y el malo"	25
"Pesadilla antes de navidad"	26
"El silencio de los corderos"	27
"Terminator 2: el juicio final"	29
"Indiana Jones y el templo maldito"	33
"Indiana Jones y la última cruzada"	33
"Blancanieves y los siete enanitos"	33
"Alguien voló sobre el nido del cuco"	35
"El Señor de los anillos: Las dos torres"	39
"Harry Potter y el Prisionero de Azkaban"	39
"Star Wars. Episodio I: La amenaza fantasma"	42
"Star Wars. Episodio IV: Una nueva esperanza"	43
"El Señor de los anillos: El retorno del rey"	43
"Star Wars. Episodio VI: El retorno del Jedi"	43
"Star Wars. Episodio V: El imperio contraataca"	45
"Piratas del Caribe: El cofre del hombre muerto"	46
"Star Wars. Episodio III: La venganza de los Sith"	48
"El Señor de los anillos: La comunidad del anillo"	48
"Piratas del Caribe: La maldición de la Perla Negra"	50
"Sweeney Todd: El barbero diabólico de la calle Fleet"	52
*/



--8. Consultar cual es la longitud más grande entre todos los títulos de las películas. (2 punto) 
SELECT MAX(LENGTH(Pelicula)) AS max_longitud_titulo 
FROM peliculas;
--respuesta: 52