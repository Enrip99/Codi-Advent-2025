#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi

suma=0;
llistat="";

while read linia; do
	if [[ "$linia" == *-* ]]; then
		debug rang: $linia
		for (( i = (${linia%-*}); i <= (${linia##*-}); ++i )); do
			llistat="${llistat}${i}\n"
		done
	fi
done < input5

echo $llistat | sort -u | wc -l

echo $suma
