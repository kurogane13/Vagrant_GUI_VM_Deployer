#!/usr/bin/env bash


APT_GET_CMD=$(which apt-get)
YUM_CMD=$(which yum)


if [[ ! -z $YUM_CMD ]]; then
   # BEGIN ########################################################################
   echo -e "-- ---------------------------------    --\n"
   echo -e "-- BOOTSTRAPING PROCESS INITIALIZING... --\n"
   echo -e "-- ---------------------------------    --\n"
   echo -e "-- INSTALLING WEBMIN SERVER... --\n"
   sudo sed -i 's/PermitRootLogin ProhibitPassword/PermitRootLogin yes/g' /etc/ssh/sshd_config
   sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
   sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication no/g' /etc/ssh/sshd_config
   sudo service ssh restart
   echo "######################################################"
   



   echo "######################################################"
   sudo yum install -y rpm


   echo "[Webmin]" >> /etc/yum.repos.d/webmin.repo
   echo "name=Webmin Distribution Neutral" >> /etc/yum.repos.d/webmin.repo
   echo "#baseurl=http://download.webmin.com/download/yum" >> /etc/yum.repos.d/webmin.repo
   echo "mirrorlist=http://download.webmin.com/download/yum/mirrorlist" >> /etc/yum.repos.d/webmin.repo
   echo "enabled=1" >> /etc/yum.repos.d/webmin.repo
   
   

   sudo rpm --import public.gpg.key
   sudo yum update
   sudo yum install -y webmin
    
   

   
   sudo /etc/init.d/webmin start
   sudo /etc/init.d/webmin status
   
   
   
     



   
   
   
   
   
   
   echo -e "-- ---------------------------  --\n"
   echo -e "-- BOOTSTRAPING PROCESS ENDEND  --\n"
   echo -e "-- ---------------------------  --\n"
   echo -e "This program was developed by Gustavo Wydler Azuaga on 04/17/2020"
   echo -e "-- ----------------------------------------------------------------"
   echo "PROGRAM TERMINATED, PRESS ENTER TO CLOSE THE SESSION NOW..."
   read enter
   
elif [[ ! -z $APT_GET_CMD ]]; then

   echo -e "-- ---------------------------------    --\n"
   echo -e "-- BOOTSTRAPING PROCESS INITIALIZING... --\n"
   echo -e "-- ---------------------------------    --\n"
   echo -e "-- INSTALLING WEBMIN SERVER... --\n"
   echo -e " "
   sudo sed -i 's/PermitRootLogin ProhibitPassword/PermitRootLogin yes/g' /etc/ssh/sshd_config
   sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
   sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication no/g' /etc/ssh/sshd_config
   sudo /usr/bin/systemctl restart sshd.service                 
   echo "######################################################"
   



   
    
   
   echo "######################################################"
   sudo wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
   
   
  
  
  
  
   echo "deb http://download.webmin.com/download/repository sarge contrib" > webmin.list
   sudo mv webmin.list /etc/apt/sources.list.d/
   sudo apt-get update
   sudo apt-get install -y webmin #--allow--authentication
   
  
   
   sudo /etc/init.d/webmin start
   sudo /etc/init.d/webmin status
   




   
   
   
   echo -e "-- ---------------------------  --\n"
   echo -e "-- BOOTSTRAPING PROCESS ENDEND  --\n"
   echo -e "-- ---------------------------  --\n"
   echo -e "This program was developed by Gustavo Wydler Azuaga on 04/17/2020"
   echo -e "-- ----------------------------------------------------------------"
   echo "PROGRAM TERMINATED, PRESS ENTER TO CLOSE THE SESSION NOW..."
   read enter


else
   echo -e "ERROR. Unable to install Webmin server with $PACKAGE.\n"
   echo -e "#####################################################"
   echo -e "You can try installing webmin server following instructions\n"
   echo -e "here: https://www.digitalocean.com/community/tutorials/how-to-install-webmin-on-ubuntu-18-04\n"
   echo -e "Choose the apropiate linux distro, to read the docs and install it.\n"
   echo -e "#####################################################"
   echo -e "-- ---------------------------  --\n"
   echo -e "-- BOOTSTRAPING PROCESS ENDEND  --\n"
   echo -e "-- ---------------------------  --\n"
   echo -e "This program was developed by Gustavo Wydler Azuaga on 04/17/2020"
   echo -e "-- ---------------------------  --"
   echo "PROGRAM TERMINATED, PRESS ENTER TO CLOSE THE SESSION NOW..."
   read enter
fi


