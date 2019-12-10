#!/bin/bash -x

echo "Welcom to Employee Wage Computation program"

WAGE_PER_HR=20
WORK_PER_MONTH=20
FULL_TIME_EMP=1
PART_TIME_EMP=2

day=0
totalHours=0
monthlyWage=0

declare -A storeTotalDailyWage

function getWorkHrs(){
	local empCheck=$1

	case $empCheck in

	$FULL_TIME_EMP)
			echo 8;;

	$HALF_TIME_EMP)
			echo 4;;

	*)
			echo 0;;
	esac
}

while (( $day < $WORK_PER_MONTH && $totalHours < 100 ))
do

	empCheck=$((RANDOM%3))
	empHrs=$( getWorkHrs $empCheck )
	dailyWage=$(($empHrs + $WAGE_PER_HR ))
	monthlyWage=$(( $dailyWage * $WORK_PER_MONTH ))
	totalHours=$(( $totalHours + $empHrs ))
	storeTotalDailyWage["Day_$day"]="$dailyWage	$monthlyWage"
	day=$(($day+1))
done

for (( i=1; i<${#storeTotalDailyWage[@]};i++ ))
do
		echo "Day_$i		${storeTotalDailyWage[Day_$i]}"
done
