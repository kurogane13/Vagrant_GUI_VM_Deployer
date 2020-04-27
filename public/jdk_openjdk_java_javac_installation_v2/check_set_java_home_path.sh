echo "#######################################################"
echo "JAVA_HOME PATH SETUP/CHECK PROGRAM."
echo "#######################################################"
echo "TO CHECK OR SET THE 'JAVA_HOME' ENV PATH, YOU NEED TO"
echo "ACCESS THE ~/.bashrc FILE, AND CHECK/PASTE THE PATH TO"
echo "YOUR JAVA BINARY FILE."
echo "......................................................."
echo "PRESS ENTER TO VIEW THE TEMPLATE NEEDED TO SETUP/CHECK"
echo "THE PATH IN THE ~/.bashrc FILE..."
read
cat /home/$USER/jdk_openjdk_java_javac_installation/java_home.txt
echo "......................................................."
echo "COPY AND PASTE THE TEMPLATE AT THE END OF THE  ~/.bashrc"
echo "FILE, IF IT IS STILL NOT SET."
echo "......................................................."
echo "PRESS ENTER NOW TO ACCESS THE ~/.bashrc FILE..."
read
sudo nano ~/.bashrc
echo "......................................................."
echo "FOR CHANGES TO TAKE EFFECT, CLOSE THIS TERMINAL/SESSION"
echo "AND RE-OPEN A NEW ONE."
echo "ENTER THE FOLLOWING LINE: "
cat  /home/$USER/jdk_openjdk_java_javac_installation/java_home_path.txt
echo "......................................................."
echo "YOU SHOULD GET THE OUTPUT OF THE: "
cat  /home/$USER/jdk_openjdk_java_javac_installation/java_home_path.txt
echo "......................................................."
echo "PROGRAM TERMINATED. PRESS ENTER TO TERMINATE SESSION NOW..."
read
