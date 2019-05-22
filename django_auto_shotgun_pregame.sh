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




















