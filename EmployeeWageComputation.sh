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

function getWorkHrs(){
	local empCheck=$1

	if (( $empCheck == 1 ))
	then
		echo	$(($hours + $FULLDAY_WORKING_HR))
	else
		echo	$(($hours + $HALFDAY_WORKING_HR))
	fi
}

	while (( $day < $WORK_PER_MONTH && $hours < 100 ))
	do

	empCheck=$((RANDOM%3))

	case $empCheck in

		$absentEmp)
				echo "Employee Absent";;
		$fullTimeEmp)
				echo "FullTime Employee Present"
				echo $(($WAGE_PER_HR * $FULLDAY_WORKING_HR ))
				echo "$( getWorkHrs $fullTimeEmp )";;
		$partTimeEmp)
				echo "PartTime Employee Present"
				echo $(($WAGE_PER_HR * $HALFDAY_WORKING_HR ))
				echo "$( getWorkHrs $partTimeEmp )";;
	esac
	day=$(($day+1))
done
