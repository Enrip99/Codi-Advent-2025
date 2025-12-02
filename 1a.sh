#!/bin/bash

pos=50
contrassenya=0
while read linia; do
num=${linia:1}
if [[ ${linia:0:1} = "R" ]]; then
	pos=$(( ($pos + $num) % 100 ))
else
	pos=$(( ($pos - $num) % 100 ))
fi
if [ $pos -eq 0 ]; then
	contrassenya=$(( $contrassenya + 1 ))
fi
done < "input1";
echo $contrassenya
