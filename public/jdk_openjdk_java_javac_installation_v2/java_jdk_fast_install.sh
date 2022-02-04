echo "##################################################"
echo "JAVA JDK FAST INSTALL SCRIPT"
echo "##################################################"
echo "PRESS ENTER TO START PROGRAM (CTRL+C TO ABORT)..."
read enter
echo ".................................................."
echo "PLEASE ENTER THE EXTRACTED FOLDER AND PRESS"
echo "ENTER TO CONTINUE (CTRL+C TO ABORT)..."
read folder
sudo mkdir -p /usr/lib/jvm
sudo cp -r $folder /usr/lib/jvm/
echo "..............................................."
echo "INSTALLING VERSION OF JAVA IN UPDATE ALTERNATIVES..."
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$folder/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/$folder/bin/javac" 2
echo "..............................................."
echo "SHOWING INSTALLED OPTIONS OF JAVA..."
sudo update-alternatives --list java
echo "..............................................."
echo "SHOWING INSTALLED AND DEFAULT JAVA VERSION: "
java -version
echo ".................................................."
echo "SHOWING INSTALLED AND DEFAULT JAVAC VERSION: "
javac -version
echo ".................................................."
echo "PRESS ENTER TO PROCEED..."
read enter
###########
#JAVA PATH IN BASHRC
echo " "
echo "JAVA_HOME=/usr/lib/jvm/$folder/" >> ~/.bashrc
echo "export JAVA_HOME" >> ~/.bashrc
echo "PATH=$PATH:$JAVA_HOME" >> ~/.bashrc
echo "export PATH" >> ~/.bashrc
###########
echo ".................................................."
echo "Program terminated, press enter to close session now..."
read enter
exit
echo "..............................................."
