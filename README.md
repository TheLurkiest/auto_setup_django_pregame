# auto_setup_django_pregame






alright, we now have the bare bones setup complete-- for now, and the next time
we show up here we're just going to have to do a ton of little tests and
debugs most likely-- it's probably a good idea to update the manner by which
files are being transferred to make it take fewer manual steps just to get the
files in there.














For the time being I'm going to skip over tests.py and come back to it
--it's a lot to implement.

In addition, I'm going to have to deal with foreign keys at some point,
but-- again, I'm going to move past that for now.  However, when I come
back to that my intention at the moment is to do something like this:

Just as with regular fields, the model classes within our models.py module also contain fields which are foreign keys of other classes-- and when the objects of those classes that are the primary key are deleted, the objects of classes containing their foreign key would have to be deleted as well.

In short-- these are just treated differently, and written differently in the code.

when these classes which contain fk are created in models.py, they must also indicate the primary model which they are associated with
-- therefore, it makes sense that the user would input those.

For the time being, until I have all the most basic steps sorted out in auto-implemented the most basic django framework, I'm going to avoid implementing the more advanced steps that would be necessary to really make this code shine.  However I will list the basic steps/plan/blueprint below, and we can return to these later if all goes as planned with our current setup.  


First-- our current default setup will be laid out (this is how we plan on implementing our auto-generating API for now-- until this basic setup is completed we will not be concerned with applying the more advanced setup)-- this basic blueprint is called BASIC BARE-BONES AUTO-API MAKER:

--the more advanced auto-generator still follows normal defaults below, but in addition to these, I feel that the easiest thing for the user to design to transmit info to this code I'm developing-- as well as the simplest way for me to alter my own pre-existing code-- is to simply have the user create an identical copy of their spreadsheet file they made initially, name it something specific-- how about "tier_b_data"-- that seems fine-- and then simply clicks/tabs through the individual fields in order to identify those each field with its correct/appropriate data type which the user wishes to use and its relationship with other models.

========================================================================
========================================================================
BASIC BARE-BONES AUTO-API MAKER:
------------------------------

--remember that we can re-use a BUNCH of existing code by using ${name2,,} to
forcibly lowercase our model names to re-use them like we see done typically.

Similarly, we can re-uppercase a lowercase word (just 1st letter) with ^ instead:
echo ${name1^}

...we might want to double check that we've done that occasionally

models.py:
1- every field is defaulted to CharField
2- all models (classes within models.py) get a NON-UUID url in main urls.py urlpatterns list (urls.py urlpatterns list)
  2a) No models generate UUID-- these url's are NOT unique
3- every __str__ returns a format of field1 - field2
4- ...I think that's it

========================================================================
========================================================================

...And hereafter is the area where our more advanced auto-API maker will be located-- called ADVANCED API MAKER:

ADVANCED API MAKER:
------------------------------

user can copypasta models/fields spreadsheet to generate another sheet to give info on each of the fields in question.

1- Any field simply marked 'a' will use CharField
2- Any field marked '1' will use IntegerField
3- Any field marked with any other characters besides those two will be indicative of that field being an fk-- the characters contained within are indicating WHICH MODEL the foreign key originally came from.


However, that only applies to the cells beneath the top row (the fields)--the models cells (in the very top row of the spreadsheet) determine whether the MODEL gets a unique UUID and URL or not.  Therefore, any of these top row cells which contains the text 'URL' will be given a unique url pattern web page to call their own-- using the name of the model associated with this cell-- as well as their UUID-- to generate their own unique resource id, and by extention, a unique web page.  Obviously, it goes without saying therefore based on this, that any cell along that top row which contains URL, must also make the changes needed to generate UUID for these models as well.  Therefore, your options along this top row are:
1- URL (generates UUID and a unique URL resource id for objects of this class)
2- NO (gives no UUID or url)


Any class which contains an fk will have similarly altered return within their __str__ function indicating where the key came from.

All classes which DON'T contain fk's will generate UUIDFIELD's-- otherwise they WON'T contain fk's.

This of course, is not perfect, but it allows us to create a plan for both a simple and advanced setup that allows the user to create something that would normally be extremely time-consuming in a matter of minutes or seconds.  Any small inconsistencies generated by this process are relatively quick and easy to overcome and alter-- these simple defaults are left in place to avoid over-complicating and slowing down what is supposed to be simpler/quicker for the user.

========================================================================
========================================================================














earlier notes below:




For set up we create a basic little 2 step domino push, causing the shell script we've
created to run our python3 module when we execute it.

Make sure to use chmod +x django_auto_shotgun_pregame.sh in order get permissions
to execute if you dont have them already.



Once we've got our python module up and running we start prompting the user to give us
info on the models he wants to create and the fields within those models.  We don't have
much in terms of detailed options for our initial setup but hopefully that'll change with
time-- but right now you only get one model at setup.


Now that we have prompted the user and gotten the user we wanted we will rush
through the first 4 steps of django rest api setup with a bunch of generic
placeholder
