DROP VIEW IF EXISTS  amisGaroldLadewig, postsGaroldLadewig, postsEnregistresGaroldLadewig, personnesDansGroupeGI, personnesTravaillentChezPsycleResearch,
groupe_appartient_thematique, avg_level_competence,nb_personne_groupe,nb_groupe_personne,
nb_collegue_personne, post_par_groupe, commentaires_post, like_post, nombre_employés CASCADE;

--les amis de Garold Ladewig 

CREATE VIEW amisGaroldLadewig AS
SELECT nom, prenom FROM
(SELECT personne2 AS idAmis
FROM personne join lien_social on (personne.id = lien_social.personne1 OR personne.id = lien_social.personne2 )
WHERE type='Ami'
AND personne.id=1 UNION ALL SELECT personne1 AS idAmis FROM personne join lien_social on (personne.id = lien_social.personne1 OR personne.id = lien_social.personne2 )
WHERE type='Ami'
AND personne.id=1) table1
Join personne on table1.idAmis= personne.id WHERE id != 1;

-- les posts de Garold Ladewig

CREATE VIEW postsGaroldLadewig AS
SELECT id, titre FROM post WHERE poste_par=1;

-- Les posts enregistrés de Garold Ladewig

CREATE VIEW postsEnregistresGaroldLadewig AS 
SELECT id, titre FROM post JOIN post_dans_dossier ON post_dans_dossier.personne=1 AND post.id=post_dans_dossier.post;

-- personnes dans groupe GI

CREATE VIEW personnesDansGroupeGI AS
SELECT nom, prenom 
FROM personne 
JOIN personne_dans_groupe 
ON personne_dans_groupe.groupe='GI' 
AND personne_dans_groupe.personne=personne.id;

-- personnes qui travaillent chez Psycle Research
CREATE VIEW personnesTravaillentChezPsycleResearch AS
SELECT nom, prenom 
FROM personne 
WHERE nom_lieu_travail='Psycle Research' 
AND code_postal_lieu_travail=60200 
AND adresse_lieu_travail='Rue roger coutollenc';

--nombre de groupe appartenant à un dossier thematique
CREATE VIEW groupe_appartient_thematique AS
SELECT thematique, COUNT(nom) AS "Nombre de groupes" 
FROM groupe 
GROUP BY groupe.thematique;

--niveau moyen des personnes par compétence
CREATE VIEW avg_level_competence AS
SELECT AVG(niveau), thematique 
FROM competence 
GROUP BY competence.thematique 
ORDER BY AVG(niveau) DESC;

--nombre de personnes dans un groupe
CREATE VIEW nb_personne_groupe AS
SELECT COUNT(personne) AS "Nombre de personnes",groupe 
FROM personne_dans_groupe 
GROUP BY personne_dans_groupe.groupe 
ORDER BY COUNT(personne);

--nombre de collègues d'une personne
CREATE VIEW nb_collegue_personne AS
SELECT id, nom, prenom, COUNT(type) AS "Nombre de collègues" FROM (personne JOIN lien_social ON 
(lien_social.type = 'Collegue' AND (personne.id = lien_social.personne1 
OR personne.id = lien_social.personne2)))table1 
GROUP BY table1.id;

--Nombre de post par groupe
CREATE VIEW post_par_groupe AS
SELECT COUNT(id) AS "Nombre de posts", nom FROM (post JOIN groupe ON 
post.appartient_a = groupe.nom)table1 
GROUP BY table1.nom; 

--nombre de groupes d'une personne
CREATE VIEW nb_groupe_personne AS
SELECT  personne.nom, personne.prenom, COUNT(personne_dans_groupe.groupe) AS "Nombre de groupes d'une personne"
FROM personne_dans_groupe, personne
WHERE personne_dans_groupe.personne = personne.id
GROUP BY personne.nom, personne.prenom
ORDER BY COUNT(groupe) Desc;

-- Commentaires d'un post
CREATE VIEW commentaires_post AS 
SELECT post.titre AS "titre post", commentaire.contenu "Commentaire"
FROM post LEFT JOIN commentaire
ON post_commente = post.id;

-- nombre de LIKE par post
CREATE VIEW like_post AS 
SELECT post.titre, count (personne_aime_post.aime_par) AS "nombre de Like"
FROM post LEFT JOIN personne_aime_post 
on post.id = personne_aime_post.post
GROUP BY post.titre;

-- Nombre d'employés par lieu de travail
CREATE VIEW nombre_employés AS
SELECT lieu_travail.nom , count(personne.nom_lieu_travail) AS "Nombre d'employés"
FROM lieu_travail LEFT JOIN personne
ON lieu_travail.nom=personne.nom_lieu_travail
GROUP BY lieu_travail.nom;