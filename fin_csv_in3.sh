#!/bin/bash
# Brent Fanning
# Comp 705

input1="spaces_only.csv"
output1=""

# this just counts everything that gets read out so we can use an if 
# conditional to check if the models have been dislayed yet
tot_num_all_mf=0

num_fields=5
let num_fields_less_one=num_fields+1

num_fields_counted=1

dir="dir"
mod_now=""


while read -r line
do
	set $line

	field1=$(echo $1 | tr -d '"')
	field2=$(echo $2 | tr -d '"')
	field3=$(echo $3 | tr -d '"')
	field4=$(echo $4 | tr -d '"')
	field5=$(echo $5 | tr -d '"')

	while [ "$num_fields_counted" -lt "$num_fields_less_one" ]
	do
		if [ "$tot_num_all_mf" -lt 1 ]
		then
			echo model $num_fields_counted is
			echo "${!num_fields_counted}"
			if [ "${!num_fields_counted}" == "NOMODEL" ]
			then
				echo "no model here... skipped"
				rm $dir$num_fields_counted
			else
				echo "${!num_fields_counted}" > $dir$num_fields_counted
			fi

			let num_fields_counted=num_fields_counted+1
		else
			if [ "${!num_fields_counted}" == "NA" ]
			then
				let tot_num_all_mf=99
				# null statement alters now pointless variable
			else
				echo "${!num_fields_counted}" >> $dir$num_fields_counted
			fi

			let num_fields_counted=num_fields_counted+1
		fi
	done

	let num_fields_counted=0
	let tot_num_all_mf=tot_num_all_mf+1

done < $input1

# this just gets rid of any dir0 that might develop by accident
let tot_num_all_mf=0
rm $dir$tot_num_all_mf



for file in dir[1-99]; do
	more $file
done
