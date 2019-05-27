import os

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


