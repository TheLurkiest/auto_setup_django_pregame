#!/bin/bash
# Brent Fanning

input1='field_and_model_info/reptile'






string1=hello
string2=world
# mystring="class ${line1model} arbitrary ${string2} text"




line1model=''
line2plusfields=''
countformodel=0

while read -r line
do
	set $line
	echo $line
	if [ "$countformodel" -lt 1 ]
	then
		line1model=$line
		outputline="class ${line1model}(models.Model):"
	else
		line2plusfields=$line
		outputline="${line2model} = models.CharField(max_length=255, null=False)"
	fi
	echo $outputline >> models_alt.py
	countformodel=${ countformodel + 1 }


done < $input1

