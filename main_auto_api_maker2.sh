#!/bin/bash
# Brent Fanning
# Comp 705

# step1


rm dir_b[0-9]
rm dir_a[0-9]
rm dir[0-9]

dir_b="dir_b"

echo 'remember to activate your virtual environment before executing this or going further'

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
echo 'This shell script you have just executed will implement all the tedious and'
echo 'time-consuming steps needed to setup a Django Rest API with basic functionality.'
echo '------------------------------------------------------------------------'
echo ' '
csv_reply="xa.csv"

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
  echo '5) you may also enter an optional 2nd .csv momentarily when prompted to specify data types for each field.'
  echo '--just set up your .csv the same as before, but with Integer, Date, Float, and Char within each cell which contains a field of that datatype.  Entering other datatypes besides these via this automation may be problematic.'
fi

echo '----------------------------------------------------------------------------------------------------------'
echo 'Enter the name of your .csv file below or say NO here to enter fields and models manually: '
read csv_reply

# default right now is xb.csv for csv_reply2
csv_reply2='xb.csv'

echo 'Enter a secondary .csv file if you wish to generate specific data types for each field-- otherwise, enter \"SKIP\" now to use default settings: '
read csv_reply2






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








echo "

# @2222222222222222222222222

import os

q_marker='= models.CharField(max_length=255, null=False)'
q_count=1
b_count=1


m1_count=0
l_m1=[]
list_m1=[]
b_fin2=open('m1_file','r')
for line_b in b_fin2:
	#l_m1=b_fin2.readlines(b_count)
	if(len(str(line_b))>2):
		list_m1.append(str(line_b[:-1]))
		print('model: '+str(list_m1))


b_fin2.close()
m1_count=len(list_m1)
print('there are this many models: '+str(m1_count))

f_types_per_m1=[]


















for dir_b_file in range(1,(m1_count+1)):
	b_fin2=open(('dir_b'+str(dir_b_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>2):
			f_types_per_m1.append(str(line_b[:-1]))
			# print('model: '+str(f_types_per_m1))
b_fin2.close()


m1_count=len(list_m1)
print('this is the list: '+str(f_types_per_m1))
print('this are this many total fields in all combined lists: '+str(len(f_types_per_m1)))


fields_per_m1=[]

for dir_file in range(1,(m1_count+1)):
	b_fin2=open(('dir'+str(dir_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>2):
			fields_per_m1.append(str(line_b[:-1]))
			# print('model: '+str(fields_per_m1))
b_fin2.close()


m1_count=len(list_m1)
print('this is the list: '+str(fields_per_m1))
print('this are this many total fields in all combined lists: '+str(len(fields_per_m1)))



count_f_per_m1=[]

for dir_b_file in range(1,(m1_count+1)):
	b_fin2=open(('lc_mf'+str(dir_b_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>=1):
			count_f_per_m1.append(int(line_b[:-1]))
			# print('model: '+str(f_types_per_m1))
b_fin2.close()
print('this is how many fields I have for the respective models: '+str(count_f_per_m1))
lists_of_types=list(range(1,(m1_count+1)))
# count_all_m_spots=count_f_per_m1
types_per_seg = 0
current_fields_out=0

current_type=''






print('\n------------------------\n')
print('count_f_per_m1 is: '+str(count_f_per_m1))
print('length of count_f_per_m1 is: '+str(len(count_f_per_m1)) )
print('\n...we should instead use f_types_per_m1: '+str(f_types_per_m1))
print('\n...which has length of: '+str(len(f_types_per_m1)))

#for elem_m1 in list_m1:
#p_reply=input('breakup code debug')



for elem_t in range(0,(m1_count)):
	#b_fin2=open(('lc_mf'+str(dir_b_file)),'r')

	current_fields_out=1
	print('current_fields_out: '+str(current_fields_out))
	print('fields_per_m1: '+str(fields_per_m1))

	types_per_seg = str(fields_per_m1[current_fields_out])

	print('types_per_seg is '+str(types_per_seg))

	print(' count_f_per_m1 '+str(count_f_per_m1))


	while(current_fields_out <= int(count_f_per_m1[int(elem_t)])):
		print('from while loop: count_f_per_m1 ' + str(count_f_per_m1) )
		print('from while loop: current_fields_out ' + str(current_fields_out))
		print('from while loop: current_fields_out must be less than this: ' + str( count_f_per_m1[int( elem_t )]) )

		if(elem_t<len(list_m1)):
			print('model number '+str(elem_t)+'- model is: '+str(list_m1[elem_t]))
		#print('model number '+str(elem_t)+' contains '+str(types_per_seg)+' types.')
		#types_per_seg
		# = int(f_types_per_m1[types_segment])
		print('the current type is: '+str(f_types_per_m1[current_fields_out]))

		print('the current field is: '+str(fields_per_m1[current_fields_out]))
		#print('other thing: '+str(count_f_per_m1[current_fields_out]))

		current_fields_out=current_fields_out+1

		# what sort of info do we need to be able to return it back to where
		# it's needed?  I am just trying to get a bunch of types...

	# ============================================================
	for mod_elem in range(0,(m1_count)):
		current_fields_out=0
		print('final for loop starts here:')
		w_out=''
		w_out_arr=[]
		w_out2=''
		w_out2_arr=[]
		for type_elem in (range(0, int(count_f_per_m1[mod_elem]) )):
			# current_fields_out=current_fields_out+1

			w_out_arr.append(str(fields_per_m1[type_elem]))
			w_out=str(w_out)+str(fields_per_m1[type_elem])
			w_out2=str(w_out2)+str(f_types_per_m1[type_elem])
			w_out2_arr.append(str(f_types_per_m1[type_elem]))

			type_elem=int(type_elem)
			if (type_elem == int(count_f_per_m1[mod_elem] ) ):
				print('writing out files now!')
				b_fout_end=open(('current_fields_out'+str((count_f_per_m1[type_elem]))),'w')
				b_fout_end.write(str(w_out))
				b_fout_end.close()
				#b_fout_end=open(('current_field_types_out'+str(type_elem)),'w')
				b_fout_end=open(('current_field_types_out'+str( (count_f_per_m1[type_elem]) ) ),'w')
				b_fout_end.write(str(w_out2))
				b_fout_end.close()
			current_fields_out=current_fields_out+1

arr_combo=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	arr_combo.append('	'+str(w_out_arr[c_arr2])+' = models.'+str(f_types_arr)+'Field(max_length=250, null=False)')
























print('writing out field type files now!')
b_fout_end=open('field_types_edit.txt' ,'w')

for arr_elem in arr_combo:
	b_fout_end.write(str(arr_elem) + '\n')
b_fout_end.close()


change_field_type_found=False
mod_assigned = False
apps_found = False

print('The new lines intended to potentially generate classes and models')
print('and fields of specific types were placed in the current directory in a folder called field_types_edit.txt')








#======================================

arr_combo_feedback=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	arr_combo_feedback.append(str(w_out_arr[c_arr2])+' '+str(f_types_arr))

count_all_m_spots=count_f_per_m1
count_all_m_spots.insert(0,0)
del count_all_m_spots[-1]

b_fin2=open('csv_feedback1.csv','w')
b_sum1=0
for elem_spot in count_all_m_spots:
	b_sum1=b_sum1+int(elem_spot)
	b_fin2.write(str(fields_per_m1[b_sum1]))

# b_fin2=open('csv_feedback1.csv','w')
# for elem_spot in count_all_m_spots:
	# b_fin2.write(str(fields_per_m1[elem_spot]) + ' ')

b_sum1=0
b_sum_list=[]
for c_spot, elem_spot in enumerate(count_all_m_spots):
	count_new=0
	b_sum1=b_sum1+int(elem_spot)
	b_sum_list.append(b_sum1)
	#while(len(arr_combo_feedback[:(b_sum1 + count_new)]) < )
		#b_fin2.write(str(fields_per_m1[elem_spot]) + ' ')
		#count_new=count_new + 1

#======================================

b_sum_list_alt2=b_sum_list









print('\n------------------------\n')
print('b_sum_list is: '+str(b_sum_list))

#p_reply=input('breakup code debug')










# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out2_arr is: '+str(w_out2_arr))
print('w_out_arr length is: '+str(len(w_out2_arr)))
print('\n-----------------------------------------------------------------\n')
#p_reply=input('breakup code 2')

other_pre_marker=''

s_count=0
sum1=0
#fin1=open('models.py','r')
s_pre_marker=''
s_pre_marker2=''
























# f_types_per_m1


new_full_final_types=f_types_per_m1

# len(new_full_final_types)
# 41

#new_full_final_types.insert(0, 'aaa')


for c_bs, bs_elem in enumerate(b_sum_list):
	new_full_final_types.insert( int( bs_elem ), list_m1[c_bs] )

index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		#new_full_final_types.insert(0, 'aaa')
		print('null')
	else:
		new_full_final_types.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1
		#new_full_final_types.insert(elem_index+index_count, 'zzz' )
		#index_count=index_count+1

# len(new_full_final_types)
# 50

new_full_final_types.insert(len(new_full_final_types), 'zzz' )
new_full_final_types.insert(len(new_full_final_types), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_types is: '+str(new_full_final_types))
print('new_full_final_types length is: '+str(len(new_full_final_types)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


f_types_per_m1_2=f_types_per_m1
f_types_per_m1=[]
for f_per_m1_elem in f_types_per_m1_2:
	if(f_per_m1_elem != 'zzz'):
		f_types_per_m1.append(f_per_m1_elem)



print('\nf_types_per_m1 is:\n'+str(f_types_per_m1))
#p_reply=input('breakup code 2')


index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		del new_full_final_types[0]
		new_full_final_types.insert(0, 'aaa')
		print('null')
	else:
		index_count=index_count+1
		f_types_per_m1.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

f_types_per_m1.append('zzz' )
f_types_per_m1.append('zzz' )



print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('f_types_per_m1 is '+str(f_types_per_m1)+' and length is: '+str(len(f_types_per_m1)))
# p_reply = input('testing 123')
#p_reply = input('f_types_per_m1 is '+str(f_types_per_m1)+' and length is: '+str(len(f_types_per_m1)))


# f_types_per_m1# f_types_per_m1


new_full_final_types=f_types_per_m1






























# fields_per_m1


new_full_final_fields=fields_per_m1

# len(new_full_final_fields)
# 41

#new_full_final_fields.insert(0, 'aaa')


for c_bs, bs_elem in enumerate(b_sum_list):
	new_full_final_fields.insert( int( bs_elem ), list_m1[c_bs] )

index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		#new_full_final_fields.insert(0, 'aaa')
		print('null')
	else:
		new_full_final_fields.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1
		#new_full_final_fields.insert(elem_index+index_count, 'zzz' )
		#index_count=index_count+1

# len(new_full_final_fields)
# 50

new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )
new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_fields is: '+str(new_full_final_fields))
print('new_full_final_fields length is: '+str(len(new_full_final_fields)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


fields_per_m1_2=fields_per_m1
fields_per_m1=[]
for f_per_m1_elem in fields_per_m1_2:
	if(f_per_m1_elem != 'zzz'):
		fields_per_m1.append(f_per_m1_elem)



print('\nfields_per_m1 is:\n'+str(fields_per_m1))
p_reply=input('breakup code 2')


index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		del new_full_final_fields[0]
		new_full_final_fields.insert(0, 'aaa')
		print('null')
	else:
		index_count=index_count+1
		fields_per_m1.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

fields_per_m1.append('zzz' )
fields_per_m1.append('zzz' )


print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('new_full_final_types is '+str(new_full_final_types)+' and length is: '+str(len(new_full_final_types)))
# p_reply = input('testing 123')
p_reply = input('fields_per_m1 is '+str(new_full_final_types)+' and length is: '+str(len(new_full_final_types)))


print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))
# p_reply = input('testing 123')
p_reply = input('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))


# f_types_per_m1# fields_per_m1


new_full_final_fields=fields_per_m1

# len(new_full_final_fields)
# 41

index_count=1

#for elem_index in b_sum_list:
#	if(elem_index == 0):
#		new_full_final_fields.insert(0, 'aaa')
#	else:
#		new_full_final_fields.insert(elem_index+index_count, 'zzz' )
#		index_count=index_count+1
#new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_fields is: '+str(new_full_final_fields))
print('new_full_final_fields length is: '+str(len(new_full_final_fields)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


# fields_per_m1


new_full_final=f_types_per_m1

# len(new_full_final)
# 41

index_count=index_count+1
index_count=1


b_sum_list2b=b_sum_list
for elem_index in b_sum_list2b:
	if(elem_index == 0):
		new_full_final.insert(0, 'aaa')
	else:
		new_full_final.insert(elem_index+index_count, 'zzz' )
		new_full_final.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

# len(new_full_final)
# 50

new_full_final.insert(len(new_full_final), 'zzz' )
new_full_final.insert(len(new_full_final), 'zzz' )







# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final is: '+str(new_full_final))
print('new_full_final length is: '+str(len(new_full_final)))
print('\n-----------------------------------------------------------------\n')
p_reply=input('breakup code 2')


fin1=open('seven_namesakes/models.py','r')

line_sum=''
for line in fin1:
	line_sum=line_sum+line

fin1.close()

line_sum=line_sum.split('\n')

del line_sum[-1]

print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')

# w_out2_arr
print('\n---line_sum---line_sum---line_sum---line_sum---line_sum---line_sum---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('line_sum is: '+str(line_sum))
print('line_sum length is: '+str(len(line_sum)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')

# w_out2_arr
print('\n---w_out2_arr---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out2_arr is: '+str(w_out2_arr))
print('w_out2_arr length is: '+str(len(w_out2_arr)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')

# w_out2_arr
print('\n---w_out_arr---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out_arr is: '+str(w_out_arr))
print('w_out_arr length is: '+str(len(w_out_arr)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


#for c_arr2, f_types_arr in enumerate(new_full_final):
print('\n----------------------------------\n')
print('line_sum length is: '+str(len(line_sum)))
print('new_full_final length is: '+str(len(new_full_final)))
#p_reply=input('our c_arr2 is:\n'+str(c_arr2)+'\n----------------\n...and s_pre_marker so far for final output is: \n'+str(s_pre_marker)+'\n----------------\n\n')
# new_full_final
print('main for loop for altering our field types is now active...')
s_pre_marker2=''
field_found1=False

final_line=''







#s_pre_marker=str(s_pre_marker) + str(line2.replace( ' = models.CharField(max_length=255, null=False)', str(' = models.' + str(new_full_final[line_c]) +'Field(max_length=250, null=False)' ) ) )


fk_cap=''
fk_cap2=''
print('\nfields_per_m1 is:'+str(fields_per_m1))
print('\nnew_full_final'+str(new_full_final))
# p_reply=input('breakup for debug')

# 50 fields: fields_per_m1
# 50 types: new_full_final
for line_c, line in enumerate(line_sum):
	line2=line
	print('entering line loop')
	print('s_pre_marker so far is:\n'+str(s_pre_marker))
	print('last line was: '+str(final_line)+'\n')
	print('currently-- line number '+str(line_c)+' is: '+str(line))
	# p_reply=input('debug check code break')
	if(new_full_final[line_c] == 'aaa' or new_full_final[line_c] == 'zzz'):
		line2=line
		s_pre_marker=str(s_pre_marker) + str(line2)
	elif(line2.count('(models.Model):') >= 1):
		line2=str(line)
		s_pre_marker=str(s_pre_marker) + str('class '+str(fields_per_m1[line_c])+'(models.Model):')
	elif(line2.count(' def __str__(self):') >= 1 or line2.count('.format(self.') >= 1 or line2.count('from django.db import models') >= 1):
		line2=line
		s_pre_marker=str(s_pre_marker) + str(line2)
	else:
		#p_reply=input('check for field types in ' + str(fields_per_m1[line_c]))
		if(str(new_full_final_types[line_c]) == 'Boolean' or str(new_full_final_types[line_c]) == 'Char' or str(new_full_final_types[line_c]) == 'Integer' or str(new_full_final_types[line_c]) == 'Float' or str(new_full_final_types[line_c]) == 'Date'):
			s_pre_marker=str(s_pre_marker) + str(line2.replace( ' = models.CharField(max_length=255, null=False)', str(' = models.'+str(new_full_final[line_c]) +'Field(max_length=250, null=False)' ) ))
		else:
			stage_2_s=str(fields_per_m1[line_c])
			stage_3_s=''
			for c_elem_s, elem_s in enumerate(stage_2_s):
				if(elem_s.isupper()==True):
					if(c_elem_s != 0):
						stage_3_s=stage_3_s+'_'
						stage_3_s=stage_3_s+elem_s
					else:
						stage_3_s=stage_3_s+elem_s
				else:
					stage_3_s=stage_3_s+elem_s
			stage_3_s=stage_3_s.lower()
			fk_cap=stage_3_s
			fk_cap2 = fk_cap.replace('_',' ')
			fk_cap2=fk_cap2.title()
			fk_cap2=fk_cap2.replace(' ','')
			if(list_m1.count(fk_cap2) < 1):
				s_pre_marker =str(s_pre_marker) + '	' + str(stage_3_s) + ' = models.CharField(max_length=255, null=False)'
			elif(list_m1.count(fk_cap2) >= 1):
				s_pre_marker=str(s_pre_marker) + line2.replace(str(fields_per_m1[line_c]) + ' = models.CharField(max_length=255, null=False)', str(stage_3_s) + ' = models.ForeignKey(\"'+str(fk_cap2)+'\", on_delete=models.CASCADE)' )
	s_pre_marker = s_pre_marker + '\n'
	# asadfa
	final_line=line2

print('\n=============================================\n')
print('\n=============================================\n')
print('\n=============================================\n')

# p_reply=input('final line was: '+str(final_line))





# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final is: '+str(new_full_final))
print('new_full_final length is: '+str(len(new_full_final)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('fields_per_m1 is: '+str(fields_per_m1))
print('fields_per_m1 length is: '+str(len(fields_per_m1)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')






# @@@@@@@@@@@@@@@@@@22222222


fout3=open('models.py','w')
fout3.write(str(s_pre_marker))
fout3.close()

#fout3=open('api/models.py','w')
#fout3=open('fout3_models.py','w')
#fout3.write(str(s_pre_marker))
#fout3.write(str(s_post_marker))

#fout3.close()


" > type_application_clean_slate_final.py

























touch api_auto_xxx/finish_my_api.sh
chmod 777 api_auto_xxx/finish_my_api.sh


echo "This second shell script will be created and placed into the new folder"
echo "This will enable you to complete the remaining steps of the pregame"
echo "Just cd into that directory and execute that shell script to finish it."

echo "# step 3a

cp ../m1_file .
cp ../dir_b[1-99] .
cp ../dir[1-99] .
cp ../lc_mf[1-99] .
mkdir seven_namesakes .
cp -r ../seven_namesakes/models.py seven_namesakes/
#cp -r ../seven_namesakes/models.py .
#mkdir api

git init

# step 3b

# cp ~/workspace/final_project_reflections/my2_branch_reflect/reflections-project/.gitignore .

echo '

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*\$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# celery beat schedule file
celerybeat-schedule

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/

' > .gitignore

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









field_types_added=''
echo 'enter YES if you DID add a second .csv file which contained field type info for your models: '
read field_types_added

if [ \"\$field_types_added\" == 'YES' ]
then
	echo '...starting process of incorporating type information into models.py...'
	python ../type_application_clean_slate_final.py
fi





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



cp models.py api/



python manage.py makemigrations
python manage.py migrate

echo 'use the following command:'

echo 'python manage.py runserver'


echo '...and copy the url displayed in the terminal into your firefox browser to test it.  '
echo 'adding admin/ to the end will let you view the login screen'
echo 'once this is confirmed, go back to the terminal hit ctrl+c'
echo 'then you can set up the manner with which you want to log in using: '

echo 'python manage.py createsuperuser'

echo 'that should give you everything you need to get through the login screen'

" > api_auto_xxx/finish_my_api.sh

chmod 777 api_auto_xxx/finish_my_api.sh

echo "now cd into the api_auto_xxx folder you created and execute the shell script within it called finish_my_api.sh to continue"

sudo rm -r seven_namesakes
mkdir seven_namesakes
mkdir seven_namesakes/config
outer_folder='seven_namesakes/'













if [ "$csv_reply2" != "SKIP" ]
then
	placeholder_s='	return "{}, {}".format(self.'
	input1b=$csv_reply2
	output1=""
	s2_field_count=1
	tot_num_all_mf=0
	num_fields=5

	let num_fields_less_one=num_fields+1
	num_fields_counted=1

	serializers_fields="fields = ("

	num_placeholder=0
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
					echo '' > $dir_b$num_fields_counted
					let mod_now=mod_now-1
				else
					echo "${!num_fields_counted}" >> $dir_b$num_fields_counted
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


















created_urls_list=0


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
  # input1 is seven_namesakes/dir--(model number being currently set up)


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
	output_line_urls=""

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
        num_models
				line2plusfields=$line
				outputline="	${dir_b}${num_fields_counted} = models.CharField(max_length=255, null=False)"
				#output_line_urls="	${dir_b}${num_fields_counted} = models.CharField(max_length=255, null=False)"

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
	placeholder_s='	return "{} - {}".format('
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
	echo "	re_path('api/', include('api.urls'))" >> seven_namesakes/config/urls.py
	echo ']' >> seven_namesakes/config/urls.py

  arr1=()
	lc_mf_count=0

	#created_urls_list=0
	if [ "$created_urls_list" -lt 1 ]
	then
		echo "urlpatterns = [" >> seven_namesakes/urls_one_list.py
		created_urls_list=1
	fi


	for file in dir[1-99]; do
		# more +number5 dir2
		let lc_mf_count=lc_mf_count+1

    arr1+=( $(head -n $countforfields $file) )

		wc -l $file | awk '{print $1}' | cat > lc_mf$lc_mf_count
		while read -r line; do set $line; mf1=$(echo $1); done < lc_mf$lc_mf_count
		let mf1_plus=mf1+1

		while [ "$countforfields" -le "$mf1" ]
		do
			if [ "$countforfields" -lt 2 ]
			then
				head -n $countforfields $file | cat >> m1_file
				while read -r line; do set $line; m1=$(echo $1); done < m1_file
				outputline="class ${m1}(models.Model):"
				echo $outputline >> seven_namesakes/models.py
				echo "from .views import ${m1}View" >> seven_namesakes/urls.py

				echo "" >> seven_namesakes/views.py
				echo "from .models import ${m1}" >> seven_namesakes/views.py
				echo "from .serializers import ${m1}Serializer" >> seven_namesakes/views.py

				echo "class ${m1}View(APIView):" >> seven_namesakes/views.py
				echo "	def get(self, request, format=None):" >> seven_namesakes/views.py
				echo "		${m1,,} = ${m1}.objects.all()" >> seven_namesakes/views.py
				echo "		serializer = ${m1}Serializer(${m1,,}, many=True)" >> seven_namesakes/views.py
				echo "		return Response(serializer.data)" >> seven_namesakes/views.py

				# url_pat2="View.as_view(), name=\"user-all\""

				# most recent changes to urlpatterns:
				#echo "urlpatterns = [" >> seven_namesakes/urls.py
				#echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls.py
				#echo "]" >> seven_namesakes/urls.py
				#echo "" >> seven_namesakes/urls.py

				#echo "urlpatterns = [" >> seven_namesakes/urls_one_list.py
				echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls_one_list.py
				# echo "]" >> seven_namesakes/urls_one_list.py
				#echo "" >> seven_namesakes/urls_one_list.py


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


				if [ "$countforfields" -lt 3 ]
				then
					placeholder_s="${placeholder_s}self.${f1}"
				else
					sense_of_self="${sense_of_self}, self.${f1}"
				fi


				# $break_up_code_for_debugging=''
        # dir_b="dir_b"
        # echo 'we use these user inputs to break up the code for debugging purposes:'
        # read break_up_code_for_debugging





        outputline="${f1} = models.CharField(max_length=255, null=False)"


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




echo "" >> seven_namesakes/urls.py




#echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls_one_list.py
echo "]" >> seven_namesakes/urls_one_list.py

# cat seven_namesakes/urls_one_list.py >> urls.py

head -n 99 seven_namesakes/urls_one_list.py | cat >> seven_namesakes/urls.py





echo ""
echo "-----------------------------------------------------------------------"
echo "to complete the setup of this API, use the following terminal commands: "
echo "cd api_auto_xxx"
echo "...followed by:"
echo "./finish_my_api"




# head -n $countforfields $file