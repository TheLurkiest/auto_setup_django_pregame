#!/bin/bash
# Brent Fanning
# Comp 705


# [Section 1 Test 1 Changes: Added comment for clarity]
# Remove directories that might have been created by previous runs of this script.
# Ensures a fresh start for the setup process.
rm -rf dir_b[0-9]  # [Section 1 Test 1 Changes: Use -rf to ensure removal without user intervention]
rm -rf dir_a[0-9]  # [Section 1 Test 1 Changes: Same change as above for consistency]
rm -rf dir[0-9]    # [Section 1 Test 1 Changes: Applied -rf flag for uniformity across cleanup commands]


# [Section 2 Test 1 Changes: Comment added for clarity on script purpose]
# Introduction and initial setup instructions.
# This section welcomes the user and provides initial guidelines for preparing to use the script.

echo 'remember to activate your virtual environment before executing this or going further'
# [Section 2 Test 1 Changes: Added emphasis on virtual environment activation]
echo '------------------------------------------------------------------------'

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
# [Section 2 Test 1 Changes: No change, retained original greeting for user engagement]

echo 'This shell script you have just executed will implement all the tedious and'
echo 'time-consuming steps needed to setup a Django Rest API with basic functionality.'
# [Section 2 Test 1 Changes: Enhanced description for clearer understanding of script benefits]

echo '------------------------------------------------------------------------'
echo ' '

# [Section 2 Test 1 Changes: Improved instructions for CSV preparation]
echo 'you must have a .csv file already created to continue-- if not, use ctrl+d/ctrl+c to exit this code and use the info below to create one before starting this process again.'
echo "to input models and fields into your API you must create a .csv file with models at the top, fields below them, separated by a single space."
echo "if you have never done this before it is quite simple to implement-- simply create a spreadsheet using excel or libreoffice and enter text into the cells in the following manner: "
echo '1) model names go in the top row'
echo '2) the fields of each model go right below them (within the same column of the model they are within)'
echo '3) save as --> choose .csv in the drop-down menu --> field delimiter: (just put a space in that box), string delimiter: (just delete everything in that box) --> hit ok -->'
echo ' '
echo '------------------------------------------------------------------------'
echo ''


# [Section 3 Test 1 Changes: Begin CSV Preparation and User Guidance]
# Guides users on preparing the necessary CSV files for the Django project setup.

echo '------------------------------------------------------------------------'
echo 'CSV File Preparation and User Guidance'
echo '------------------------------------------------------------------------'

# [Section 3 Test 1 Changes: Detailed instructions for CSV file creation]
echo 'For the Django Rest API setup, you’ll need to prepare two CSV files: xa.csv and xb.csv. These files should define your models and their respective fields.'
echo ' '

# [Section 3 Test 1 Changes: Added clarity on creating CSV files]
echo 'Creating your .csv files:'
echo '- Model names should be placed in the top row of each column.'
echo '- Directly below each model name, list the fields associated with that model, one per row.'
echo '- Use a single space to separate entries in your .csv file for both models and fields.'
echo ' '

# [Section 3 Test 1 Changes: Simplified saving instructions]
echo 'To save your .csv files:'
echo '- Use Excel, LibreOffice Calc, or a similar spreadsheet program to create your file.'
echo '- When saving, choose the .csv format.'
echo '- For the field delimiter, use a space. Leave the string delimiter box empty.'
echo ' '

echo '------------------------------------------------------------------------'
echo 'If you have completed preparing your .csv files, proceed with the script.'
echo 'Otherwise, press Ctrl+C to exit and prepare your files before restarting the script.'
echo '------------------------------------------------------------------------'
echo ' '



# [Section 4 Test 1 Changes: Begin Advanced Options Prompt]
# Offers users advanced configuration options for their Django project setup.

echo '------------------------------------------------------------------------'
echo 'Advanced Setup Options'
echo '------------------------------------------------------------------------'

# [Section 4 Test 1 Changes: Introduction to Advanced Options]
echo 'If you’re ready to customize your Django REST API setup further, you can choose advanced options here. Otherwise, the default settings will be applied.'

# [Section 4 Test 1 Changes: Prompt for Advanced Options]
read -p 'Would you like to enter advanced options? (yes/no): ' advanced_reply
if [ "$advanced_reply" == "yes" ]; then
    # [Section 4 Test 1 Changes: Instructions for Custom CSV Files]
    echo 'You have chosen to specify custom .csv files for models and fields.'
    echo 'Please ensure your .csv files are prepared according to the guidelines provided in the previous section.'

    # [Section 4 Test 1 Changes: Custom CSV File Input]
    echo 'Enter the filename for your models .csv file (default is xa.csv): '
    read csv_reply
    csv_reply=${csv_reply:-xa.csv}  # [Section 4 Test 1 Changes: Apply default if input is empty]

    echo 'Enter the filename for your fields data types .csv file (default is xb.csv): '
    read csv_reply2
    csv_reply2=${csv_reply2:-xb.csv}  # [Section 4 Test 1 Changes: Apply default if input is empty]

else
    # [Section 4 Test 1 Changes: Default CSV Files Used]
    echo 'Proceeding with default .csv files: xa.csv and xb.csv.'
    csv_reply="xa.csv"
    csv_reply2='xb.csv'
fi

echo '------------------------------------------------------------------------'
echo ' '

# -------------------------------------------------------------------------------
# >>>>>>>> STOPPED 2024 TRY1 CHANGES HERE, (FOR NOW) RIGHT AT THE <<<<<<<
# >>>>>>>> END OF SECTION 4, JUST AFTER THE IF LOOP <<<<<<<
# -------------------------------------------------------------------------------

mkdir api_auto_xxx
touch stage1_auto_d.py

chmod 777 stage1_auto_d.py

# The use of "cat <<EOF > filename" called a "here document" (or "heredoc") and is a feature of Unix shell environments that allows you to direct a block of text (multiline string) into a command or file:
cat <<EOF > stage1_auto_d.py
# Python code or any text goes here:

# Section 6A Test 1 Changes: Python Script Content
import os

# Initial checks for virtual environment activation
print('Step 1: Ensure your virtual environment is active.')
print('If the virtual environment is not active, please activate it before running this script.')
print('------------------------------------------------------------------')

# No user input for continuation yet, assuming direct execution for now.
# Future enhancement could include checking for virtual env activation.

# Start modifications to the Django settings.py file
apps_found = False

# Section 6A Test 1 Changes: Simplified settings modification logic
# Open config/settings.py and read its contents
with open('config/settings.py', 'r') as fin:
    settings_contents = fin.readlines()

# Add 'rest_framework' and 'api' to the INSTALLED_APPS
new_settings_contents = []
for line in settings_contents:
    if 'INSTALLED_APPS' in line:
        apps_found = True
    if 'django.contrib.admin' in line and not apps_found:
        line = line.replace('django.contrib.admin', 'rest_framework', 'django.contrib.admin')
    if 'django.contrib.admin' in line and apps_found:
        line = line.replace('django.contrib.admin', 'api', 'django.contrib.admin')
    new_settings_contents.append(line)

# Write the modified settings back to config/settings.py
with open('config/settings.py', 'w') as fout:
    fout.writelines(new_settings_contents)

print('Settings updated to include rest_framework and api apps.')

print('Use python manage.py makemigrations and python manage.py migrate to apply changes.')


EOF





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
# p_reply=input('breakup code 2')


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
# p_reply = input('fields_per_m1 is '+str(new_full_final_types)+' and length is: '+str(len(new_full_final_types)))


print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))
# p_reply = input('testing 123')
# p_reply = input('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))


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
# p_reply=input('breakup code 2')


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


tests_count_def_str=''
tests_count_def=0
fout3=open(str(tests_count_def_str),'w')
fout3.close()



#s_pre_marker=str(s_pre_marker) + str(line2.replace( ' = models.CharField(max_length=255, null=False)', str(' = models.' + str(new_full_final[line_c]) +'Field(max_length=250, null=False)' ) ) )


fk_cap=''
fk_cap2=''
print('\nfields_per_m1 is:'+str(fields_per_m1))
print('\nnew_full_final'+str(new_full_final))
# p_reply=input('breakup for debug')

# 50 fields: fields_per_m1
# 50 types: new_full_final
s_pre_marker_tests_def=''


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

				s_pre_marker_tests_def=str(s_pre_marker_tests_def)+'):'
				s_pre_marker_tests_def=str(s_pre_marker_tests_def)+'\n'

				tests_count_def = tests_count_def + 1
				#tests_count_def_str = 'func_def_num' + str(tests_count_def)
				#tests_count_def_str = 'func_def_num999'

				#fout3=open('func_def_placeholder','w')
				#fout3.write(str(s_pre_marker_tests_def))
				#fout3.close()


				s_pre_marker_tests_def=''

				s_pre_marker_tests_def = 'def create' + '_' + str(stage_3_s) + '('

			elif(list_m1.count(fk_cap2) >= 1):
				#s_pre_marker_tests_def =str(s_pre_marker_tests_def) + ', ' + str(stage_3_s) + '= \"\"'


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


# why is this happening:
fout3=open('models2.py','w')
fout3.write(str(s_pre_marker_tests_def))
fout3.close()

#fout3=open('func_def_placeholder_xxx.txt','w')
#fout3.write(str(s_pre_marker_tests_def))
#fout3.close()





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

field_types_added='YES'
#echo 'enter YES if you DID add a second .csv file which contained field type info for your models: '
#read field_types_added

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

echo '------------------------------------------------------------------------------------------------------'

echo 'THE CREATION OF YOUR DJANGO REST API IS NOW COMPLETE!'

echo '----------------------------------------------------'

echo 'to gain access to this API you have just created and verify that everything is working correctly you first need to set up a username and password using the following terminal command:'

echo 'python manage.py createsuperuser'


echo '...and now whenever you want to make use of the API you have just made you can simply execute the following terminal command from within the folder you are current in right now, while your virtual environment is activated, as it should be at the moment: '

echo 'python manage.py runserver'


echo '...and then just copy the url displayed in the terminal into your firefox browser to test it with /admin/ added to the end of the URL let you view the login screen'
echo 'to stop using this API, simply go back to the terminal and hit ctrl+c to leave'

echo '...and as before, if you want to activate your virtual environment again, if it should become deactivated, simply enter the following terminal command PRIOR to python manage.py runserver:'

echo 'source environV88/bin/activate'

echo '--that concludes this automatic portion of this Django Rest API setup.  Good luck!'


#----------------------------------
file_t_count=0

for file in ../seven_namesakes/tests_m[1-99]; do

	let file_t_count=file_t_count+1
	head -n 199 ../m1_file_tests\$file_t_count | cat >> \$file

	head -n 199 \$file | cat >> api/tests.py

done

#----------------------------------


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
	output_line_tests=""

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
		# num_models <----why is this here???
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
	# more tests.py imports
	echo "from django.urls import reverse" >> seven_namesakes/tests.py
	echo "from rest_framework.test import APITestCase, APIClient" >> seven_namesakes/tests.py
	echo "from rest_framework.views import status" >> seven_namesakes/tests.py


	tests_m_count=0


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

				echo "	def post(self, request, format=None):" >> seven_namesakes/views.py
				echo "		serializer = ${m1}Serializer(data=request.data)" >> seven_namesakes/views.py
				echo "		if serializer.is_valid():" >> seven_namesakes/views.py
				echo "			serializer.save()" >> seven_namesakes/views.py
				echo "			return Response(serializer.data, status=status.HTTP_201_CREATED)" >> seven_namesakes/views.py
				echo "		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)" >> seven_namesakes/views.py



				# working on tests.py now:
				echo "from .models import ${m1}" >> seven_namesakes/tests.py
				echo "from .serializers import ${m1}Serializer" >> seven_namesakes/tests.py

				let tests_m_count=tests_m_count+1
				echo "class BaseViewTest${tests_m_count}(APITestCase):" >> seven_namesakes/tests_m$tests_m_count
				echo "	client = APIClient()" >> seven_namesakes/tests_m$tests_m_count
				echo "	@staticmethod" >> seven_namesakes/tests_m$tests_m_count
				#echo "	def create${m1,,}(" >> seven_namesakes/func_def_tests_m$tests_m_count






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







































echo "













#from utils import date
import datetime

import random



fin_t=open('m1_file','r')
t_list=[]
for line in fin_t:
	t_list.append(str(line))
fin_t.close()


t2_list=[]
for t_elem in t_list:
	t2_list.append(t_elem.replace('\n',''))


t3_list=[]
for t_elem in t2_list:
	if(len(t_elem)>0):
		t3_list.append(t_elem)

t3_list_b=[]
#t3_list_b=t3_list

t4_list=[]

for stage_2_elem in t3_list:
	stage_2_s = stage_2_elem
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
	t4_list.append(stage_3_s)

	fk_cap=stage_3_s
	fk_cap2 = fk_cap.replace('_',' ')
	fk_cap2=fk_cap2.title()
	fk_cap2=fk_cap2.replace(' ','')

	for other_elem in t4_list:
		t3_list_b.append(str(other_elem))

fout_t=open('m1_file_tests','w')
for line_t in t4_list:
	fout_t.write(str(line_t)+'\n')
fout_t.close()

p_reply=''

t4_list=[]
t4_list_c=[]
num_models_l1=list(range(1,8))




def_para=''
def_cond=''
ob_of_class_call=''
samp_data_tests=''
t_list_dir_b=[]
rand_samp_data=''

new_ob_c=''



single_tests_line=''

for m_elem in num_models_l1:

	##p_reply=input('break in the code_within_main_for_PRE_first_for')
	try:
		fin_t=open(str('dir' + str(m_elem)),'r')
		t_list=[]
		for line in fin_t:
			t_list.append(str(line))
		fin_t.close()


		fin_t=open(str('dir_b' + str(m_elem)),'r')
		t_list_dir_b=[]
		for line in fin_t:
			t_list_dir_b.append(str(line))
		fin_t.close()



		fin_t=open(str('dir' + str(m_elem)),'r')
		t_list=[]
		for line in fin_t:
			t_list.append(str(line))
		fin_t.close()



		print('dir' + str(m_elem) + ' file produces this list: ' +str(t_list))

		#p_reply=input('break in code after read to show what we grabbed above')

		t2_list=[]
		for t_elem in t_list:
			t2_list.append(t_elem.replace('\n',''))

		t3_list=[]
		for t_elem in t2_list:
			if(len(t_elem)>0):
				t3_list.append(t_elem)






		t2_list_dir_b=[]
		for t_elem in t_list_dir_b:
			t2_list_dir_b.append(t_elem.replace('\n',''))

		t3_list_dir_b=[]
		for t_elem in t2_list_dir_b:
			if(len(t_elem)>0):
				t3_list_dir_b.append(t_elem)







		##p_reply=input('break in the code_within_main_for_past second and third for')
		t4_list=[]
		for stage_2_elem in t3_list:
			##p_reply=input('break in the code-- within main for, within fourth for')

			stage_2_s = stage_2_elem
			stage_3_s=''
			for c_elem_s, elem_s in enumerate(stage_2_s):
				##p_reply=input('break in the code-- within main for, within fourth for, within first for')
				if(elem_s.isupper()==True):
					if(c_elem_s != 0):
						stage_3_s=stage_3_s+'_'
						stage_3_s=stage_3_s+elem_s
					else:
						stage_3_s=stage_3_s+elem_s
				else:
					stage_3_s=stage_3_s+elem_s
				stage_3_s=stage_3_s.lower()
			t4_list.append(stage_3_s)

			#p_reply=input('break in the code-- WITHIN fourth for-- at end-- enter s to show lists:')
			if(p_reply == 's'):
				print('t4_list is: '+str(t4_list))
				print('\n----------------------\n')
				print('t_list is: '+str(t_list))
				print('\n----------------------\n')
				print('t3_list is: '+str(t3_list))
				print('\n----------------------\n')
				print('\n----------------------\n')

			#p_reply=input('break in the code')


		##p_reply=input('break in the code-- past fourth for')
		for count_t4, t3_elem in enumerate(t4_list):
			#p_reply=input('break in the code-- within FIFTH for-- enter s to show lists:')
			if(p_reply == 's'):
				print('t3_list_b is: '+str(t3_list_b))
				print('t4_list is: '+str(t4_list))
				print('t4_list_c is: '+str(t4_list_c))
			if(count_t4 == 0):
				if(m_elem != 1):
					print('null statement')
					#def_para = str(def_para) + '):\n'
					#t4_list_c.append(str(def_para))
					#def_cond = str(def_cond) + ':\n'
					#t4_list_c.append(str(def_cond))

				def_para = str('	def create_' + str(t3_elem) + '(')
				def_cond = '		if('



				ob_of_class_call='			' + str(t3_elem.replace('_',''))

				ob_of_class_call = ob_of_class_call.title()
				ob_of_class_call = ob_of_class_call.replace('_', '')
				new_ob_c = t3_elem.title()
				new_ob_c = new_ob_c.replace('_', '')

				#ob_of_class_call='			' + str(new_ob_c)

				ob_of_class_call = '\n			#comment_placeholder\n\n			'

				ob_of_class_call = str(ob_of_class_call) + str(t3_list[0]) + '.objects.create('

				samp_data_tests='\n		self.create_'+ str(t3_elem) + '('

#			elif(count_t4 == (len(t4_list) - 1)):
#				if (m_elem == num_models_l1[-1]):
#					def_para = str(def_para) + '):\n'
#					t4_list_c.append(str(def_para))
#					def_cond = str(def_cond) + ':\n'
#					t4_list_c.append(str(def_cond))


			else:

				if(count_t4 != 1):
					def_cond = str(def_cond) + ' and '
					def_para = str(def_para) + ', '
					ob_of_class_call = str(ob_of_class_call) + ', '
					samp_data_tests = str(samp_data_tests) + ', '

				ob_of_class_call = str(ob_of_class_call) + str(t3_elem) + '=' + str(t3_elem)

				def_para = str(def_para) + str(t3_elem) + '=' + '\"\"'

				def_cond = str(def_cond) + str(t3_elem) + ' != ' + '\"\"'

				if(t3_list_dir_b[count_t4] == 'Char'):
					rand_samp_data = chr(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				elif(t3_list_dir_b[count_t4] == 'Integer'):
					rand_samp_data = int(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + str(rand_samp_data)
				elif(t3_list_dir_b[count_t4] == 'Float'):
					rand_samp_data = float(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + str(rand_samp_data)
				elif(t3_list_dir_b[count_t4] == 'Date'):
					rand_samp_data = str(datetime.date.today())
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				else:
					rand_samp_data = 'placeholder_for_Others'
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				# t4_list_c.append(str('field:' + str(t3_elem) + ''))

		##p_reply=input('break in the code-- past fifth for')


		if(def_cond != '		if '):
			def_para = str(def_para) + '):\n'
			t4_list_c.append(str(def_para))
			def_cond = str(def_cond) + '):\n'
			t4_list_c.append(str(def_cond))

			ob_of_class_call = str(ob_of_class_call) + ')'
			t4_list_c.append('				' + str(ob_of_class_call))

			t4_list_c.append( str('\n	def setUp(self):') )

			samp_data_tests = str(samp_data_tests) + ')\n'
			t4_list_c.append(str(samp_data_tests))

			single_tests_line = '\nclass GetAll' + str((t3_list[0])) + 'Test(BaseViewTest' + str(m_elem) + '):\n'
			single_tests_line = single_tests_line.replace('_', '')
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '\n	def test_get_all_' + str(t3_list[0]) + '(self):\n'
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '\n		response = self.client.get(' + '\n'
			single_tests_line = str(single_tests_line) + '			reverse(\"' + (str((t3_list[0]).lower())).replace('_','') + '-all\"' + ')\n'
			single_tests_line = str(single_tests_line) + '		)\n'
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '		expected = ' + str(t3_list[0]) + '.objects.all()\n'
			single_tests_line = single_tests_line.replace('_', '')
			single_tests_line = str(single_tests_line) + '		serialized = ' + str(t3_list[0]) + 'Serializer(expected, many=True)\n'
			single_tests_line = str(single_tests_line) + '		self.assertEqual(response.data, serialized.data)\n'
			single_tests_line = str(single_tests_line) + '\n		self.assertEqual(response.status_code, status.HTTP_200_OK)\n'
			t4_list_c.append( str(single_tests_line) )



		fout_t=open(str('m1_file_tests' + str(m_elem)),'w')
		for line_t in t4_list_c:
			fout_t.write(str(line_t))
		fout_t.close()

		t4_list_c = []

		##p_reply=input('break in the code-- past sixth for-- about to restart MAIN for loop')

	except:
		print('...fewer than '+str(m_elem)+ ' models produced.')



















" > testing_test_maker.py






python3 testing_test_maker.py

































echo "----------------------------------------------"
echo "----------------------------------------------"
echo ">>>>>>>> STEP 1 OF 2 IS NOW COMPLETE! <<<<<<<<"
echo "----------------------------------------------"
echo "----------------------------------------------"

echo "to finish the setup of this API, use the following terminal commands: "
echo "cd api_auto_xxx"
echo "...followed by:"
echo "./finish_my_api.sh"

echo "...and in a few moments your API will be finished!"



# head -n $countforfields $file
