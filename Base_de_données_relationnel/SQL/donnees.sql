/*INSERT INTO personne (nom, prenom, email, mot_de_passe, date_naissance)
values ('A', 'B', 'C', 'D',date '1998-09-28');*/

\i table.sql

/* Ajout de lieux de travail dans La table lieu_travail */
\copy lieu_travail (nom, ville, code_postal, adresse, publique) FROM 'fichiersCSV/lieu_travail.csv' WITH CSV DELIMITER ',' QUOTE '"' 

/* Ajout de personnes dans La table personne */
\copy personne (prenom, nom, email, mot_de_passe, photo, date_naissance, nom_lieu_travail, code_postal_lieu_travail, adresse_lieu_travail) FROM 'fichiersCSV/personne_data.csv' WITH CSV DELIMITER ',' QUOTE '"' 

/* Ajout de liens sociaux dans La table lien_social */
\copy lien_social (personne1, personne2, type) FROM 'fichiersCSV/lien_social.csv' WITH CSV DELIMITER ',' QUOTE '"' 

/* Ajout de liens thematiques dans la table thematique */
\copy thematique (nom, description) FROM 'fichiersCSV/thematique.csv' WITH CSV DELIMITER ',' QUOTE '"' 

/* Ajout de groupes dans La table groupe */
\copy groupe (nom, thematique, parent) FROM 'fichiersCSV/groupe.csv' WITH CSV DELIMITER ',' QUOTE '"' 

/* Ajout de competences dans la table competence */
\copy competence (intitule, personne, niveau, publique, thematique) FROM 'fichiersCSV/competence.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de dossiers thematiques dans la table dosiier_thematique */
\copy dossier_thematique (nom, personne,publique) FROM 'fichiersCSV/dossier_thematique.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout d'audio dans la table audio */
\copy audio (url_audio) FROM 'fichiersCSV/audio.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de texte dans la table texte */
\copy texte (contenu) FROM 'fichiersCSV/texte.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout d'images dans la table image */
\copy image (hauteur, largeur, url_image) FROM 'fichiersCSV/image.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de videos dans la table video */
\copy video (url_Video) FROM 'fichiersCSV/video.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de formations dans la table formation */
\copy formation (nom,publique) FROM 'fichiersCSV/formation.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de thématiques pour les formations dans la table formation_thematique */
\copy formation_thematique (formation, thematique) FROM 'fichiersCSV/formation_thematique.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de personnes pour les formations dans la table formation_personne */
\copy formation_personne (personne, formation) FROM 'fichiersCSV/formation_personne.csv' WITH CSV DELIMITER ',' QUOTE '"'

 /*Ajout de post pour les formations dans la table formation_personne */
\copy post (titre,id_texte,id_audio,id_video,id_image,poste_par,appartient_a,date,publique,ami,collegue,famille) FROM 'fichiersCSV/post.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de personne_aime_post pour les formations dans la table formation_personne */
\copy personne_aime_post (aime_par, post) FROM 'fichiersCSV/personne_aime_post.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de personne_dans_groupe pour les lieux de travail */
\copy personne_dans_groupe (personne, groupe) FROM 'fichiersCSV/personne_dans_groupe.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de personne_aime_post pour les formations dans la table formation_personne */
\copy commentaire (contenu,poste_par,post_commente,commentaire_parent) FROM 'fichiersCSV/commentaire.csv' WITH CSV DELIMITER ',' QUOTE '"'

/* Ajout de personne_aime_post pour les formations dans la table formation_personne */
\copy post_dans_dossier (dossier,personne,post) FROM 'fichiersCSV/post_dans_dossier.csv' WITH CSV DELIMITER ',' QUOTE '"'

