#!/bin/bash
# Brent Fanning
# Comp 705


sudo rm -r field_and_model_info
mkdir field_and_model_info

outer_folder='field_and_model_info/'

echo 'how many models do you want to make to start out with?'
read num_models

echo 'what is the name of the first model you wish to create?'
read model_name

echo 'how many fields do you want to make for this model?'
read num_fields

model_now_var=$outer_folder$model_name

touch $model_now_var


while :
do
	if [ $num_fields -lt 1 ]
	then
		num_models=$[ $num_models -1 ]
		
		if [ $num_models -lt 1 ]
		then
			echo 'all fields and all models have been created!!!  Moving on...'
			break
		else
			echo 'what would you like to call the next model?'
			read model_name
			echo 'how many fields do you want to make for that model?'
			read num_fields
			model_now_var=$outer_folder$model_name
			touch $model_now_var
		fi
	else
		echo 'what would you like this field to be named?'
		read field_name
		echo $field_name >> $model_now_var
		num_fields=$[ $num_fields -1 ]
	fi
	echo "models remaining to set up: "$num_models
	echo "fields remaining to set up: "$num_fields

done



















