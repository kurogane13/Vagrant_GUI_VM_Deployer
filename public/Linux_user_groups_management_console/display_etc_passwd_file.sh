echo "##########################################"
echo "DISPLAY PASSWORD FILE"
echo "##########################################"
echo "Press enter to view the/etc/passwd file now: "
read enter
echo "----------------------------------------"
echo "Displaying /etc/passwd file: "
echo "----------------------------------------"
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cat /etc/passwd
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read
