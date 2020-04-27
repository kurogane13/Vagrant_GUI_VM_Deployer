echo "#############################################"
echo "Add user to group."
echo "#############################################"
echo "Showing paswd file in /etc/passwd: "
echo "                                   "
echo "---------------------------------------------"
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cat /etc/passwd
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
echo "---------------------------------------------"
echo "Enter an Existing USER now: "
read existinguser
echo "---------------------------------------------"
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cut -d: -f1 /etc/passwd | grep $existinguser
echo "---------------------------------------------"
echo "NOTE: If you don´t see the entered USER in the above line,"
echo "It means it does not exist, and needs to be created,"
echo "for you should exit with CTRL+C and go to menu 'Add new user'."
echo "---------------------------------------------"
echo "Now if you wish to proceed, name the GROUP you want"
echo "the USER to be added to and press enter..."
read existinggroup
echo "---------------------------------------------"
getent group $existinggroup
echo "---------------------------------------------"
echo "Same as user, if the entered group is not there, "
echo "you should exit with CTRL+C and go to menu 'Add new group'"
echo "---------------------------------------------"
echo "To proceed adding "$existinguser
echo "to group "$existinggroup
echo "press enter now (CTRL+C to abort)..."
sudo usermod -a -G $existinggroup $existinguser
echo "---------------------------------------------"
getent group | grep $existinggroup | grep $existinguser
echo "---------------------------------------------"
echo "If you see the entered user and group in the same line,"
echo "above, the user was succesfully added to the group, if"
echo "not please re-run the program."
echo "---------------------------------------------"
echo "Program terminated, press enter now to terminate session..."
read enter





 
