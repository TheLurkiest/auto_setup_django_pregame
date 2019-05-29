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



fields_per_m1=[]

for dir_b_file in range(1,(m1_count+1)):
    b_fin2=open(('dir_b'+str(dir_b_file)),'r')
    for line_b in b_fin2:
        #l_m1=b_fin2.readlines(b_count)
        if(len(str(line_b))>2):
            fields_per_m1.append(str(line_b[:-1]))
            # print('model: '+str(fields_per_m1))

b_fin2.close()


m1_count=len(list_m1)
print('this is the list: '+str(fields_per_m1))
print('this are this many total fields in all combined lists: '+str(len(fields_per_m1)))
