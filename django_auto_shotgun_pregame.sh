#!/bin/bash
# Brent Fanning
# Comp 705

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
echo 'If all goes as planned this shell script you have just executed will hopefully implement all the tedious and'
echo 'frankly not very useful or difficult-- but extremely time-consuming process of setting up your initial '
echo 'stages for your Django Rest API.  Hopefully, if all goes as planned, a bit of python of python code will'
echo 'be set off momentarily and we will start seeing prompts asking specifically what we would like to set up'
echo 'followed by a quick and relatively painless transition into our initial Django setup that pretty much everyone'
echo 'is likely to have right at the start.  Fingers Crossed...'

echo '...something like: sudo python3 auto_text_cleaner1.py'



sudo python3 auto_shot1.py












mkdir five
c_dir=0
while [ $c_dir -le 4 ]
do
	c_dir=$[$c_dir +1]
	echo Creating our five directories now... now creating dir$c_dir
	mkdir dir$c_dir
	c_file=0

	while [ $c_file -le 3 ]
	do
		c_file=$[ $c_file +1 ]
		echo Creating our four files now... now creating file$c_file
		touch dir$c_dir/file$c_file
		c_line=0

		while [ $c_line -le $c_file ]
		do
			c_line=$[$c_line +1]
			echo line$c_line >> dir$c_dir/file$c_file
		done

	done

done

