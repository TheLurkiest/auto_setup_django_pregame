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
	arr_combo.append("	"+str(w_out_arr[c_arr2])+" = models."+str(f_types_arr)+"Field(max_length=250, null=False)")





































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
	arr_combo_feedback.append(str(w_out_arr[c_arr2])+" "+str(f_types_arr))

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

print('b_sum_list is: '+str(b_sum_list))


#p_reply=input('breakup code 1')

w_fields_zzz=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	if(b_sum_list.count(c_arr2) == 0):
		w_fields_zzz.append(w_out_arr[c_arr2])

w_types_zzz=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	if(b_sum_list.count(c_arr2) == 0):
		w_types_zzz.append(f_types_arr)


print('w_fields_zzz is: '+str(w_fields_zzz))
print('w_types_zzz is: '+str(w_types_zzz))

print('w_out_arr is: '+str(w_out_arr))

p_reply=input('breakup code 2')

other_pre_marker=''

s_count=0
sum1=0
fin1=open('models.py','r')
s_pre_marker=''
s_pre_marker2=''
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	print('main for loop for altering our field types is now active...')
	s_pre_marker2=''
	field_found1=False
	for line in fin1:
		line2=line
		print('entering line loop')
		if(field_found1 == False):
			if(str(line2[:5]) == 'class'):
				print('1st if cond triggered')
				s_pre_marker2 = line2
				s_pre_marker = s_pre_marker + s_pre_marker2
				print('1st if cond triggered')
			else:
				print('null statement')
				s_pre_marker2 = line2
				s_pre_marker = str(s_pre_marker) + str(s_pre_marker2.replace( (" = models.CharField(max_length=255, null=False)"), (" = models." + str(w_out2_arr[c_arr2]) + "Field(max_length=250, null=False)") ))
				print("this is what we are trying to replace: " + str(" = models.CharField(max_length=255, null=False)"))
				print("this is what we are trying to replace it WITH: " + str(" = models." + str(w_out2_arr[c_arr2]) + "Field(max_length=250, null=False)"))
				#p_reply=input('debug break in code')
				field_found1=True
		#print("searching for: " + str(w_out_arr[c_arr2]) + " = models.CharField(max_length=255, null=False)" )
		#print("this is the line2 we are searching through: "+str(line2))
		#p_reply=input('debug break in code')
		if(line2.count(str(w_out_arr[c_arr2])+" = models.CharField(max_length=255, null=False)") >= 1 ):
			#p_reply=input('debug break in code: line2 thing found!!!!!!!')
			s_pre_marker = str(s_pre_marker) + str(s_pre_marker2.replace( (" = models.CharField(max_length=255, null=False)"), (" = models." + str(w_out2_arr[c_arr2]) + "Field(max_length=250, null=False)") ))
		for m_elem in list_m1:
			if(line2.count('class '+str(m_elem)+'(models.Model):') >= 1):
				s_pre_marker=str(s_pre_marker) + str(line2)
		for c_elem, t_elem in enumerate(w_out2_arr):
			print('\nlooking for: ' + str(str(w_out_arr[c_elem])+' = models.'+str(t_elem)+'Field(max_length=255, null=False)') )
			print('looking in: ' + str(line2))
			if(line2.count(str(w_out_arr[c_elem])+' = models.CharField(max_length=255, null=False)') >= 1):
				line2 = line2.replace( str(str(w_out_arr[c_elem])+' = models.CharField(max_length=255, null=False)'), str(str(w_out_arr[c_elem]) + ' = models.'+str(t_elem)+'Field(max_length=255, null=False)') )
				s_pre_marker=str(s_pre_marker) + str(line2)



fin1.close()

print('debug: w_types_zzz is: '+str(w_types_zzz))
# now we write them out to files:
# os.system('models.py')
fout3=open('fout3_models.py','w')
fout3.write(str(s_pre_marker))
fout3.close()
