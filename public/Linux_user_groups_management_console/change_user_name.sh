echo "##########################################"
echo "CHANGE LINUX USERNAME SCRIPT"
echo "##########################################"
echo "Enter the name of the user you wish to change: "
read changeuser
echo "----------------------------------------"
echo "Enter the NEW name to replace the previous user: "
read newuser
echo "----------------------------------------"
sudo usermod -l $newuser -d /home/$newuser -m $changeuser
echo "----------------------------------------"
echo "Showing /etc/passswd file..."
cat /etc/passwd | grep $newuser
echo "----------------------------------------"
echo "If the user was not changed succesfully re-run script."
echo "If not press CTRL+C to abort"
read
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read