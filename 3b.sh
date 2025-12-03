#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi
suma=0;
while read linia; do
	debug $linia
	num=(0 0 0 0 0 0 0 0 0 0 0 0);
	for (( i = 0; i < ${#linia}; ++i )); do
		debug ${linia:$i:1} $i resta: $((12-(${#linia} - $i)))
		nounum=${linia:$i:1};
		trobat=0;
		j=$((12-(${#linia} - $i)));
		if [ $j -lt 0 ]; then j=0; fi
		for (( ; j <= 11; ++j )); do
			if [ $trobat -eq 1 ]; then
				num[$j]=0;
			elif [ $nounum -gt ${num[$j]} ]; then
				trobat=1;
				num[$j]=$nounum;
			fi
		done
		debug ${num[@]} 
	done
	temp=""
	for i in ${num[@]}; do temp=${temp}${i}; done
	debug $temp
	(( suma += temp ));
	debug $suma
done < input3

echo $suma
