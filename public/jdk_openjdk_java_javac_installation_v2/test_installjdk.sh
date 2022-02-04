echo "########################################################"
echo "LINUX JAVA COMPONENT INSTALLATION WIZARD"
echo "########################################################"
echo "--------------------------------------------------------"
echo "Press enter to start running script now..."
read enter
sudo mkdir -p /usr/lib/jvm
echo "Created /jvm direcotry in passive mode in: /usr/lib/."
echo "--------------------------------------------------------"
echo "Listing current directory contents: "
ls -l -h
echo "--------------------------------------------------------"
echo "Enter tarball file ( enter full path to tarball if not"
echo "in current directory)"
read tarball
echo "--------------------------------------------------------"
echo "Decompressing tarball..."
echo "                                                        "
tar -xvzf $tarball -C /usr/lib/jvm
echo "--------------------------------------------------------"
echo "Displaying contents for /usr/lib/jvm/: "
echo "                                                        "
#check if files are there
ls -l -h /usr/lib/jvm/
echo "--------------------------------------------------------"
echo "Press enter to install java and javac components with"
echo "update-alternatives now..."
read enter
#update alternatives so the command java point to the new jdk 
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_212/bin/java 1
echo "Installed JAVA component from update-alternatives."
echo "--------------------------------------------------------"
#update alternatives so the command javac point to the new jdk
echo "Installed JAVAC component from update-alternatives."
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_212/bin/javac 1
echo "--------------------------------------------------------"
echo "To continue press enter to view the installed versions of java"
read enter
echo "Listing JAVA component versions installed with update-alternatives"
sudo update-alternatives --list java
echo "--------------------------------------------------------"
echo"Displaying JAVA: "
update-alternatives --display java
echo "--------------------------------------------------------"
echo"Displaying JAVA: "
update-alternatives --display javac
echo "--------------------------------------------------------"
echo "Finally, press enter to test java and javac versions now..."
#check if java is running
echo "--------------------------------------------------------"
echo "Running java -version command: "
java -version
echo "--------------------------------------------------------"
echo "Running javac -version command: "
javac -version
echo "--------------------------------------------------------"
echo "Program terminated, press enter to terminate session now..."
read ennter
