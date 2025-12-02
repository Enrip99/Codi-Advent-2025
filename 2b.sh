#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}
if [ $# -eq 1 ]; then debug=0; else debug=1; fi

readarray -d, -t array < input2
suma=0;
for i in ${array[@]}; do
	min=${i%-*};
	max=${i##*-};
	while [ $min -le $max ]; do
		if grep -qP "^(\d+)\1+$" <<< $min; then
			suma=$(( suma + min ));
			debug $min $suma
		fi
		#for (( segments = 2; segments <= ${#min}/2; ++segments )); do
		#	if ! ((${#min} % $segments)); then
		#		# Divideix net
		#		debug "$min" "$segments" "->" "$((${#min} % $segments))"
		#		mida=$(( ${#min} / $segments ));
		#		debug MIDA: $mida
		#		fallat=0;
		#		for (( j = $mida; j < ${#min} && $fallat != 1 ; j += mida )); do
		#			if ! [[ ${min:0:$mida} = ${min:j:$mida} ]]; then
		#				debug ${min:0:$mida} VS ${min:j:$mida}
		#				fallat=1;
		#			fi
		#		done
		#		if [ $fallat -eq 0 ]; then
		#			suma=$(( $suma + $min ));
		#			debug Invàlid! Suma: $suma
		#			(( ++min ));
		#			continue;
		#		fi
		#	fi
		#done
		(( ++min ));
	done
done

echo $suma;
