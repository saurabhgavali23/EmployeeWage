#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

WAGE_PER_HR=20
FULLDAY_WORKING_HR=8
HALFDAY_WORKING_HR=4
WORK_PER_MONTH=20
absentEmp=0
day=0
hours=0
fullTimeEmp=1
partTimeEmp=2

	while (( $day < $WORK_PER_MONTH && $hours < 100 ))
	do

	empCheck=$((RANDOM%2))

	case $empCheck in

		absentEmp)
				echo "Employee Absent";;
		$fullTimeEmp)
				echo "FullTime Employee Present"
				echo $(($WAGE_PER_HR * $FULLDAY_WORKING_HR ))
				hours=$(($hours + $FULLDAY_WORKING_HR));;
		$partTimeEmp)
				echo "PartTime Employee Present"
				echo $(($WAGE_PER_HR * $HALFDAY_WORKING_HR ))
				hours=$(($hours + $HALFDAY_WORKING_HR));;
			*)
				echo "Invalid Option";;
	esac
	day=$(($day+1))
done
