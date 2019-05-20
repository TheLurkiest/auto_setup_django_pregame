print('testing python code 123')

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
