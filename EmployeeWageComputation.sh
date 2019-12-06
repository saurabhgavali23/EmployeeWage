#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

	rand=$((RANDOM%2))

	if (( $rand == 0 ))
	then
		echo "Employee Absent"
	else
		echo "Employee Present"
	fi
