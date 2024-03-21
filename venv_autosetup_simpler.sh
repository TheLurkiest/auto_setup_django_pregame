# Update and upgrade system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Python virtual environment support
sudo apt-get install python3-venv -y

# Create and activate virtual environment
python3 -m venv environV88
source environV88/bin/activate

# Install Django and Django Rest Framework
pip3 install django djangorestframework

# Instructional echo statements
echo ------------------------------------------------------------------------------
echo "The virtual environment 'environV88' is now ready."
echo "Activate it using: source environV88/bin/activate"
echo "Then, run the main setup script: ./main_auto_api_maker2.sh"
echo "Follow the on-screen instructions to complete the setup."
echo "This process should take less than 30 seconds."
