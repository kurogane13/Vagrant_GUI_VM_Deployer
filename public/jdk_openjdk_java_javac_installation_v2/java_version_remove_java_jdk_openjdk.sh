

echo "###########################################"
echo "JAVA, JACAC - JDK -OPENJDK REMOVAL PROGRAM."
echo "###########################################"
echo "PRESS ENTER TO VIEW INSTALLED VERSIONS OF JAVA AND JAVAC..."
read
echo ".............................................."
echo "JAVA VERSION: "
sudo update-alternatives --list java
echo "------------------------------------"
echo "JAVAC VERSION (COMPILER): "
sudo update-alternatives --list javac
echo ".............................................."
echo "PRESS ENTER TO CONTINUE..."
read
echo ".............................................."
echo "FIRST COPY AND PASTE BELOW THE EXACT PATH FILE TO THE"
echo "JAVA VERSION YOU WISH TO REMOVE. EXAMPLE: /opt/java/jdk1.8.0_212/bin/java AND PRESS ENTER..."
quotes="'"
space=" "
read java_version
echo ".............................................."
echo "ENTERED JAVA VERSION IS: " 
echo $java_version
echo ".............................................."
echo "NOW ENTER THE JAVAC VERSION PATH (COMPILER), TO REMOVE IT..."
read javac_version
echo ".............................................."
echo "ENTTERED JAVAC VERSION IS: "
echo $javac_version 
echo ".............................................."
echo "PRESS ENTER TO REMOVE THEM WHEN YOU ARE READY... "
read enter
sudo update-alternatives --remove java$space$java_version
sudo update-alternatives --remove javac$space$javac_version
echo ".............................................."
echo "SHOWING INSTALLED VERSIONS OF JAVA AND JAVAC: "
echo "------------------------------------"
sudo update-alternatives --list java
echo "------------------------------------"
sudo update-alternatives --list javac
echo ".............................................."
echo "PROGRAM TERMINATED PRESS ENTER TO END SESSION NOW..."
read enter

