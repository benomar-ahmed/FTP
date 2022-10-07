#!/bin/bash

# Installer ProFTPD
sudo apt-get update && apt-get install proftpd openssl

# Créer le groupe et utilisateur FTP
sudo addgroup ftpgroup
	# AJouter un utilisateur FTP "matthis"
	sudo adduser matthis -shell /bin/false -home /ftpshare
	# On ajoute l'utilisateur au groupe
	sudo adduser matthis ftpgroup
	
#On applique les permissions sur le dossier ftpshare
chmod -R 1777 /ftpshare/

#	#Configurer le serveur ProFTPD
###Toutefois sur Debian, vous pouvez placer un fichier de configuration personnalisée dans /etc/proftpd/conf.d/. Ainsi lors d’une mise à jour de paquet via APT, votre configuration ne sera pas écrasée.

#Créer le fichier suivant
nano /etc/proftpd/conf.d/personnalises.conf

###Recopiez les paramètres du fichier /etc/proftpd/proftpd.conf.
cat proftpd.conf > /etc/proftpd/conf.d/personnalises.conf

#	#Configurer ProFTPD TLS

mkdir /etc/proftpd/ssl

##Générez un certificat auto-signé en exécutant la commande ci-dessous. Il vous demandera des informations, veuillez fournir des informations en conséquence.

sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

#Le fichier proftpd.key doit être lisible par root uniquement. Pour sécuriser l’environnement, exécutez la commande ci-dessous.

chmod 600 /etc/proftpd/ssl/proftpd.*

#Créer le fichier suivant
nano /etc/proftpd/conf.d/tls.conf
cat tls.conf > /etc/proftpd/conf.d/tls.conf

#	#Relancer le service PROFTPD
sudo service proftpd restart

#	#Installer Filezilla
sudo apt-get install Filezilla

