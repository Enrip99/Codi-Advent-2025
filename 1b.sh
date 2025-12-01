#!/bin/bash

debug () {
	if [ $debug -eq 0 ]; then echo -e $@; fi
}

pos=50;
clics=0;

if [ $# -eq 1 ]; then debug=0; else debug=1; fi

while read linia; do
	oldpos=$pos;
	num=${linia:1};
	debug ${linia:0:1} $num
	case ${linia:0:1} in
		R)
			((pos += num));
			if [ $pos -ge 100 ]; then
				((clics += pos / 100));
				((pos = pos%100));
			fi
			;;
		L)
			if [ $oldpos -eq 0 ]; then ((--clics)); fi
			((pos -= num));
			if [ $pos -le 0 ]; then
				((++clics));
				((clics -= pos / 100));
				((pos = ( (pos%100) + 100 ) % 100));
			fi
			;;
	esac
	debug $pos $clics "\n"
done < "input1"

echo $clics;
