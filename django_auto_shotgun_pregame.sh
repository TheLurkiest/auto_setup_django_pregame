#!/bin/bash
# Brent Fanning
# Comp 705

# step1
echo 'remember to activate your virtual environment before executing this or going further'

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
echo 'If all goes as planned this shell script you have just executed will hopefully implement all the tedious and'
echo 'frankly not very useful or difficult-- but extremely time-consuming process of setting up your initial '
echo 'stages for your Django Rest API.  Hopefully, if all goes as planned, a bit of python of python code will'
echo 'be set off momentarily and we will start seeing prompts asking specifically what we would like to set up'
echo 'followed by a quick and relatively painless transition into our initial Django setup that pretty much everyone'
echo 'is likely to have right at the start.  Fingers Crossed...'

# step2
mkdir api_auto_xxx
touch stage1_auto_d.py

chmod 777 stage1_auto_d.py

echo "import os

print('step 1: if virtual environment is not active, ctrl+c/d out of this python code')
print('...and then activate the virtual environment first before running this again')

p_reply = ''
p_reply = input('What would you like to call your first model?')

model1 = p_reply

print('ok.  Creating '+str(model1)+' model now.')
p_reply2='YES'
field_list=[]

while(p_reply2.upper() == 'YES'):
	p_reply = input('What would you like to call your field within that model?')
	if(len(p_reply) >= 1):
		field_list.append(p_reply)
	p_reply2 = input('Would you like to create any additional fields (yes/no)?')

print('the fields for the ' + str(model1) + 'model are as follows:')

r_field_list = range(len(field_list))
for r_elem in r_field_list:
	print(str(field_list[r_elem]))

apps_found = False

fin1=open('config/settings.py','r')
s_pre_marker=''
s_post_marker=''
for line in fin1:
	if(apps_found == False):
		s_pre_marker = str(s_pre_marker) + str(line)
	if(line.count('django.contrib.admin') >= 1):
		s_pre_marker = str(s_pre_marker) + str(line.replace(('django.contrib.admin'), ('rest_framework')))
	if(line.find('INSTALLED_APPS') == True ):
		apps_found = True
fin1.close()

apps_found = False

fin2=open('config/settings.py','r')
for line in fin2:
	if(apps_found == True):
		s_post_marker = str(s_pre_marker) + str(line)
		if(line.count('INSTALLED_APPS') >= 1 ):
			apps_found = True
fin2.close()

os.system('sudo rm config/settings.py')


fout3=open('config/settings.py','w')

fout3.write(str(s_pre_marker))
fout3.write(str(s_post_marker))

" > stage1_auto_d.py


touch api_auto_xxx/steps_5_plus_pregame.sh
chmod 777 api_auto_xxx/steps_5_plus_pregame.sh


echo "This second shell script will be created and placed into the new folder"
echo "This will enable you to complete the remaining steps of the pregame"
echo "Just cd into that directory and execute that shell script to finish it."

echo "# step 3a
git init

# step 3b
cp ~/workspace/final_project_reflections/my2_branch_reflect/reflections-project/.gitignore .
git add .gitignore

# step 3c
git commit -m 'hopefully first commit'

# step 4
touch requirements.txt
pip freeze > requirements.txt

# step 5
django-admin startproject config .

# step 6
python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py migrate

# step7.1
# python3 manage.py runserver


sudo cp ../stage1_auto_d.py .


git add config
git add requirements.txt
git add stage1_auto_d.py
git add steps_5_plus_pregame.sh

git commit -m 'added all our files just prior to final step of the pregame'

# step 9

python3 manage.py startapp api


# final step of pregame:
python3 stage1_auto_d.py

# ...and just to be on the safe side:
python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py migrate

echo 'The automatic setup of your Django Rest API is now complete.  This is stage 1 of the auto-setup process.'
echo 'Stage 2 --if we decide to pursue this-- is essentially just going to be setting up those SEVEN PRIMARY PYTHON MODULES within this API.'

echo '
from .models import runserver
admin.site.register(User)
' >> api/admin.py


" > api_auto_xxx/steps_5_plus_pregame.sh

chmod 777 api_auto_xxx/steps_5_plus_pregame.sh

echo "now cd into the api_auto_xxx folder you created and execute the shell script within it to continue"


echo 'this is where the seven python modules that need to be entered manually by'
echo 'hand normally-- which typically require significant manual modifications.'
echo 'these python modules will need significant alterations prior to this django'
echo 'rest API being functional.  The following code is designed to over-ride the'
echo 'normally lengthy and complex process of setting up each of these python'
echo 'files manually for each model or field you wish to add or alter using inputs '
echo 'you will enter at the outset, momentarily.  The easiest way to do this is'
echo 'by simply setting up a .csv from a libreoffice or excel spreadsheet with '
echo 'model names at the top of each column and fields in the column directly '
echo 'beneath them.  Any cell in the top row labeled NOMODEL will not be included.'
echo 'Any field cell beneath that first row labeled NA will not be included.  If'
echo 'you wish, you may exit this process using ctrl+d and ctrl+c now and create '
echo 'a .csv file in order to perform this task-- you will be able to safely start'
echo 'the whole process again from scratch, the same way you did initially.'

echo 'Alternatively, a slightly slower approach-- except perhaps if your intended'
echo 'creation will contain only a few models and fields-- would'
echo 'be to input the models and fields into the code following prompts.  To do'
echo 'Simply enter NO at the initial prompt to use this method instead.'

echo 'Remember: all any of this code will do for you is get you off the ground.'
echo 'If this code is functioning properly then simply entering the names of '
echo 'fields and models using either method mentioned should create a fully'
echo 'functional django rest API right from the start-- without any need for '
echo 'further manual alterations from the user.  Simply using '
echo 'python3 manage.py runserver and entering the URL displayed in the terminal'
echo 'into firefox with admin/ added at the end should get you to the log in '
echo 'screen for a fully functional API-- python3 manage.py createsuperuser '

echo '...after that your basic setup will be complete.  After the setup of '
echo 'these 7 modules is complete I will go into more detail on what this means'
echo 'and how best to proceed past this point.'

sudo rm -r seven_namesakes
mkdir seven_namesakes
outer_folder='seven_namesakes/'

csv_reply=""

echo 'Enter a .csv file separated by spaces that contains models at the top of each column followed by their fields below them'
echo '...otherwise just say NO here to type the fields and models in directly when prompted one by one: '
read csv_reply

# ------------------- START OF DIRECT ENTRY INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
if [ "$csv_reply" == "NO" ]
	then
	echo 'how many models do you want to make to start out with?'
	read num_models
	echo 'what is the name of the first model you wish to create?'
	read model_name
	echo 'how many fields do you want to make for this model?'
	read num_fields
	shortfolder='dir'
	echo $model_name >> $outer_folder$shortfolder$num_models
	startingmodels=$num_models
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
				touch $outer_folder$shortfolder$num_models
				echo $model_name >> $outer_folder$shortfolder$num_models
			fi
		else
			echo 'what would you like this field to be named?'
			read field_name
			echo $field_name >> $outer_folder$shortfolder$num_models
			num_fields=$[ $num_fields -1 ]
		fi
		echo "models remaining to set up: "$num_models
		echo "fields remaining to set up: "$num_fields
	done

	input1=$outer_folder$shortfolder$num_models

	line1model=''
	line2plusfields=''
	countforfields=0

	# this is the final product thatll become models.py:
	models_info1='models_alt.py'


	echo '' > $outer_folder$models_info1
	# models_alt.py

	num_models=$[ $num_models +1 ]
	#num_models=$[ $num_models +1 ]
	input1=$outer_folder$shortfolder$num_models

	echo "num_models just prior to start of while loop is: ${num_models}"
	echo "input1 just prior to start of while loop is: ${input1}"
	echo "output location just prior to start of while loop is: ${outer_folder}${models_info1} so that is where text from models will output to"

	while [ "$num_models" -lt "$startingmodels" ]
	do
		while read -r line
		do
			set $line
			echo $line
			if [ "$countforfields" -lt 1 ]
			then
					line1model=$line
					outputline="class ${line1model}(models.Model):"
					echo $outputline >> $outer_folder$models_info1

			else
					line2plusfields=$line
					outputline="	${line2plusfields} = models.CharField(max_length=255, null=False)"
					echo $outputline >> $outer_folder$models_info1
			echo "	tab test this line should be slightly indented"
			fi
			countforfields=$[ $countforfields +1 ]
			# echo $outputline >> $outer_folder$shortfolder$num_models
		done < $input1
	num_models=$[ $num_models +1 ]
	# we need to continually update our input like this to make sure get the correct input:
	input1=$outer_folder$shortfolder$num_models
	echo "input1 after the completion of a single cycle outside the first while loop but inside the second: ${input1}"
	done
	input1=$outer_folder$shortfolder$num_models

# ------------------- END OF DIRECT ENTRY INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------

# ------------------- START OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------

else
	# default input1 is spaces_only.csv which we will leave as this as for quicker testing and debugging until done
	# ...however once finished it will revert back to $csv_reply --since we've confirmed this manual entry works
	input1=$csv_reply
	output1=""

	s2_field_count=1

	# this just counts everything that gets read out so we can use an if
	# conditional to check if the models have been dislayed yet
	tot_num_all_mf=0

	num_fields=5
	let num_fields_less_one=num_fields+1

	num_fields_counted=1

	dir="dir"
	mod_now=""

	serializers_fields="<--<--two-indents fields = ("


	while read -r line
	do
		set $line

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

	linec=1
	line_count_mf=1
	countforfields=1
	f1=""
	m1=""
	mf1=0
	mf1_plus=0

	# admin.py get imports from m_all and then object strings from pt2:
	m_all=""
	first_m=""

	a2_pt2="zzz"
	sense_of_self=""
	echo "" > a2_pt2_file
	echo "" > m1_file
	# namesake-ification of 7 python modules:

	# admin.py, models.py, and serializers.py:
	echo "from django.contrib import admin" > a2_file
	echo "from django.db import models" > m2_file
	echo "from rest_framework import serializers" > s2_file

	# for tests.py:
	echo "import unittest" > t2_file
	echo "from django.test import TestCase" >> t2_file
	echo "from django.test import Client" >> t2_file

	# first urls.py which lives in folder with 6 .py modules together:
	echo 'from django.urls import path' > u2_main_file

	# views.py:
	echo 'from rest_framework.views import APIView' > v2_file
	echo 'from rest_framework.response import Response' >> v2_file
	echo 'from rest_framework import status' >> v2_file

	echo 'from django.contrib import admin' > u2_alone_config
	echo 'from django.urls import path, include, re_path' >> u2_alone_config
	echo 'urlpatterns = [' >> u2_alone_config
	echo '<--indent    path('admin/', admin.site.urls),' >> u2_alone_config
	echo "<--indent    re_path('api/(?P<version>(v1|v2))/', include('api.urls'))" >> u2_alone_config
	echo ']' >> u2_alone_config

	for file in dir[1-99]; do
		# more +number5 dir2
		wc -l $file | awk '{print $1}' | cat > lc_mf
		while read -r line; do set $line; mf1=$(echo $1); done < lc_mf
		let mf1_plus=mf1+1

		while [ "$countforfields" -le "$mf1" ]
		do
			if [ "$countforfields" -lt 2 ]
			then
				head -n $countforfields $file | cat >> m1_file
				while read -r line; do set $line; m1=$(echo $1); done < m1_file
				outputline="class ${m1}(models.Model):"
				echo $outputline >> m2_file
				echo "from .views import ${m1}View" >> u2_main_file

				echo "" >> v2_file
				echo "from .models import ${m1}" >> v2_file
				echo "from .serializers import ${m1}Serializer" >> v2_file

				echo "class ${m1}View(APIView):" >> v2_file
				echo "<--indent def get(self, request, version, format=None):" >> v2_file
				echo "<--<--two indents ${m1,,} = ${m1}.objects.all()" >> v2_file
				echo "<--<--two indents serializer = ${m1}Serializer(${m1,,}, many=True)" >> v2_file
				echo "<--<--two indents return Response(serializer.data)" >> v2_file

				# url_pat2="View.as_view(), name=\"user-all\""

				echo "urlpatterns = [" >> u2_main_file
				echo "<--indent path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\"" >> u2_main_file
				echo "]" >> u2_main_file
				echo "" >> u2_main_file

				echo "" >> s2_file

				echo "from .models import ${m1}" >> s2_file

				echo "class ${m1}Serializer(serializers.ModelSerializer):" >> s2_file
				echo "<--one-indent class Meta:" >> s2_file
				echo "<--<--two-indents model = ${m1}" >> s2_file
				# now we get admin.py done:
				if [ "$a2_pt2" == "zzz" ]
				then
					m_all="from .models import ${m1}"
					a2_pt2=""

				else
					m_all="${m_all}, ${m1}"
				fi
				if [ "$countforfields" -lt 2 ]
				# if [ "$a2_pt2" == "xxx" ]
				then
					a2_pt2="${m1}"
					echo $a2_pt2 >> a2_pt2_file
				fi

			else
				head -n $countforfields $file | cat > f1_file
				while read -r line; do set $line; f1=$(echo $1); done < f1_file
				placeholder_s='<--indent return "{} - {}".format('

				while read -r line; do set $line; sense_of_self="${sense_of_self}self.$1, "; done < f1_file

				# sense_of_self
				while read -r line; do set $line; sense_of_self="class ${m1}(models.Model):"; done < f1_file

				outputline="	<--indent ${f1} = models.CharField(max_length=255, null=False)"
				echo $outputline >> m2_file

				let s2_field_count=$s2_field_count+1
				if [ "$s2_field_count" -ge "$mf1" ]
				then
					s_outputline="\"${f1}\""
				else
					s_outputline="\"${f1}\", "
				fi

				# while read -r line; do set $line; serializers_fields=$serializers_fields$s_outputline; done < f1_file
				serializers_fields=$serializers_fields$s_outputline
				echo "------------------------------------------------------------------"
				echo "------------------------------------------------------------------"
				echo "for debug purposes: f1 at this moment is: ${f1}"
				echo "...and s_outputline is: ${s_outputline}"
				echo "...and serializers_fields is: ${serializers_fields}"
				echo "...and number of fields plus model is: ${mf1}"
				echo "------------------------------------------------------------------"
				echo "------------------------------------------------------------------"

				outputline=""
				f1=""
			fi
			let countforfields=countforfields+1
		done

		serializers_fields="${serializers_fields})"
		echo ""
		echo "--------------------------------"
		echo $serializers_fields >> s2_file
		echo "--------------------------------"
		echo ""
		sense_of_self="${sense_of_self})"
		sense_of_self=$placeholder_s$sense_of_self
		echo "def __str__(self):" >> m2_file
		echo $sense_of_self >> m2_file
		countforfields=1
		serializers_fields="<--<--two-indents fields = ("
		sense_of_self=""
		s2_field_count=1
	done

	# admin.py get imported models once assembled:
	echo $m_all >> a2_file

	echo a2_pt2_file just prior to very end where a2_file gets finished:
	cat a2_pt2_file
	echo ...a2_file on the other hand just prior to while loop ending looks like this:
	cat a2_file
	echo ...a1 on the other hand just prior to while loop ending looks like this:
	echo $a1

	w_count=0
	while read -r line
	do
		if [ "$w_count" -lt 1 ]
		then
			echo ""
		else
			set $line
			a1="admin.site.register($1)"
			echo $a1 >> a2_file
			echo "a1 is $1"
		fi
		let w_count=w_count+1
	done < a2_pt2_file

# ------------------- END OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
fi










# head -n $countforfields $file
