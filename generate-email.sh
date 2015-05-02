#!/bin/bash

while read line
do
result=`ldapsearch -D uid=llam,ou=People,dc=example,dc=com -w <password> -xLLL displayName="$line" | grep mail: | cut -f2 -d" "`
if [[ -n $result ]];then
  echo "$result"
 else
  echo $line
fi

done < ./data
