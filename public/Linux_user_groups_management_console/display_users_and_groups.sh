echo "##########################################"
echo "LINUX USERS AND PASSWORD ETC FILE"
echo "##########################################"
#Search in /etc/passwd
echo "Enter a user or group name to find in"
echo "/etc/passwd file now: "
read stringsearch
echo "----------------------------------------"
echo "Displaying /etc/passwd file: "
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cat /etc/passwd | grep $stringsearch
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read
