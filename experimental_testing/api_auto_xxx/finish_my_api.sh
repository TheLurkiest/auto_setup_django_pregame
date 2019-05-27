# step 3a
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





