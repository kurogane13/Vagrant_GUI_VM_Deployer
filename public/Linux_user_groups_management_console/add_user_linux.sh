#Add user and group in one line
echo "##########################################"
echo "LINUX USER AND GROUP ADDITION SCRIPT"
echo "##########################################"
echo "Enter the name for the user and group (Will be the same name for both): "

read userandgroup
sudo useradd -d /home/$userandgroup -m $userandgroup
echo "----------------------------------------"
#Set user password:
echo "Set new password for this user: "
sudo passwd $userandgroup

echo "----------------------------------------"
echo "Press enter to switch user: "
read
#Switch to user
su - $userandgroup

#Search in /etc/passwd
echo "----------------------------------------"
echo "Displaying /etc/passwd : "
echo "Username:Password:User ID (UID):Group ID (GID):User ID Info:Home directory:Command/shell"
cat /etc/passwd | grep $userandgroup

#Adduser to the sudoers group
echo "----------------------------------------"
echo "Adding user to the sudoers group"
sudo adduser $userandgroup sudo

#Show sudoers
echo "----------------------------------------"
echo "Showing list of sudoers: "
grep -Po '^sudo.+:\K.*$' /etc/group

echo "----------------------------------------"
echo "Adding user and group to /bin/bash."
#Add user to bin bash /bin/bash
sudo usermod --shell /bin/bash $userandgroup
echo "----------------------------------------"
echo "Program terminated, press enter to terminate the session now..."
read
