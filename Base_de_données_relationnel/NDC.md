# Note de clarification

Pour le projet de _NA17_, nous devons créer le modèle de données d'un réseau social de veille technologique. Cette note de clarification sera notre référence tout au long de la conception de ce modèle et sera mise à jour en accord avec nos futures décisions.

### Personnes
L'une des fonctions principales du réseau social consiste à créer des personnes. Ces personnes seront les utilisateurs du réseau social, il est donc important de conserver les informations suivantes dans la base de données :
- Un nom
- Un prénom
- Une adresse mail
- Un mot de passe
- Une photo de profil
- Une date de naissance

Chaque utilisateur aura une page personnelle qui contiendra des informations personnelles (*lieu de travail*, *compétences techniques*, *formations suivies*...)
La page personnelle contiendra aussi la liste des *groupes* auxquels l'utilisateur a adhéré et les *liens sociaux* qu'il a créés. 
L'utilisateur pourra choisir les éléments qui sont *publics* et *privés* sur son profil.

### Association avec les personnes

Une autre fonctionnalité clé de notre réseau social est de permettre aux utilisateurs de s'associer à des *points communs*.
Ces points communs rentreront donc dans des catégories différentes (*lieu de travail*, *entreprise*, *compétence technique*,...) qui auront chacune des propriétés différentes. Par exemple, il faudra stocker les coordonnées du lieu de travail, et le niveau de compétence sur une compétence technique.

### Liens sociaux

Les utilisateurs doivent pouvoir créer des liens sociaux avec d'autres utilisateurs. Les liens peuvent être de différents types :
- Collègue
- Amis
- Famille

### Groupes et sous-groupes

Les utilisateurs peuvent adhérer à des groupes thématiques de veille. Chacun de ces groupes aura une thématique précise. Certains groupes pourront être des sous-groupes d'autres groupes (Exemple: Le groupe `Postgres` est un sous-groupe du groupe `Base de données`).
Seul l'administrateur du site pourra créer les groupes.

### Posts

Les utilisateurs posteront du contenu qui pourra avoir des types différents :
- Texte
- Vidéo(s)
- Image(s)
- Audio

Un utilisateur peut publier un post sur sa page personnelle. Il pourra alors choisir les utilisateurs qui peuvent voir le post (public, amis...).
Un utilisateur peut aussi publier dans un groupe auquel il appartient. Dans ce cas tous les membres de ce groupe pourront voir son post. 

Si un utilisateur peut voir un post, il peut aussi l'*aimer*, le *commenter* et *répondre* à un commentaire. 

### Dossiers thématiques

Chaque utilisateur pourra créer des *dossiers thématiques* dans lesquels il pourra sauvegarder les posts de son choix. Ces dossiers thématiques pourront être publics ou privés.
:)