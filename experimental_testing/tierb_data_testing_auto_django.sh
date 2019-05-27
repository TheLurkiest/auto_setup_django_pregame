#!/bin/bash
# Brent Fanning
# Comp 705

# step1
echo 'remember to activate your virtual environment before executing this or going further'

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
echo 'This shell script you have just executed will implement all the tedious and'
echo 'time-consuming steps needed to setup a Django Rest API with basic functionality.'
echo '------------------------------------------------------------------------'
echo ' '
csv_reply=""

echo 'you must have a .csv file already created to continue-- if not, use ctrl+d/ctrl+c to exit this code and use the info below to create one before starting this process again.'
echo "to input models and fields into your API you must create a .csv file with models at the top, fields below them, seperated by a single space."
echo "if you have never done this before it is quite simple to implement-- simply create a spreadsheet using excel or libreoffice and enter text into the cells in the following manner: "
echo '1) model names go in the top row'
echo '2) the fields of each model go right below them (within the same column of the model they are within)'
echo '3) save as --> choose .csv in drop-down menu --> field delimeter: (just put a space in that box), string delimeter: (just delete everything in that box) --> hit ok -->'
echo ' '
echo '>>>> for more advanced info/options regarding this .csv setup enter ADVANCED now-- otherwise hit any key to continue'
read csv_reply
if [ "$csv_reply" == "ADVANCED" ]
then
	echo '4) to write down any additional text that will not be read into the API (like names, dates, etc.) just put NOMODEL into the top row or some column, and you will be able to freely enter whatever text you wish into the cells within that column beneath that initial top row.'
fi

echo '----------------------------------------------------------------------------------------------------------'
echo 'Enter the name of your .csv file below or say NO here to enter fields and models manually: '
read csv_reply



mkdir api_auto_xxx
touch stage1_auto_d.py

chmod 777 stage1_auto_d.py

echo "import os

print('step 1: if virtual environment is not active, ctrl+c/d out of this python code')
print('...and then activate the virtual environment first before running this again')

print(' ')
print('------------------------------------------------------------------')
p_reply = ''
p_reply = input('press ANY KEY to continue automatic default setup or enter SKIP if you have already finished and tested this API and wish to make further alterations by adding new fields to existing models.')


if (p_reply.upper() != 'SKIP'):

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

	fout3.close()




	apps_found = False

	fin1=open('config/settings.py','r')
	s_pre_marker=''
	s_post_marker=''
	for line in fin1:
		if(apps_found == False):
			s_pre_marker = str(s_pre_marker) + str(line)
		if(line.count('django.contrib.admin') >= 1):
			s_pre_marker = str(s_pre_marker) + str(line.replace(('django.contrib.admin'), ('api')))
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

	fout3.close()












else:
	# ----------------------------------------------------------------------------
	# here is where we can potentially choose to add new fields to existing files:
	# ----------------

	print('If you have not yet tested out that this API currently works by going ')
	print('to the url listed when the terminal command python3 manage.py runserver')
	print('is used, and checking that the url listed within the terminal upon ')
	print('running that terminal command leads you to a working website then')
	print('answer NO to the following question.  This feature can be used in the')
	print('future to add new fields to your models once it has been fully')
	print('implemented-- but wait until you have tested the base setup first.')

	print(' ')
	print('NOTE: this feature is still under development-- not all changes are')
	print('automatically implemented.  The following modules still need auto-')
	print('alteration features added to make this option fully automatic:')
	print('models.py, serializers.py, urls.py, ')

	print('once tests.py has had its basic setup it will also need to have ')
	print('features added here to make the new changes compatible will the')
	print('new models.')

	p_reply2 = ''
	p_reply2 = input('Would you like to add a new field?')
	p_reply = input('What is the name of the model you want to add that field to?')

	model1 = p_reply

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

	print('use the following two terminal commands to implement any changes: ')
	print('python3 manage.py makemigrations')
	print('python3 manage.py migrate')
	# ----------------------------------------------------------------------------

" > stage1_auto_d.py








touch api_auto_xxx/finish_my_api.sh
chmod 777 api_auto_xxx/finish_my_api.sh


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

sudo cp ../stage1_auto_d.py .


git add config
git add requirements.txt
git add stage1_auto_d.py
git add finish_my_api.sh

git commit -m 'added all our files just prior to final step of the pregame'

# step 9

python3 manage.py startapp api


# final step of pregame:
python3 stage1_auto_d.py

echo 'The automatic portion of the Django Rest API setup is now complete.'
echo 'Now for testing and implementation of changes-- '



echo '
from .models import runserver
admin.site.register(User)
' >> api/admin.py



cp ../seven_namesakes/admin.py api/
cp ../seven_namesakes/models.py api/
cp ../seven_namesakes/config/urls.py config/

cp ../seven_namesakes/tests.py api/
cp ../seven_namesakes/views.py api/
cp ../seven_namesakes/serializers.py api/
cp ../seven_namesakes/urls.py api/

python manage.py makemigrations
python manage.py migrate

echo 'use the following command:'

echo 'python manage.py runserver'

echo '...and copy the url displayed in the terminal into your firefox browser to test it.  '
echo 'adding admin/ to the end will let you view the login screen'
echo 'once this is confirmed, go back to the terminal hit ctrl+c'
echo 'then you can set up the manner with which you want to log in using: '

echo 'python manage.py createsuperuser.py'

echo 'that should give you everything you need to get through the login screen'




" > api_auto_xxx/finish_my_api.sh

chmod 777 api_auto_xxx/finish_my_api.sh

echo "now cd into the api_auto_xxx folder you created and execute the shell script within it called finish_my_api.sh to continue"

sudo rm -r seven_namesakes
mkdir seven_namesakes
mkdir seven_namesakes/config
outer_folder='seven_namesakes/'



# ------------------- START OF DIRECT ENTRY INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
if [ "$csv_reply" == "NO" ]
then
	echo 'this option has been removed for the time being for simplicity.'
# ------------------- START OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
else
	csv_reply2=""
	echo "if you have a 2nd .csv file containing info pertaining to the details "
	echo "and specific data types of the given fields and modules enter it now--"
	echo "--otherwise enter SKIP to continue"
	read csv_reply2
	if [ "$csv_reply2" != "SKIP" ]
	then
		placeholder_s='	return "{} - {}".format('
		input1b=$csv_reply2
		output1=""
		s2_field_count=1
		tot_num_all_mf=0
		num_fields=5
		let num_fields_less_one=num_fields+1
		num_fields_counted=1
		dir="dir"
		dir_b="dir_b"
		mod_now=""
		serializers_fields="fields = ("
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
						rm $dir_b$num_fields_counted
					else
						echo "${!num_fields_counted}" > $dir_b$num_fields_counted
					fi
					let num_fields_counted=num_fields_counted+1
				else
					if [ "${!num_fields_counted}" == "NA" ]
					then
						let tot_num_all_mf=99
						# null statement alters now pointless variable
					else
						echo "${!num_fields_counted}" >> $dir_b$num_fields_counted
					fi

					let num_fields_counted=num_fields_counted+1
				fi
			done

			let num_fields_counted=0
			let tot_num_all_mf=tot_num_all_mf+1

		done < $input1b
	else
		echo '--ok a default CharField will be used for all fields for now'
		f_dtype='Char'
		f_dtype2="max_length=255, null=False"
	fi


	placeholder_s='	return "{} - {}".format('
	input1=$csv_reply
	output1=""
	s2_field_count=1
	tot_num_all_mf=0
	num_fields=5
	let num_fields_less_one=num_fields+1
	num_fields_counted=1
	dir="dir"
	dir_b="dir_b"
	mod_now=""
	serializers_fields="fields = ("


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
	echo "from django.contrib import admin" > seven_namesakes/admin.py
	echo "from django.db import models" > seven_namesakes/models.py
	echo "from rest_framework import serializers" > seven_namesakes/serializers.py

	# for tests.py:
	echo "import unittest" > seven_namesakes/tests.py
	echo "from django.test import TestCase" >> seven_namesakes/tests.py
	echo "from django.test import Client" >> seven_namesakes/tests.py

	# first urls.py which lives in folder with 6 .py modules together:
	echo 'from django.urls import path' > seven_namesakes/urls.py

	# views.py:
	echo 'from rest_framework.views import APIView' > seven_namesakes/views.py
	echo 'from rest_framework.response import Response' >> seven_namesakes/views.py
	echo 'from rest_framework import status' >> seven_namesakes/views.py

	echo 'from django.contrib import admin' > seven_namesakes/config/urls.py
	echo 'from django.urls import path, include, re_path' >> seven_namesakes/config/urls.py
	echo 'urlpatterns = [' >> seven_namesakes/config/urls.py
	echo "	path('admin/', admin.site.urls)," >> seven_namesakes/config/urls.py
	echo "	re_path('api/(?P<version>(v1|v2))', include('api.urls'))" >> seven_namesakes/config/urls.py
	echo ']' >> seven_namesakes/config/urls.py

tier_b_info=''

model_count_now=1

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

				head -n $countforfields $dir_b$model_count_now | cat >> m1_file_b
				while read -r line; do set $line; m1_b_tier=$(echo $1); done < m1_file_b
				f_dtype=$m1_b_tier


				for line in $(cat alt_f_test2); do echo "${line}"; done

				outputline="class ${m1}(models.Model):"
				echo $outputline >> seven_namesakes/models.py
				echo "from .views import ${m1}View" >> seven_namesakes/urls.py

				echo "" >> seven_namesakes/views.py
				echo "from .models import ${m1}" >> seven_namesakes/views.py
				echo "from .serializers import ${m1}Serializer" >> seven_namesakes/views.py

				echo "class ${m1}View(APIView):" >> seven_namesakes/views.py
				echo "	def get(self, request, version, format=None):" >> seven_namesakes/views.py
				echo "		${m1,,} = ${m1}.objects.all()" >> seven_namesakes/views.py
				echo "		serializer = ${m1}Serializer(${m1,,}, many=True)" >> seven_namesakes/views.py
				echo "		return Response(serializer.data)" >> seven_namesakes/views.py

				# url_pat2="View.as_view(), name=\"user-all\""

				echo "urlpatterns = [" >> seven_namesakes/urls.py
				echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls.py
				echo "]" >> seven_namesakes/urls.py
				echo "" >> seven_namesakes/urls.py

				echo "" >> seven_namesakes/serializers.py

				echo "from .models import ${m1}" >> seven_namesakes/serializers.py

				echo "class ${m1}Serializer(serializers.ModelSerializer):" >> seven_namesakes/serializers.py
				echo "	class Meta:" >> seven_namesakes/serializers.py
				echo "		model = ${m1}" >> seven_namesakes/serializers.py
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

				head -n $countforfields $dir_b$model_count_now | cat >> m1_file_b
				while read -r line; do set $line; m1_b_tier=$(echo $1); done < m1_file_b
				f_dtype=$m1_b_tier


				if [ "$countforfields" -lt 3 ]
				then
					placeholder_s="${placeholder_s}self.${f1}"
				else
					sense_of_self="${sense_of_self}, self.${f1}"
				fi

				# sense_of_self
				# while read -r line; do set $line; sense_of_self="class ${m1}(models.Model):"; done < f1_file
				if [ "$f_dtype" == "Integer" ]
				then
					f_dtype2="default=99"
				else
					f_dtype2="max_length=255, null=False"
				fi

				outputline="${f1} = models.${f_dtype}Field(${f_dtype2})"
				echo "	${outputline}" >> seven_namesakes/models.py

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
		echo "		${serializers_fields}" >> seven_namesakes/serializers.py
		echo "--------------------------------"
		echo ""
		sense_of_self="${sense_of_self})"
		sense_of_self=$placeholder_s$sense_of_self
		echo "	def __str__(self):" >> seven_namesakes/models.py
		echo "	${sense_of_self}" >> seven_namesakes/models.py
		countforfields=1
		serializers_fields="fields = ("
		sense_of_self=""
		s2_field_count=1
		placeholder_s='	return "{} - {}".format('

		model_count_now=$model_count_now+1

	done

	# admin.py get imported models once assembled:
	echo $m_all >> seven_namesakes/admin.py

	echo a2_pt2_file just prior to very end where seven_namesakes/admin.py gets finished:
	cat a2_pt2_file
	echo ...seven_namesakes/admin.py on the other hand just prior to while loop ending looks like this:
	cat seven_namesakes/admin.py
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
			echo $a1 >> seven_namesakes/admin.py
			echo "a1 is $1"
		fi
		let w_count=w_count+1
	done < a2_pt2_file

# ------------------- END OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
fi




rm f1_file
rm a2_pt2_file
rm m1_file
rm lc_mf
rm dir[1-4]

echo ""
echo "-----------------------------------------------------------------------"
echo "to complete the setup of this API, use the following terminal commands: "
echo "cd api_auto_xxx"
echo "...followed by:"
echo "./finish_my_api"




# head -n $countforfields $file
