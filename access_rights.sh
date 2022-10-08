#!/bin/bash

# tant qu'il reste des lignes à parcourir, assigner des valeurs aux champs repérés (séparés par des virgules) :
while IFS="," read -r Id Prenom Nom Mdp Role

do
    # créer utilisateurs

        # si admin, superutilisateur :
        if [ ${Role:0:5} = "Admin" ]; then 
            useradd -m --password $Mdp --badnames $Prenom --g nogroup -G sudo

        #sinon, utilisateur normal :
        else 
            useradd -m --password $Mdp --badnames $Prenom --g nogroup

        fi        

echo "Editing for user $Prenom ..." ; echo "Done."

done</home/anais/Downloads/Shell_Userlist.csv

# Pourquoi "nogroup"? Parce que c'est le groupe par défaut dans proftpd.conf
