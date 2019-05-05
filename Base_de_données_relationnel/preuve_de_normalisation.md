# Preuve de normalisation
## Personne:
* id -> nom
* id -> prenom
* id -> email
* id -> mot_de_passe
* id -> photo
* id -> date_naissance
* id -> Date
* id -> lieuTravail


## LienSocial:
* personne1,personne2 -> type

## LieuTravail:
* nom, code_postal, adresse-> publique
* nom, code_postal, adresse-> ville

## Competence:
* personne, intitule-> thematique
* personne, intitule-> niveau
* personne, intitule-> publique

## Formation:
* nom-> publique 

## FormationPersonne:
* (personne, formation) clé

## FormationThématique:
* (formation, thématique) clé

## Groupe:
* nom-> thematique
* nom-> parent

## PersonneDansGroupe:
(personne, groupe) clé

## Audio:
(url_Audio) clé 

## Texte:
* id-> contenu

## Video:
* (url_video) clé

## Image:
* url_image -> hauteur
* url_image -> largeur

## PersonneAimePost:
* (aimé_par, post) clé
 
## Commentaire:
* id -> date 
* id -> contenu 
* id -> posté_par
* id -> post_commenté
* id -> commentaire_commenté

## DossierThématique:
* nom, personne -> publique

## PostDansDossier:
* (Dossier,post) clé

## Post:
* id -> Titre
* id -> id_texte
* id -> id_audio
* id -> id_video
* id -> id_image
* id -> posté_par
* id -> appartient_à
* id -> titre
* id -> date
* id -> publique
* id -> ami
* id -> collègue
* id -> famille


**Toutes les DFE sont de la forme K→A avec K clé. Certaines relations n'ont que des clés. Donc toutes les relations sont en BCNF donc en 3NF.**