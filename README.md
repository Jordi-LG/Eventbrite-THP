<h1> Eventbrite </h1>
<h4>Façon THP</h4>

Lien Heroku: https://eventbritethps10.herokuapp.com/

* Etapes pour utiliser l'application en local:
<code>Bundle install</code>
<code>rails db:create</code>
(=> Au cas ou pb de BDD)
<code>rails db:migrate</code>
<code>rails db:seed</code>
Aller sur localhost:3000

Si pb dans la DBB ou seed:
<code>rails db:setup</code>

Partie User, ce qu'il est possible de faire:
Création user
Redemander le password
(la modif ne fonctionne pas, vient de la gem)
Voir son profil, et pas celui d'un autre (renvoie à une erreur si l'id d'un user n'existe pas)

Partie event:
Création event
Voir la page d'un event avec plus de détails
(compteur de participants et date de fin d'event)
