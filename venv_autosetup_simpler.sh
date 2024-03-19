# to shorten it just execute this shell script to set up the virtual environment automatically:

# comment added 2024: might wanna do by hand prior
sudo apt-get update
# ...also I did this next line below (also 2024) and shit still worked... but still not sure if this line should be uncommented or not-- for now we leave it uncommented by default since it did work out fine:
sudo apt-get upgrade

sudo apt-get install python3-venv
python3 -m venv environV88
source environV88/bin/activate
pip3 install django
pip install djangorestframework

echo -------------------------------------------------------------------------------

echo ok, the virtual environment you just auto set up is now ready to go:



echo to get started using it, you must activate the virtual environment using the following terminal command: source environV88/bin/activate

echo ...after that just execute the main shell script using the following terminal command: ./main_auto_api_maker2.sh

echo --then hit enter at the first prompt

echo --and just follow the instructions that are displayed on the terminal to complete the process!

echo --this should take less than 30 seconds.
