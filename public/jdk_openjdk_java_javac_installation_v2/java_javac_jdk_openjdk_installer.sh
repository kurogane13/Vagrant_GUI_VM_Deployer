echo "##################################################"
echo "JAVA JDK - OPENJDK - INSTALLER AND SETUP WIZARD"
echo "##################################################"
echo "PRESS ENTER TO START PROGRAM (CTRL+C TO ABORT)..."
read enter
echo ".................................................."
echo "PLEASE ENTER THE EXTRACTED FOLDER AND PRESS"
echo "ENTER TO CONTINUE (CTRL+C TO ABORT)..."
read folder
echo ".................................................." 
echo "ENTERED FOLDER IS: " $folder
space=" "
echo ".................................................." 
echo "TO CONFIRM AND COPY THE FOLDER NOW, PRESS ENTER (CTRL+C TO ABORT)..."
read enter
sudo mkdir -p /usr/lib/jvm
sudo cp -r $folder /usr/lib/jvm/
echo ".................................................."
echo "SHOWING CONTENTS OF FOLDER: "
ls -l -h /usr/lib/jvm/$folder
echo ".................................................."
echo "PRESS ENTER TO CONTINUE SETTING UP THE JAVA PATH NOW: "
read 
echo "..............................................."
echo "INSTALLING VERSION OF JAVA IN UPDATE ALTERNATIVES..."
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$folder/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/$folder/bin/javac" 2
echo "..............................................."
echo "PRESS ENTER TO SHOW INSTALLED OPTIONS OF JAVA..."
read
sudo update-alternatives --list java
echo ".................................................."
echo "SHOWING INSTALLED AND DEFAULT JAVA VERSION: "
java -version
echo ".................................................."
echo "SHOWING INSTALLED DEFAULT JAVAC VERSION: "
javac -version
echo ".................................................."
echo "NOW YOU WILL BE REQUESTED TO COPY THE FOLLOWING"
echo "LINES OF CODE TO ~/.bashrc FILE. YOU WILL COPY THEM"
echo "AT THE END OF THE FILE."
echo ".................................................."
###########
#JAVA PATH IN BASHRC
echo "JAVA_HOME=/usr/lib/jvm/jdk_folder_name/"
echo "export JAVA_HOME"
echo "PATH=$PATH:$JAVA_HOME"
echo "export PATH"
###########
echo ".................................................."
echo "IMPORTANT!: REMEMBER TO REPLACE THE "$folder
echo "in JAVA_HOME=/usr/lib/jvm/jdk_folder_name/"
echo "AND SAVE THE CHANGES AFTER!"
echo ".................................................."
echo "PRESS ENTER TO ACCESS THE bashrc file now..."
read enter
sudo nano ~/.bashrc
echo "..............................................."
echo "Sourcing bashrc file..."
source /etc/bash.bashrc
echo ".................................................."
echo "ONCE THE CHANGES ARE SAVED IN THE FILE."
echo "1. CLOSE THIS TERMINAL/SESSION"
echo "2. OPEN A NEW TERMINAL"
echo "3. ENTER: echo $JAVA_HOME"
echo "   YOU SHOULD GET THE PATH SET IN /usr/lib/jvm/"$folder
echo "4. ENTER: java -version"
echo "   YOU SHOULD GET AN OUTPUT SIMILAR AS THIS:"
echo "   ..............................................."
echo "   java version '1.8.0_211'"
echo "   Java(TM) SE Runtime Environment (build 1.8.0_211-b12)"
echo "   Java HotSpot(TM) 64-Bit Server VM (build 25.211-b12, mixed mode)"
echo "   ..............................................."
echo "5. ENTER: javac  -version"
echo "   YOU SHOULD GET AN OUTPUT SIMILAR AS THIS:"
echo "   javac 1.8.0_211"
echo "..............................................."
echo "IF YOU HAPPEN TO HAVE ANOTHER VERSION OF JAVA"
echo "INSTALLED, YOU WILL HAVE TO SWITCH TO IT USING"
echo "THE UPDATE ALTERNATIVES COMMAND."
echo "..............................................."
echo "Program terminated, press enter to close session now..."
read enter
exit
echo "..............................................."
