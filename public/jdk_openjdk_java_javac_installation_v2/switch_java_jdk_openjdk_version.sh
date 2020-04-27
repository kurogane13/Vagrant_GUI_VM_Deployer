echo "#################################################"
echo "JAVA - JDK -OPENJDK VERSION - SWITCHER PROGRAM"
echo "#################################################"
echo "PRESS ENTER TO VIEW INSTALLED VERSIONS OF JAVA..."
read
sudo update-alternatives --list java
echo "................................................."
echo "NOW PRESS ENTER AGAIN TO ACCESS JAVA"
echo "UPDATE-ALTERNATIVES JAVA VERSION SWITCHER..."
read
sudo update-alternatives --config java
echo "................................................."
echo "CHANGE THE JAVAC VERSION (COMPILER) TO THE SAME AS"
echo "JAVA VERSION. PRESS ENTER TO ACCESS UPDATE-ALTERNATIVES"
echo "JAVA VERSION SWITCHER..."
read 
sudo update-alternatives --config javac
echo "................................................."

