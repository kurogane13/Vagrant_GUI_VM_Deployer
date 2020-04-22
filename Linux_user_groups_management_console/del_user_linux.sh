echo "##########################################"
echo "LINUX USER AND GROUP ADDITION SCRIPT"
echo "##########################################"
echo "Enter the name for the user and group to remove (Only for users and groups with the same name): "
read usergroup
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cat /etc/passwd | grep $usergroup
echo "----------------------------------------"
echo "If this is the correct user and group to remove press enter."
echo "If not press CTRL+C to abort"
read
sudo userdel -f $usergroup
sudo rm -r /home/$usergroup
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read
