# auto_setup_django_pregame

===============================================================================
### NOTE:
----
IF YOU HAVE NOT READ "HOW_TO_GET_STARTED.md" IT IS STRONGLY ADVISED YOU DO SO (AND FOLLOW INSTRUCTIONS CONTAINED WITHIN) *BEFORE* READING ANY OF THIS README FILE.  READING THIS README FILE YOU ARE CURRENTLY READING IS *NOT* NECESSARY-- OR EVEN *NECESSARILY* BENEFICIAL.

START WITH "HOW_TO_GET_STARTED.md"
===============================================================================

--------------------------------------------------------
--------------------------------------------------------

### notes from 2024:
---------------

#### Things to make note of from Test 1 (for Test 2 and later):

- some lines may be completely unnecessary clutter due to them being from older iterations of the setup that got left in place by accident (simply because they either didn't cause any additional errors by existing or because the errors they cause might not prevent the code from still working)-- for instance, it's possible that these lines from the beginning of Section 1 in our main shell script are trying to delete a file that could not possibly exist because no lines exist anymore that might create these files in the first place-- if so, I'd eventually like to get rid of that sort of clutter: 

```
rm -rf dir_b[0-9]  # [Section 1 Test 1 Changes: Use -rf to ensure removal without user intervention]
rm -rf dir_a[0-9]  # [Section 1 Test 1 Changes: Same change as above for consistency]
rm -rf dir[0-9]    # [Section 1 Test 1 Changes: Applied -rf flag for uniformity across cleanup commands]
```




#### Django:

- Django is a web application framework for Python.  It is designed to prioritize principles of reusability and rapid development.

#### If there are any issues with our bash shell scripts getting saved in the incorrect form (with incorrect line endings), and having those line endings getting messed up again every time we try to commit/add/push new alterations to existing shell scripts, use the following terminal command on any shell scripts that get messed up:

dos2unix /path/to/your/script.sh

#### ...followed by something like THIS terminal command within Bash, within Visual Studio Code in Windows, to prevent things from continually getting UN-fixed every time we try to push changes to an existing repo:

git config --global core.autocrlf false


--------------------------------------------------------
--------------------------------------------------------

===============================================================================


Again--
If just starting out: read HOW_TO_GET_STARTED.md instead of this.
It is a better source of concise information, which should also be clearer and more accurate.

There is a great deal of info here within this README which is somewhat superfluous-- and some of it is a little bit out of date.  

------------------------------------------------------------------------------

basic instructions on how to use this shell script (based on example with sample data):

...start by entering command into terminal (from location of shell script file):
./main_auto_api_maker2.sh

--hit enter at 1st prompt
--enter this at 2nd prompt:
xa.csv
--enter this at 3rd prompt:
xb.csv

--then, following instructions displayed on terminal enter these 2 commands into terminal:
cd api_auto_xxx
./finish_my_api

.......you'll probably have to hit enter once more here

--then enter YES at prompt asking you if you added a 2nd .csv
--then just hit enter at any additional prompts or places where the code stops displaying a continuous stream of text at any point

-----------------------------------------

The Bare Essentials:

All you need to know is this: I designed this code to function adequately no matter what your skill level--

If you used google drive's "draw.io diagrams" feature to create your API class diagram, you can just save that as a pdf to your computer, open that pdf, and directly copy and paste every box directly into the first five rows of a new spreadsheet file you create (probably using either excel or libreoffice in Linux).

It is both useful and advisable to specify which types you want the fields to be assigned as-- for the time being I limited the options to 'Date', 'Boolean', 'Char',
'Integer' and 'Float' but there's no reason why you couldn't expand this further to include more types than those-- and I may do that in the future.  But those are the limitations for the time being.  The way that this is done is simple: just copy and paste your original spreadsheet you just created (containing models and fields) into a second file (or just create a 2nd save file of the original spreadsheet) such that you have two identical spreadsheet files; then, simply enter the type you want for each given field directly into the cell with that field in it currently (thereby overriding it, as can be seen in the differences between the two example .ods spreadsheet files seen in repository-- xa_original and xb_original).  If you want to create a foreign key, just put the name of the model into the cell instead (again, as can be seen in the example spreadsheet .ods files in the repository, xa/xb).

If you make a mistake in what you put into these cells, the code will still try to accommodate you as best it can.  Just try to stick to alpha-numerical characters for simplicity's sake when assigning names to fields and models.  

Also, for the time being you can only create up to 5 models at once, automatically (but up to 99 different fields for each model could theoretically be assigned)-- there's no reason this limit on models couldn't be increased-- and I may end up doing that later on.  Also of note-- this limit of 5 models for the time being means that-- as can be seen in the example .ods spreadsheets-- for every column between the 1st and 5th columns, any column which does not contain a model has NOMODEL entered into it-- and NA in the cells below for symmetry's sake-- these, of course do not appear in the final product.  However, for the time being, if you wish to have FEWER than 5 models in your starting API, just enter NOMODEL into any top row cells between 1 and 5 which are still empty after you've placed all your models within it.

Once you've copied and pasted these values into your spreadsheet, just: Save As ---> some_name1.csv ---> use text csv format ---> Then under field options, character set: Unicode (UTF-8) Field delimeter: [just put a single space in this box] String delimeter: [just delete everything from this box]-- then just click ok.

Then, if you want to use your own .csv file to create your own API, just follow the same steps as above starting with executing your shell script (using ./main_auto_api_maker2)-- only in this case you'd substitute some_name1.csv and some_name2.csv or whatever you decided to name your .csv files instead of xa.csv and xb.csv.  

After that original shell script has been executed (as well as the shell script created by it, as explained above) you can start up your Django Rest API by entering the following two terminal commands:
1)
python manage.py createsuperuser
...at which point you will be prompted to create a login id and password to get past the login page.
2)
python manage.py runserver
...which gets your API up and running-- you'll need to execute this again any time you want to get log into your API.  Just copy and paste the url displayed in the terminal, with /admin/ added to the end of it-- and you can go directly to the login page of your new API where you can gain further access by entering the username and password you selected when you you used 'createsuperuser.'

-------------------------------------------------------

Remember-- the only file that is actually needed to make this entire program run is that single shell script file (main_auto_api_maker2)-- and whatever .csv files you decide to create in order to enter information into it.

Note- this is a work in progress.  Everything currently functions-- but there is still more I wish to add.  Here is what has not yet been implemented which I am in the process of implementing now:

1- tests.py auto-creation of tests.
2- additional allowed types for fields
3- increasing the number of allowed models during automated model creation process from 5 to closer to 10 (possibly more)
4- removing files created during intermediate steps of the automated creation process which are no longer needed after the creation of API is complete
5- automatically adding UUID based on user specification within the secondary spreadsheet.
6- ObjectView?
7- Consider possibly adding POST action into the resources that are automatically generated (for an HTTP response based on whether requests went through or not)-- as well as potentially delete as well.
8- backend and frontend?

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------


1) Brief (skippable) Explanation of Design and Intent:
-------------------------------------------------
This Django Rest API automatic setup is designed to take you from that first step of creative development of your initial ideas-- to total instant functionality in one quick step.  

The natural creative step that is typically implemented at the start of creating your own API is typically the creation of a series of tables-- with each table representing a model with the model name written in the top row and the field names contained within it listed directly below the table-- and once the user has a firm idea of how these models all inter-relate to one another, they incorporate these tables into a diagram, which will have a series of arrows pointing towards the direction of the models containing data which they depend on directly, through foreign keys exhibiting the many-to-one relationships which are typical in these sorts of designs.

I'm not going into details if you are not aware of exactly how these sorts of things work, suffice to say-- there are data which has similar relevancy to multiple files, and in order to compress that data, save space and reduce complexity we have some models simply refer to the data contained within other models.  This is especially/commonly useful/used if we want to allow a large number of users to create their own unique identity to represent themselves --with a cascading series of a smaller creations being dependent on that user's initial creation.

We see an example of this in the .pdf file we have included.

The only file in here that actually will matter is the shell script (.sh file)-- everything else included is merely an example to demonstrate how things would initially be set up, and how easy it would be to get DIRECTLY from the natural creative step, to fully functional code.  Later, a description is given on where next to proceed in the process once this initial setup is complete.  For now, we focus on basic instructions on use, based on the assumption that the user is at a place in the development of their project where they are just now transitioning from the creative step (coming up with initial ideas on which fields and models they should include in their overarching design)-- to the initial implementation step.  This is often tricky because there is no room for error-- which is a factor made all the more frustrating and difficult since this creation process will require that you go through a lengthy series of precise steps which are not really explicitly written down in any one single location to refer back to for guidance.  

In order to make this work, you will need to alter a series of python modules by hand in a very specific manner-- all of which have a tangled web of inter-dependent relationships with each other module-- meaning that any one change you make to any single python file will have cascading effects on a number of other files in the initial Django package setup.  That means that making even the tiniest possible change you could possibly make when setting up a new django rest api from scratch as a new beginner (which would generally just be creating an initial model containing a single field)-- would require that the user alter a whole host of python files by hand-- none of which will even contain any other simple little sample models, for this person who's just starting out to refer back to for confirmation.  Because there is seemingly no official straight-forward set-up for how to setup the most basic API imaginable-- the foundation for the creation of any Django project-- I decided to create one.  In the process of doing so I realized that these steps STILL take way too long, and that no one within their right mind would ever go through them more than once (once they realize that much of these initial steps are a time-consuming slog which is generally very much the same from project to project).  

The obvious solution is to automate these initial steps.  This is all done with a single .sh file.  

Everything else (besides that .sh file) is just part of the example data showing how we got from the typical creative/brainstorming portion of a typical Django project to implementation of creating the necessary code that will actually allow it to function in reality.  

We also include a folder which contains all information regarding what that code is actually happening from a human stand-point-- this is the step-by-step instructional guide to creating a Django Rest API by hand-- a process which is entirely taken care of by our shell script, and is therefore, somewhat superfluous-- but does give an explanation such that the user should be able to make further changes to the code if they wish.

--if for whatever reason, you wish to understand what is actually happening within the code to allow us to do what we do within this package-- but this is not a requirement.  The purpose of this code is entirely to supplant that slow, tedious process.  However, to summarize the basic point for individuals with no experience in Django and no simple guide on how to even get started would be this:

--------------------------------------------------
To sum up:

Starting out with Django-- and for a very long time AFTER you start out-- this is the only thing you should ever realistically care about or be thinking about as it relates to constructing/manipulating this web framework-- the (approximately) 7 "namesake" (for lack of a better term) .py files-- the specific python modules (6 in 'api' folder, 1 in 'config') which you would typically be expected to manually edit by hand-- and which possess tangled inter-dependencies with one another that cannot be ignored-- the are listed in order of importance from most to least important:

the 6 files in api:
models.py,
views.py,
serializers.py,
urls.py
admin.py

tests.py

the 1 file in config:
urls.py

...there are a couple others that you might consider, but to keep the range of our discussion limited we're really just going to say that those 7 files are really all you're ever really going to need to know about.  However, as far as I can tell, there is nothing that exists within those 7 files which uniquely and specifically differentiates itself between those .py files and others that exist within our API.  

When you are finished with this automated Django Rest API setup, the alteration and manipulation of these seven python files is all you're really ever going to need to think about, when going forward.

The reality of what you need to know is obscured by the complexity of what you're being handed right off the bat.  The terminology is often ambiguous or misleading-- but I think it helps --especially for people who are still relatively new to it-- to focus on the spirit of what an API is intended/designed to do: to facilitate/ease communication between otherwise incompatible software/machines.

For simplicity's sake, there are only 7 different python modules within the Django Rest API that you're ever really going to mess around with (give or take a couple-- realistically your code will still function without any attention at all paid to "tests.py" and "settings.py" I was sort of on the fence about)-- so if there's ever something that's gone wrong in your setup, you're only really ever going to need to check through those 7 files in order to make your API function correctly.  In much of the comments and code, I will refer back to those 7 files.  They are essentially in most of these Django Frameworks universally used to create a basic structure-- though I've not really read much that distinguishes them from other python files in any official capacity.
------------------------------------------------------------------------


Basic Instructions on how to implement our shell script (this is mostly completely unnecessary to explain-- and unnecessarily specific-- but I really wanted to create instructions wherein it would be almost impossible for the user to fail to create a functional API product on the very first attempt-- or soon after):
>>> this is based on expectations of where you'll be when transitioning from the creative development of your original ideas to the concrete foundation of our functional code that we're setting up.
-------------------------------------------------

1) basic creative step: right click empty space in Google Drive ----> more ----> draw.io Diagrams ----> once your class diagram is finished and saved-- export as pdf file (or anything that allows you to copy and paste large portions of text as columns)
2) copy and paste tables into a blank spreadsheet file like excel or libreoffice calc-- and save that file as a .csv file with fields and models separated only by a single space.
  2a) remove any text containing parentheses --like "(fk)" marking foreign keys-- in the .csv file you create.
  2b) if you want to create FEWER than five models in the initial setup you will need to enter NOMODEL in the top row of every column you do not use between the first and fifth column of the spreadsheet.  Adding NA to fields below that first row to indicate fields not in use mostly just seems to improve clarity a little bit from a visual standpoint, but may also have some actual impact as well under some circumstances.  I just wanted to make our tables line up somewhat better visually, after they were converted to .csv files.
  2c) Then we execute our shell script just like any other-- go into the terminal in any linux system and (after adding permission to execute, if need be, with chmod +x python_only_simp2_api_finisher.sh) you simply enter the following into the terminal: ./python_only_simp2_api_finisher.sh
  2d) and this leads you to a prompt (which you can skip w/ enter key)
3) execute a second shell script created by the first based on instructions given by the first in the terminal screen itself.
  3a) ...which eventually results in a second prompt-- this one you can't skip-- this is where you'll enter the name of the .csv file you created earlier from our class diagram.
  3b) if any additional prompts pop up in the process of executing the shell script, you can just choose the default option or if no default option specified, will be given an option to skip through the prompts-- for your first run through of this shell script you should just do that.
  3c) ...The shell script itself will guide you through the last remaining steps you need to take


==============================================================================
==============================================================================

