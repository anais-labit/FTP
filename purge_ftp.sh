#!/bin/bash

# CE SCRIPT EST À LANCER AVEC SUDO OU EN ROOT

# supprimer proftpd, filezilla, openssl et git
apt-get autoremove --purge proftpd* -y
apt-get autoremove --purge openssl -y
apt-get autoremove --purge git -y

# supprimer le dossier cloné
rm -r /etc/conf-proftpd

# supprimer l'utilisateur
deluser -r ftp_user
