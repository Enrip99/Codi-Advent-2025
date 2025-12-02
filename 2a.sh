#!/bin/bash

readarray -d, -t array < input2
suma=0;
for i in ${array[@]}; do
	min=${i%-*};
	max=${i##*-};
	while [ $min -le $max ]; do
		if [ $((${#min} % 2)) -eq 0 ]; then
			if [ ${min:0:$((${#min}/2))} = ${min:$((${#min}/2))} ]; then
				((suma+=min));
			fi
		fi
		(( ++min ));
	done
done

echo $suma
