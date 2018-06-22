LOAD DATA LOCAL INFILE 'C:/Users/Jean-Claude/Desktop/IUT/TP BDD/TP5FichierSource/Personne.txt'
INTO TABLE Personne
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:/Users/Jean-Claude/Desktop/IUT/TP BDD/TP5FichierSource/Film.txt'
INTO TABLE Film
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:/Users/Jean-Claude/Desktop/IUT/TP BDD/TP5FichierSource/Jouer.txt'
INTO TABLE Jouer
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:/Users/Jean-Claude/Desktop/IUT/TP BDD/TP5FichierSource/Cinema.txt'
INTO TABLE Cinema
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:/Users/Jean-Claude/Desktop/IUT/TP BDD/TP5FichierSource/Projection.txt'
INTO TABLE Projection
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';


SELECT COUNT(*) AS nbre_personnes
FROM Personne;
 
SELECT min(annee)
FROM FILM;

SELECT nom, COUNT(DISTINCT idFilm) AS nbre_film
FROM Personne
JOIN Jouer ON Personne.idPersonne = jouer.idActeur
JOIN Film ON Film.idFilm = Jouer.idFilm
GROUP BY nom
HAVING COUNT(DISTINCT idFilm) = 1;




SELECT Jouer.role, Personne.nom, Personne.prenom, Film.titre
FROM Jouer INNER JOIN Personne ON Jouer.idActeur = Personne.idPersonne INNER JOIN Film ON Jouer.idFilm = Film.idFilm;

SELECT Personne.nom, Personne.prenom, COUNT(Jouer.idFilm)
FROM Personne INNER JOIN Jouer ON Personne.idPersonne = Jouer.idActeur
GROUP BY Personne.nom, Personne.prenom;

SELECT Personne.nom, Personne.prenom, MIN(Film.annee), MAX(Film.annee), COUNT(Jouer.idFilm)
FROM Personne INNER JOIN Jouer ON Personne.idPersonne = Jouer.idActeur
GROUP BY Personne.nom, Personne.prenom;

SELECT Personne.nom, Personne.prenom, COUNT(Jouer.idFilm)
FROM Personne INNER JOIN Jouer ON Personne.idPersonne = Jouer.idActeur
GROUP BY Personne.nom, Personne.prenom
HAVING COUNT(Jouer.idFilm) > 1;

SELECT Personne.nom, Personne.prenom, COUNT(Film.genre)
FROM Personne INNER JOIN Jouer ON Personne.idPersonne = Jouer.idActeur INNER JOIN Film ON Jouer.idFilm = Film.idFilm
GROUP BY Personne.nom, Personne.prenom
HAVING Film.genre = Drame;




SELECT  COUNT(Projection.idFilm) AS filmProjete
FROM Projection;

SELECT Projection.idCinema
FROM Projection INNER JOIN Film ON Projection.idFilm = Film.idFilm
WHERE COUNT(Film.idFilm);

SELECT COUNT(Cinema.idCinema) AS nombreCinema
FROM Cinema;

SELECT Jouer.idActeur
FROM Jouer INNER JOIN Projection ON Jouer.idFilm = Projection.idFilm

SELECT Film.idFilm
FROM Film INNER JOIN Personne ON Film.idRealisateur = Personne.idPersonne
WHERE Personne.prenom = 'David' AND Personne.nom = 'Cronenberg';

SELECT Personne.prenom, Personne.nom
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur
WHERE Film.genre IN ('Drame', 'Polcier');

SELECT Personne.nom, Personne.prenom, COUNT(Film.idFilm)
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur
GROUP BY Personne.nom, Personne.prenom
HAVING genre IN (
				SELECT Film.genre
				FROM Film INNER JOIN Personne ON Film.idRealisateur = Personne.idPersonne
				WHERE Personne.prenom = 'David' AND Personne.nom = 'Cronenberg');



SELECT Personne.nom, Personne.prenom, COUNT(Film.idFilm)
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur
GROUP BY Personne.nom, Personne.prenom;

SELECT Personne.nom, Personne.prenom, COUNT(Film.idFilm)
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur
GROUP BY Personne.nom, Personne.prenom
HAVING COUNT(Film.idFilm) = MAX(
								SELECT COUNT(Film.idFilm)
                                FROM Film);
                                
                                
SELECT Personne.nom, Personne.prenom
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur
WHERE COUNT(Film.idFilm) =;

SELECT Personne.nom, Personne.prenom, Film.titre, COUNT(Jouer.idActeur)
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur INNER JOIN Jouer ON Film.idFilm = Jouer.idFilm
GROUP BY Personne.nom, Personne.prenom, Film.titre;

SELECT Personne.nom, Personne.prenom, Film.titre, (1000000)+(200000 *COUNT(Jouer.idActeur)
FROM Personne INNER JOIN Film ON Personne.idPersonne = Film.idRealisateur INNER JOIN Jouer ON Film.idFilm = Jouer.idFilm
GROUP BY Personne.nom, Personne.prenom, Film.titre;
