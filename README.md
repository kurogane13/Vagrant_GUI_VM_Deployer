# Vagrant GUI VM Deployer
Python GUI version of the vagrant deploy program.
-----------------------------------------------------------------------------------------------------------------------

NOTE: To view the program screenshots, access the Screenshots folder
-----------------------------------------------------------------------------------------------------------------------

Author: Gustavo Wydler Azuaga - 04-19-2020
-----------------------------------------------------------------------------------------------------------------------

Mandatory to run the program:

  - Python 3.x interpreter installed
  - Python program libraries installed (open the vagrant_gui.py file and import all the libraries)
  - Virtualbox installed (generic preferred)
  - gnome-terminal
  - Vagrant installed: You can download it from https://www.vagrantup.com/downloads.html
-----------------------------------------------------------------------------------------------------------------------
Setup and running the program:

  - Clone the repository (git clone)
  - Open the terminal, access the folder, and run the the vagrant_gui.py file from within the folder. python3.x 
    vagrant_gui.py
  
  - NOTE: The .png files must be copied to the path where the program is launched. Recomended is to copy them to your user   
    folder, and run the program from your directory. If they are not in the correct path, the program will run, but the 
    images won´t be seen.
  
-----------------------------------------------------------------------------------------------------------------------
About the program. How it works, features and presentation.

The program is a GUI based software, which deploys vagrant virtual machines. 
It is an interactive program, which works with forms, charts, user input, and provides data confirmation, validation, and error checking.

  - The first is a Welcome screen which describes the program´s scope.
  - In the following screen you will be required to enter 5 mandatory fields in order to deploy the VM correctly.
  
      - Project Folder Name
      - Name of the VM
      - OS Version
      - RAM size in MB
      - CPU Cores amount
     
   - After completing the chart, you will be presented with data confirmation screen.
   
   - Once you confirm it, a gnome terminal will open, and show the created project folder named after      
     vagrant_program_<name_provided>.
     
   - In the next screen, you may select between DHCP or Static Ip assignment. 
   
   - On to the next scren, and before deploying the vm, you will need to provide a unique port number, to install the webmin 
     server and forward it to the server. It will be hardcoded in the /etc/webmin/miniserv.conf file, and a tcp firewall rule      with the port will be set for you.
     
   - Moving forward to another screen, if you selected DHCP, you will be required to confirm the settings, to deploy it. If        Static ip mode was selected, you are led to another screen to enter a valid static ip address. The ip must be outside  
     your subnet segment. Example: if your lan segment is in the 192.168.1.x/24, you should set it to 192.168.2.x/24, or   
     other subnet. You must not enter the subnet mask.
     
How the code works:    
   
   - In a general perspective, and after providing and confirming the settings (either for static or dhcp mode) the vagrant   
     up command is run being the Vagrantfile previously parsed, and edited with the data you provided. 
     
   - For distros which are not Ubuntu/Debian, such as Centos, Fedora, Oracle, RHEL, and which use yum and rpm for package    
     management, a pubkey is imported with rpm to install the webmin server. 
     
   - A Public folder (sharing folder) is placed in the /home/vagrant path, to share files between host and guest.
   
   - Once the previous step is completed, then the vm is ready to be accessed.
   
   - The /etc/ssh/sshd_config file gets edited when provisioning the vm, so that you can access it without editing the   
     settings
     
   - Webmin installation: After the previous step, the keys are added to the /etc/apt/sources.list file and then the linux   
     distro gets updated (apt-get update/yum update)
   
   - When the updates are completed, and the server is installed, you should be able to access it like this: 
     
     https://<dhcp_ipv4_address/entered_static_ip_address>:<entered_port_number>
     
     If you cannot access the server, because the webmin daemon did not start correctly, access the VM and enter:
     sudo /etc/init.d/webmin start, or better still reboot the vm.
     
 
