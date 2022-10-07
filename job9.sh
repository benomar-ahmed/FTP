#!/bin/bash

varname="$var1"
varpassword="$var2"
varrole="$var3"
varrole2="admin"
#sudo groupadd ftpusers

#while IFS=";" read var1 var2 var3
#do
	#sudo useradd $var1 --shell /bin/false --home /home/$var1 -p $var2 -G ftpusers	
	
#done < list.csv

while IFS=";" read var3
do
	i= cut -d';' -f3
	if [ i=="admin" ]
	then
		echo $i
	fi

done < list.csv
