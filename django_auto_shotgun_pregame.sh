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

echo '...something like: sudo python3 auto_text_cleaner1.py'

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

fin1=open('config/config/settings.py','r')
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

fin2=open('config/config/settings.py','r')
for line in fin2:
	if(apps_found == True):
		s_post_marker = str(s_pre_marker) + str(line)
		if(line.count('INSTALLED_APPS') >= 1 ):
			apps_found = True
fin2.close()

os.system('sudo rm config/config/settings.py')


fout3=open('config/config/settings.py','w')

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
django-admin startproject config

# step 6
python3 config/manage.py migrate
python3 config/manage.py makemigrations
python3 config/manage.py migrate


# step7.1
# python3 config/manage.py runserver



sudo cp ../stage1_auto_d.py .

" > api_auto_xxx/steps_5_plus_pregame.sh

chmod 777 api_auto_xxx/steps_5_plus_pregame.sh

echo "now cd into the api_auto_xxx folder you created and execute the shell script within it to continue"

cd api_auto_xxx
