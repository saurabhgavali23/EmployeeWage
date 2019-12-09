#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

WAGE_PER_HR=20
FULLDAY_WORKING_HR=8
HALFDAY_WORKING_HR=4
WORK_PER_MONTH=20
absentEmp=0
day=0
totalDay=0
hours=0
monthlyWage=0
dayHour=0
fullTimeEmp=1
partTimeEmp=2
count=0

declare -A storeTotalDailyWage

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
				#DailyWage[((count++))]=$(( $day + $FULLDAY_WORKING_HR ))
				#totalDailyWage[((totalDay++))]=$(($WAGE_PER_HR * $FULLDAY_WORKING_HR ))
				dailyWage=$(( $day + $FULLDAY_WORKING_HR ))
				monthlyWage=$(( $dailyWage * $WAGE_PER_HR ))
				hours="$( getWorkHrs $fullTimeEmp )"
				storeTotalDailyWage["Day_$day"]="$dailyWage	$monthlyWage";;
		$partTimeEmp)
				echo "PartTime Employee Present"
				#DailyWage[((count++))]=$(( $day + $HALFDAY_WORKING_HR ))
				#totalDailyWage[((totalDay++))]=$(($WAGE_PER_HR * $HALFDAY_WORKING_HR ))
				dailyWage=$(( $day + $FULLDAY_WORKING_HR ))
				monthlyWage=$(( $dailyWage * $WAGE_PER_HR ))
				hours="$( getWorkHrs $partTimeEmp )"
				storeTotalDailyWage["Day_$day"]="$dailyWage	$monthlyWage";;
	esac
	day=$(($day+1))
done

len=${#storeTotalDailyWage[@]}
for (( i=0; i<$len;i++ ))
do
		echo "Day_$i		${storeTotalDailyWage[Day_$i]}"
done
