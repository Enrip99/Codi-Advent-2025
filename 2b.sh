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
		(( ++min ));
	done
done

echo $suma;
