#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi
suma=0;
while read linia; do
	debug $linia
	desena=0;
	unitat=0;
	#for i in $(seq 0 $((${#linia} - 2)) ); do
	#for (( i = 0; i < ${#linia} - 1 ; ++i )); do
	for (( i = 0; i < ${#linia} - 1 && ( desena < 9 || unitat < 9 ); ++i )); do
		#debug ${linia:$i:1}
		if [ ${linia:i:1} -gt $desena ]; then
			desena=${linia:i:1};
			unitat=0;
		elif [ ${linia:i:1} -gt $unitat ]; then
			unitat=${linia:i:1};
		fi
	done
	if [ ${linia: -1} -gt $unitat ]; then
		unitat=${linia: -1};
	fi

	suma=$((suma + desena * 10 + unitat))
	debug "$desena$unitat" $suma
done < input3

echo $suma
