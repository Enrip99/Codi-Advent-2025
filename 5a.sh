#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi

suma=0;
declare -a min;
declare -a max

while read linia; do
	if [[ "$linia" == *-* ]]; then
		debug rang: $linia
		min+=(${linia%-*})
		max+=(${linia##*-})
	elif [[ "$linia" != "" ]]; then
		debug id: $linia
		for (( i = 0; i < ${#min[@]}; ++i )); do
			if [ $linia -ge ${min[$i]} ] && [ $linia -le ${max[$i]} ]; then
				(( ++suma ));
				continue 2;
			fi
		done
	fi
done < input5


echo $suma
