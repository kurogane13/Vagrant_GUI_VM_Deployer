sudo -i
echo "---------------------------------------------------"
echo "Creating user kurogane..."
sudo useradd kurogane
echo "---------------------------------------------------"
echo "Set password for kurogane: "
passwd kurogane
echo "---------------------------------------------------"
echo "Installing nano editor...."
yum install -y nano
echo "---------------------------------------------------"
echo "Adding user kurogane to the sudoers group..."
echo -e "kurogane ALL=(ALL) ALL" >> /etc/sudoers
echo "---------------------------------------------------"
echo "Copying vagrant folder to /home/kurogane..."
sudo cp -r /home/vagrant/ /home/kurogane/
echo "---------------------------------------------------"
echo "Renaming vagrant folder to kurogane..."
mv /home/vagrant/ /home/kurogane
echo "---------------------------------------------------"
echo "Copying kurogane folder to /home/ path..."
sudo cp -r /home/kurogane/kurogane/ /home/
echo "---------------------------------------------------"
echo "Accessing kurogane folder..."
cd /home/kurogane/
echo "---------------------------------------------------"
echo "Removing kurogane folder in /home/kurogane/kurogane..."
sudo rm -r /home/kurogane/kurogane
echo "---------------------------------------------------"
echo "Listing available groups to install..."
sudo yum group list
echo "---------------------------------------------------"
echo "Select from the list above, a GUI group and paste it."
echo "This will install the GUI environment for the server: "
read selected_group
echo "---------------------------------------------------"
quotes='"'
sudo yum groupinstall $quotes$selected_group$quotes
cd /tmp
echo "Accesed /tmp directory."
echo "Downloading epel-release-latest-7.noarch.rpm for centos/fedora systems..."
sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo "---------------------------------------------------"
echo "Listing contents of /tmp.."
ls *.rpm
echo "---------------------------------------------------"
echo "Moving epel-release-latest-7.noarch.rpm to USER folder..."
sudo mv epel-release-latest-7.noarch.rpm /home/$USER
echo "---------------------------------------------------"
echo "Accessing user folder..."
cd
echo "---------------------------------------------------"
echo "Installing epel-release-latest-7.noarch.rpm..."
sudo yum install -y epel-release-latest-7.noarch.rpm
echo "---------------------------------------------------"
echo "Getting componenst from repolist..."
sudo yum repolist
echo "---------------------------------------------------"
echo "Installing XRDP..."
sudo yum install -y xrdp
echo "---------------------------------------------------"
echo "Enabling xrdp..."
sudo systemctl enable xrdp --now
echo "---------------------------------------------------"
echo "Showing XRDP daemon status..."
sudo systemctl status xrdp
echo "---------------------------------------------------"
echo "Restaring XRDP daemon..."
sudo systemctl restart xrdp
echo "---------------------------------------------------"
echo "Creting XRDP permanent firewall rule..."
sudo firewall-cmd --new-zone=xrdp --permanent
echo "---------------------------------------------------"
sudo firewall-cmd --zone=xrdp --add-port=3389/tcp --permanent
echo "---------------------------------------------------"
echo "Enter ip address and subntetmask to add to the XRDP firewall rule."
echo "Format Example: 192.168.1.x/24:"
read ipaddress
echo "---------------------------------------------------"
sudo firewall-cmd --zone=xrdp --add-source=$ipaddress --permanent
echo "Added $ipaddress to XRDP firewall rules."
echo "---------------------------------------------------"
echo "Reloading firewall daemon..."
sudo firewall-cmd --reload
echo "---------------------------------------------------"
echo "Adding RDP tcp port 3389 to firewall rules..."
sudo firewall-cmd --add-port=3389/tcp --permanent
echo "---------------------------------------------------"
echo "Reloading firewall daemon again..."
sudo firewall-cmd --reload
echo "---------------------------------------------------"
echo "Installing X Window System..."
sudo yum groupinstall "X Window System"
echo "---------------------------------------------------"
echo "Installing tigervnc-server xorg-11-fonts-Type1..."
sudo yum -y install tigervnc-server xorg-x11-fonts-Type1
echo "---------------------------------------------------"
echo "Provice vnc password: "
vncpasswd
echo "---------------------------------------------------"
echo "Showing content of /home/kurogane/.vnc: "
ls -l /home/kurogane/.vnc
echo "---------------------------------------------------"
echo "Creating vnc server default startup script..."
vncserver
echo "---------------------------------------------------"
echo "Killing vncserver connection..."
vncserver -kill :1
echo "---------------------------------------------------"
echo "Listing contents of ls ~/.vnc..."
ls -l ~/.vnc
echo "---------------------------------------------------"
echo "Creating backup copy of xstartup in ~/.vnc/xstartup.backup..."
cp ~/.vnc/xstartup ~/.vnc/xstartup.backup
echo "---------------------------------------------------"
echo "Assigning executable permission to xstartup..."
chmod +x ~/.vnc/xstartup
echo "---------------------------------------------------"
echo "Creating new vnc server connection..."
vncserver
echo "---------------------------------------------------"
echo "Installing nano editor...."
sudo yum install -y nano
echo "---------------------------------------------------"
echo "Creating vncserver@.service in /etc/systemd/system/..."
sudo touch /etc/systemd/system/vncserver@.service
echo "---------------------------------------------------"
echo "Populating the file with variable contents..."
echo -e "[Unit]" >> /etc/systemd/system/vncserver@.service
echo -e " Description=Remote desktop service (VNC)\n" >> /etc/systemd/system/vncserver@.service
echo -e " After=syslog.target network.target\n" >> /etc/systemd/system/vncserver@.service
echo -e " \n" >> /etc/systemd/system/vncserver@.service
echo -e " [Service]\n" >> /etc/systemd/system/vncserver@.service
echo -e " Type=forking\n" >> /etc/systemd/system/vncserver@.service
echo -e " User=kurogane\n" >> /etc/systemd/system/vncserver@.service
echo -e " PIDFile=/home/kurogane/.vnc/%H:%i.pid\n" >> /etc/systemd/system/vncserver@.service
echo -e " ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1\n" >> /etc/systemd/system/vncserver@.service
echo -e " ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i\n" >> /etc/systemd/system/vncserver@.service
echo -e " ExecStop=/usr/bin/vncserver -kill :%i\n" >> /etc/systemd/system/vncserver@.service
echo -e " \n" >> /etc/systemd/system/vncserver@.service
echo -e "[Install]\n" >> /etc/systemd/system/vncserver@.service
echo -e "WantedBy=multi-user.target\n" >> /etc/systemd/system/vncserver@.service
echo "---------------------------------------------------"
echo "Reloading systemctl daemon..."
sudo systemctl daemon-reload
echo "---------------------------------------------------"
echo "Attempting to start vncserver@1.service..."
sudo systemctl start vncserver@1.service
echo "---------------------------------------------------"
echo "Enabling vncserver@1.service..."
systemctl enable vncserver@1.service
echo "---------------------------------------------------"
echo "Verifying vncserver@1.service status..."
systemctl status vncserver@1.service
echo "---------------------------------------------------"
echo "Displaying open sessions in vncserver list..."
vncserver -list
echo "---------------------------------------------------"
echo "Creating ssh tunnel connection..."
ssh -L 5901:127.0.0.1:5901 -N -f -l kurogane 192.168.1.30
echo "---------------------------------------------------"
echo "If all of the above succeded, continue with the following: "
echo " "
echo "Create and RDP connection with remmina,"
echo "with port $ipaddress and RDP port 3389. Use the"
echo "ssh credentials to login to remote desktop GUI"
echo "environment."
echo "---------------------------------------------------"
echo "PRESS ENTER TO TERMINATE SESSION..."
read enter



