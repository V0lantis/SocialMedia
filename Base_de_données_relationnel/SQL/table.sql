DROP TABLE IF EXISTS personne, lien_social, lieu_travail, competence, thematique, groupe, personne_dans_groupe, audio, texte, video, image, dossier_thematique, post, commentaire, personne_aime_post, formation_personne, formation, formation_thematique, post_dans_dossier CASCADE;

CREATE TABLE lieu_travail(
    nom  VARCHAR(70) NOT NULL,
    ville  VARCHAR(100) NOT NULL,
    code_postal  INT NOT NULL,
    adresse  VARCHAR NOT NULL,
    publique  BOOLEAN,
    PRIMARY KEY(nom, code_postal, adresse),
    CHECK (code_postal BETWEEN 10^3 AND 10^6) --Les codes postaux sont entre 1000 et un milion
);

CREATE TABLE personne(
    id SERIAL PRIMARY KEY ,
    nom VARCHAR(40) NOT NULL,
    prenom  VARCHAR(40) NOT NULL,
    email  VARCHAR(100) NOT NULL,
    mot_de_passe VARCHAR NOT NULL,
    photo  VARCHAR,
    date_naissance DATE NOT NULL,
    nom_lieu_travail VARCHAR(70),
    code_postal_lieu_travail INT,
    adresse_lieu_travail VARCHAR,
    UNIQUE (email),
    FOREIGN KEY (nom_lieu_travail, code_postal_lieu_travail, adresse_lieu_travail) REFERENCES lieu_travail(nom, code_postal, adresse),
    CHECK (extract(year from age(date_naissance)) >= 18)
);

CREATE TABLE lien_social(
    personne1 INT REFERENCES personne(id) ON DELETE CASCADE, --Compte ami avec
    personne2  INT REFERENCES personne(id) ON DELETE CASCADE, --Cette personne
    type VARCHAR(20) NOT NULL, 
    PRIMARY KEY (personne1, personne2),
    CHECK (personne1 <> personne2),
    CHECK (type = 'Ami' OR type = 'Collegue' OR type = 'Famille')
);

CREATE TABLE thematique(
    nom VARCHAR(100) PRIMARY KEY,
    Description VARCHAR(400)
);

CREATE TABLE competence(
    intitule VARCHAR(200),
    personne INT REFERENCES personne(id),
    niveau  SMALLINT NOT NULL,
    publique BOOLEAN NOT NULL,
    thematique VARCHAR(100) REFERENCES thematique(nom) ON DELETE CASCADE,
    CHECK(niveau BETWEEN 0 AND 5),
    PRIMARY KEY(intitule,personne)
);

CREATE TABLE groupe(
    nom  VARCHAR(100) PRIMARY KEY,
    thematique VARCHAR(100) REFERENCES thematique(nom) NOT NULL,
    parent VARCHAR(100) REFERENCES groupe(nom)
);

CREATE TABLE personne_dans_groupe(
    personne INT REFERENCES personne(id) ON DELETE CASCADE,
    groupe VARCHAR(100) REFERENCES groupe(nom) ON DELETE CASCADE,
    PRIMARY KEY(personne, groupe) 
);

CREATE TABLE dossier_thematique(
    nom  VARCHAR,
    personne INT REFERENCES personne (id) ON DELETE CASCADE,
    publique  Boolean,
    PRIMARY KEY(nom, personne)
); 


CREATE TABLE audio (
    id SERIAL PRIMARY KEY,
    url_Audio VARCHAR
); 


CREATE TABLE texte(
    id SERIAL PRIMARY KEY,
    contenu  VARCHAR NOT NULL
);

CREATE TABLE video(
    id SERIAL PRIMARY KEY,
    url_Video  VARCHAR
); 

CREATE TABLE image (
    id SERIAL PRIMARY KEY,
    hauteur  Int,
    largeur  Int,
    url_image  VARCHAR
); 

 CREATE TABLE post(
    id SERIAL PRIMARY KEY, 
    titre  VARCHAR NOT NULL,
    id_texte INT REFERENCES texte (id), 
    id_audio INT REFERENCES audio (id), 
    id_video INT REFERENCES video (id), 
    id_image INT REFERENCES image (id), 
    poste_par INT REFERENCES personne(id) ON DELETE CASCADE NOT NULL ,
    appartient_a VARCHAR(100) REFERENCES groupe(nom) ON DELETE CASCADE,
    date  DATE NOT NULL,
    publique  Boolean,
    ami  Boolean,
    collegue  Boolean,
    famille  Boolean,
    CHECK (
        (id_texte IS NOT NULL AND id_audio IS NULL AND id_video IS NULL AND id_image IS NULL) OR
        (id_texte IS NULL AND id_audio IS NOT NULL AND id_video IS NULL AND id_image IS NULL) OR
        (id_texte IS NULL AND id_audio IS NULL AND id_video IS NOT NULL AND id_image IS NULL) OR
        (id_texte IS NULL AND id_audio IS NULL AND id_video IS NULL AND id_image IS NOT NULL)
        )
); 

CREATE TABLE personne_aime_post(
    aime_par INT REFERENCES personne(id) ON DELETE CASCADE,
    post INT REFERENCES post(id) ON DELETE CASCADE,
    PRIMARY KEY(aime_par, post)
); 

CREATE TABLE commentaire(
    id SERIAL PRIMARY KEY,
    contenu VARCHAR NOT NULL,
    poste_par INT REFERENCES personne(id) ON DELETE CASCADE,
    post_commente INT REFERENCES post(id) ON DELETE CASCADE,
    commentaire_parent INT REFERENCES commentaire(id) ON DELETE CASCADE
);

CREATE TABLE post_dans_dossier(
    dossier VARCHAR,
    personne INT,
    post INT REFERENCES post(id),
    PRIMARY KEY(dossier, post),
    FOREIGN KEY (dossier, personne) REFERENCES dossier_thematique (nom, personne) ON DELETE CASCADE
);

CREATE TABLE formation(
    nom VARCHAR(100) PRIMARY KEY, 
    publique BOOLEAN NOT NULL
);

CREATE TABLE formation_personne(
    personne INT REFERENCES personne(id) ON DELETE CASCADE,
    formation VARCHAR(100) REFERENCES formation(nom),
    PRIMARY KEY(personne, formation)
);

CREATE TABLE formation_thematique(
    formation VARCHAR(100) REFERENCES formation(nom) ON DELETE CASCADE,
    thematique VARCHAR(100) REFERENCES thematique(nom) ON DELETE CASCADE,
    PRIMARY KEY(formation, thematique)
);
