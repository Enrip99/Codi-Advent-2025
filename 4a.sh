#!/bin/bash

calculacolindants () {
	colindants=0;
	debug a $i $j ${#array[@]} ${liniapost:$j:1}
	if [[ $i -gt 0            && $j -gt 0             && ${liniaprev:$((j-1)):1} == "@" ]]; then
		(( ++colindants ));
		debug ${liniaprev:$((j-1)):1} UL
	fi;
	if [[ $i -gt 0                                    && ${liniaprev:$j:1}       == "@" ]]; then
		(( ++colindants ));
		debug ${liniaprev:$j:1} UC
	fi;
	if [[ $i -gt 0            && $j -lt ${#liniaprev} && ${liniaprev:$((j+1)):1} == "@" ]]; then
		(( ++colindants ));
		debug ${liniaprev:$((j+1)):1} UR
	fi;
	if [[                        $j -gt 0             && ${liniaactu:$((j-1)):1} == "@" ]]; then
		(( ++colindants ));
		debug ${liniaactu:$((j-1)):1} CL
	fi;
	if [[                        $j -lt ${#liniaactu} && ${liniaactu:$((j+1)):1} == "@" ]]; then 
		(( ++colindants ));
		debug ${liniaactu:$((j+1)):1} CR
	fi;
	if [[ $i -lt ${#array[@]} && $j -gt 0             && ${liniapost:$((j-1)):1} == "@" ]]; then
		(( ++colindants ));
		debug ${liniapost:$((j-1)):1} DL
	fi;
	if [[ $i -lt ${#array[@]}                         && ${liniapost:$j:1}       == "@" ]]; then
		(( ++colindants ));
		debug ${liniapost:$j:1} DC
	fi;
	if [[ $i -lt ${#array[@]} && $j -lt ${#liniapost} && ${liniapost:$((j+1)):1} == "@" ]]; then
		(( ++colindants )); 
		debug ${liniapost:$((j+1)):1} DR
	fi;
}

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi

readarray -t array < input4
#debug ${array[@]}

suma=0;


for (( i=0; i < ${#array[@]}; ++i )); do
	liniaprev="${array[$((i-1))]}";
	liniaactu="${array[$i]}";
	liniapost="${array[$((i+1))]}";
	for (( j=0; j<${#liniaactu}; ++j )); do
		if [[ ${liniaactu:$j:1} == "@" ]]; then
			#debug $i $j
			calculacolindants
			debug b $? $colindants
			if [ $colindants -lt 4 ]; then (( ++suma )); fi
		fi
		debug =================
	done
done


echo $suma
