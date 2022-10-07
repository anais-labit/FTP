#!/bin/bash


# à faire tant qu'il reste des lignes à parcourir
while IFS="," read -r Id Prenom Nom Mdp Role
#Role= grep Adm

do
    # echo $Id
    # créer utilisateurs
        # si admin, superutilisateur
        if [ ${Role:0:5} = "Admin" ]; then 
            useradd --password $Mdp --badnames $Prenom 
            usermod -aG sudo $Prenom

        #sinon, utilisateur normal :
        else 
            useradd --password $Mdp --badnames $Prenom 

        fi        

done</home/anais/Downloads/Shell_Userlist.csv




créer un groupe les mettre tous dedans
et dans ftp les autoriser seulement eux





# #!/bin/bash


# # à faire tant qu'il reste des lignes à parcourir
# while IFS="," read -r Id Prenom Nom Mdp Role
# #Role= grep Adm

# do
#    deluser $Prenom
   
# done</home/anais/Downloads/Shell_Userlist.csv
