echo "#############################################"
echo "Remove user from group."
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
echo "NOTE: If you don´t see the entered user in the above line,"
echo "It means it does not exist, and cannot be deleted,"
echo "for you should exit with CTRL+C, create a new user, or"
echo "recheck your syntax".
echo "---------------------------------------------"
echo "Now if you wish to proceed, name the GROUP you want"
echo "the USER to be removed from to and press enter..."
read existinggroup
echo "---------------------------------------------"
getent group $existinggroup
echo "---------------------------------------------"
echo "Same as user, if the entered group is not there, "
echo "you should exit with CTRL+C and go to menu 'Create new group'"
echo "or recheck your syntax"
echo "---------------------------------------------"
echo "To proceed deleting "$existinguser
echo "from "$existinggroup
echo "press enter now (CTRL+C to abort)..."
read enter
sudo deluser $existinguser $existinggroup 
echo "---------------------------------------------"
getent group | grep $existinggroup | grep $existinguser
echo "---------------------------------------------"
echo "If you don´t see the entered user above,"
echo "the user was succesfully removed the group, if"
echo "not please re-run the program."
echo "---------------------------------------------"
echo "Program terminated, press enter now to terminate session..."
read enter

