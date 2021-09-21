#! /bin/bash
# Vérifier si les 2 arguments sont non nul
 if [ $# -ge 2 ]
   then
     echo "script has at least 2 arguments"
 else
     echo "Fixme"
 fi
exec < $1

# arg1 correspond au .csv
# arg2 correspond au .json

read header
while read line
do

  # Recupérer la mac address des fichiers .csv
  mac_address=`echo "$line" | cut -d "," -f 1`
  
  target_url=http://localhost:8080/profiles/clientId:$mac_address
  echo -e "Calling ... $target_url"
  
  # Envoie de la commande Curl
  curl -X --trace PUT -H "Content-Type: application/json;x-client-id: 17d7e9dc-24c0-435a-9365-02e1076891b3;x-authentication-token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" -d @$2 "$target_url"

done
