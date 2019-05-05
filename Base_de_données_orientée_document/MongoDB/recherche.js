/* ----- Affichage de la liste des utilisateurs ----- */

print("Affichage de la liste des utilisateurs");
recordset = db.personne.find();
while (recordset.hasNext()) {
   printjson(recordset.next());
}


/* ----- Affichage des informations de nom de  Garold Ladewig ----- */

print("\nAffichage des informations de Garold Ladewig :");
recordset = db.personne.find({"prenom": "Garold", "nom":"Ladewig"});
printjson(recordset.next());

/* ----- Affichage des amis de Garold ----- */

print("\nListe des amis de Garold Ladewig :");
recordset = db.personne.find({"prenom":"Garold","nom":"Ladewig","lien_social.type":"ami"},
{"lien_social":1, "_id":0});
var liste_id = [];
while (recordset.hasNext()) {
   ami = recordset.next().lien_social
   for (let i = 0; i < ami.length; i++){
      if (ami[i].type == "ami"){
         liste_id.push(ami[i]._id);
      }
   }
}

for(let i=0; i< liste_id.length;i++){
   recordset = db.personne.find({"_id":ObjectId(liste_id[i])}, {"nom":1, "prenom":1, _id:0});
   personne = recordset.next();
   print(i, "- ", personne.nom, personne.prenom);
}

/* ----- Affichage du fil d'actualité ----- */

print("\nFil d'actualité:\n ");
print("Date        Titre\n")
recordset = db.personne.find({}, {"post":1, "_id":0});
var liste_post = [];
while (recordset.hasNext()) {
   posts = recordset.next();
   if (posts.post) {
      for(let i = 0; i < posts.post.length; i++){
         print(posts.post[i].date, posts.post[i].titre);
      }
   }
}