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
p_reply=input('breakup code 2')


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
p_reply = input('f_types_per_m1 is '+str(f_types_per_m1)+' and length is: '+str(len(f_types_per_m1)))


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
p_reply=input('breakup for debug')

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
		p_reply=input('check for field types in ' + str(fields_per_m1[line_c]))
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
			print('\n444444444444444444444444444444444444444')
			print('This is what we are looking to Replace: ' + str(fields_per_m1[line_c]) + ' = models.CharField(max_length=255, null=False)')
			print('This is what we want to replace it WITH: ' + str(stage_3_s) + ' = models.ForeignKey("' + str(fk_cap2) + '", on_delete=models.CASCADE))' )
			print('line2 at the moment is: '+str(line2))
			p_reply=input('break in code here')
			s_pre_marker=str(s_pre_marker) + line2.replace(str(fields_per_m1[line_c]) + ' = models.CharField(max_length=255, null=False)', str(stage_3_s) + ' = models.ForeignKey("'+str(fk_cap2)+'", on_delete=models.CASCADE))' )
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














fout3=open('models2.py','w')
#fout3=open('fout3_models.py','w')
fout3.write(str(s_pre_marker))
#fout3.write(str(s_post_marker))

fout3.close()
