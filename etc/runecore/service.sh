#!/bin/sh

while [ true ]
do

MainDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

USERLIST="$(w)"
USERLIST="$(echo "$USERLIST" | tail -n +3)"
USERLIST="$(echo "$USERLIST" | cut -f1 -d" ")"


function runlogin {
	
	for item in $USERLIST
	do
		su $item $MainDIR/execute.d/startlogin
		
	done
}



function runsystem {
	
	
	$MainDIR/execute.d/startsystem
	
	
}



runlogin &

runsystem &

sleep 2

done
