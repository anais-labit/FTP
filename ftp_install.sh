#!/bin/bash

# CE SCRIPT EST À LANCER AVEC SUDO OU EN ROOT

# faire un repo git hub avec les fichiers de config à télécharger
# proftd.conf + tls.conf + modules.conf

# Mettre à jour
apt-get update -y
apt-get upgrade -y

# installer proftpd, openssl et git
apt-get install proftpd-* -y
apt-get install openssl -y
apt-get install git -y

# aller dans le dossier dans lequel installer le git clone
cd /etc/

# clone le repo avec les fichiers de conf
git clone https://github.com/anais-labit/conf-proftpd.git

# aller dans le dossier cloné
cd /etc/conf-proftpd/

# copier les fichiers téléchargés
cp proftpd.conf /etc/proftpd/proftpd.conf 
cp tls.conf /etc/proftpd/tls.conf
cp modules.conf /etc/proftpd/modules.conf

# securiser la connexion
    # créer le dossier “ssl” :
	mkdir /etc/proftpd/ssl

    # requête pour de nouveaux certificat et clé :
	echo -e "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem

# mettre à jour proftpd
systemctl restart proftpd

# créer un utilisateur
useradd -m -p ftp ftp_user

