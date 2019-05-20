import random
import os

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

# step 2

default_folder1 = 'api_auto_xxx'

r_name = (str(default_folder1) + str(random.randint(1,999)))

print('initial rough and dirty setup begins: ')
os.system('mkdir ' + str(r_name))
# step 3a
os.system('git init ' + str(r_name) + '/')

# 3b
os.system('cp ~/workspace/final_project_reflections/my2_branch_reflect/reflections-project/.gitignore ' + str(r_name) + '/')

# 3c
print('for step 3c we are creating a whole new python module within that newly created folder... then proceed.')

# os.system('git add ' + str(r_name) + '/.gitignore')
# os.system('cd '+str(r_name))
# os.system('touch testing_cd.txt')
# os.system('touch '+str(r_name)+'/test2_no_cd.txt')
