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
        w_out2=''
        for type_elem in (range(0, int(count_f_per_m1[mod_elem]) )):
            current_fields_out=current_fields_out+1
            w_out=str(w_out)+str(fields_per_m1[type_elem])
            w_out2=str(w_out2)+str(f_types_per_m1[type_elem])

            #print('here is our for loop conditional: ' + str(count_f_per_m1[mod_elem]))

            #print('This is the value for count_f_per_m1: ' + str(count_f_per_m1) )
            #print('This is the value for type_elem: '+str(type_elem))
            type_elem=int(type_elem)
            if (type_elem == int(count_f_per_m1[mod_elem]) ):
                print('writing out files now!')
                b_fout_end=open(('current_fields_out'+str((count_f_per_m1[type_elem]))),'w')
                b_fout_end.write(str(w_out))
                b_fout_end.close()
                b_fout_end.write(str(w_out2))

                #b_fout_end=open(('current_field_types_out'+str(type_elem)),'w')
                b_fout_end=open(('current_field_types_out'+str( (count_f_per_m1[type_elem]) ) ),'w')
                b_fout_end.close()
