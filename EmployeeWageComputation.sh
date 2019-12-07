#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

WAGE_PER_HR=20
FULLDAY_WORKING_HR=8
HALFDAY_WORKING_HR=4
absentEmp=0
fullTimeEmp=1
partTimeEmp=2

	empCheck=$((RANDOM%3))

	case $empCheck in

		absentEmp)
				echo "Employee Absent";;
		$fullTimeEmp)
				echo "FullTime Employee Present"
				echo $(($WAGE_PER_HR * $FULLDAY_WORKING_HR ));;
		$partTimeEmp)
				echo "PartTime Employee Present"
				echo $(($WAGE_PER_HR * $HALFDAY_WORKING_HR ));;
			*)
				echo "Invalid Option";;
	esac

