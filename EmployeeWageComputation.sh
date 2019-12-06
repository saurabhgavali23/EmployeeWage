#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

WAGE_PER_HR=20
WORKING_HR=8

	rand=$((RANDOM%2))

	if (( $rand == 0 ))
	then
		echo "Employee Absent"
	else
		echo "Employee Present"
		echo $(($WAGE_PER_HR * $WORKING_HR )) 
	fi
