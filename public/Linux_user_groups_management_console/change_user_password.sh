echo "##########################################"
echo "CHANGE LINUX USER PASSWORD SCRIPT"
echo "##########################################"
echo "Enter the name of the user you wish to"
echo "change the password for: "
read username
echo "----------------------------------------"
echo "Provide a new password for this user: "
sudo passwd $username
echo "----------------------------------------"
echo "Now try login to the user with the previous"
echo "entered password."
echo "----------------------------------------"
su - $username
echo "If the user was not changed succesfully re-run script."
echo "If not press CTRL+C to abort"
read
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read