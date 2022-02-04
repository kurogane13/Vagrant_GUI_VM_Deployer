echo "#########################################################"
echo "JAVA LINUX CLI - JDK SETUP AND CONFIGURATION PROGRAM."
echo "#########################################################"
echo "........................................................."
echo "SELECT ONE OF THE OPTIONS IN THE MENU BELOW: "
echo "........................................................."
options=("- JAVA JDK VERSION - INSTALLER WIZARD" "- JAVA JDK VERSION FAST INSTALL" "- REMOVE A JDK VERSION" "- SHOW JAVA INSTALLED VERSIONS" "- SET THE JAVA HOME PATH" "- SWITCH JAVA VERSION" "- SHOW DEFAULT JAVA VERSION USED" "- SHOW JAVA HOME PATH " "- CHANGE OR UPDATE CURRENT JAVA VERSION IN UPDATE ALTERNATIVES " "- CHANGE OR UPDATE CURRENT JAVAC (COMPILER) VERSION IN UPDATE ALTERNATIVES ")
select opt in "${options[@]}"
do 
    case $opt in

        "- JAVA JDK VERSION - INSTALLER WIZARD")
            echo "-------------------------------------"
            echo "MODE 1 - JAVA JDK INSTALLER."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_javac_jdk_openjdk_installer.sh
            
            ;;

	"- JAVA JDK VERSION FAST INSTALL")
            echo "-------------------------------------"
            echo "MODE 2 - FAST INSTALL SCRIPT."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_jdk_fast_install.sh
            
            ;;

	"- REMOVE A JDK VERSION")
            echo "-------------------------------------"
            echo "MODE 3 - REMOVE A JAVA VERSION"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_version_remove_java_jdk_openjdk.sh
            ;;


        "- SHOW JAVA INSTALLED VERSIONS")
            echo "-------------------------------------"
            echo "MODE 4 - CHECK JAVA INSTALLED VERSIONS."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_java_installed_versions.sh
            ;;

        
        "- SET THE JAVA HOME PATH")
            echo "-------------------------------------"
            echo "MODE 5 - CHECK SET JAVA HOME PATH"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_set_java_home_path.sh
            ;;

	"- SWITCH JAVA VERSION")
            echo "-------------------------------------"
            echo "MODE 6 - SWITCH JAVA VERSION"
	    echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/jdk_openjdk_java_javac_installation_v2/switch_java_jdk_openjdk_version.sh
            ;;

	"- SHOW DEFAULT JAVA VERSION USED")
            echo "-------------------------------------"
            echo "MODE 7 - CURRENTLY USED DEFAULT JAVA VERSION"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            echo "SHOWING ACTUALLY USED JAVA VERSION.."
            java -version
            echo "-------------------------------------"
            echo "SHOWING ACTUALLY USED JAVAC (compiler) VERSION.."
            javac -version
            echo "-------------------------------------"
            echo "SCRIPT FINISHED RUNNING, PRESS ENTER TO GET OUT OF THIS MODE..."
            read enter
            ;;

	"- SHOW JAVA HOME PATH ")
            echo "-------------------------------------"
            echo "MODE 8 - JAVA HOME PATH"
            echo "-------------------------------------"
	    echo "PRESS ENTER TO VIEW JAVA HOME PATH IN BASHRC..."
	    read enter
	    echo "-----------------------------------------------"
	    echo "JAVA HOME IS SET TO: "
	    echo " "
	    echo $JAVA_HOME
	    echo "-----------------------------------------------"
	    echo "PRESS ENTER TO CLOSE..."
	    read enter
            ;;


	"- CHANGE OR UPDATE CURRENT JAVA VERSION IN UPDATE ALTERNATIVES ")
	    echo "------------------------------------------------------"
            echo "MODE 9 - CHANGE OR UPDATE CURRENT JAVA VERSION"
	    echo "------------------------------------------------------"
	    echo "UPDATE OT CHANGE CURRENT JAVA VERSION IN UPDATE-ALTERNATIVES."
            echo "PRESS ENTER TO START SCRIPT NOW..."
            read enter
            echo "------------------------------------------------------"
            sudo update-alternatives --config java
            echo " "
            echo "------------------------------------------------------"
            echo "PROGRAM TERMINATED. PRESS ENTER TO GET OUT OF THIS MODE..."
            read enter
            ;;

	"- CHANGE OR UPDATE CURRENT JAVAC (COMPILER) VERSION IN UPDATE ALTERNATIVES ")
	    echo "------------------------------------------------------"
            echo "MODE 10 - CHANGE OR UPDATE CURRENT JAVAC (COMPILER) VERSION"
	    echo "------------------------------------------------------"
	    echo "UPDATE OT CHANGE CURRENT JAVA VERSION IN UPDATE-ALTERNATIVES."
            echo "PRESS ENTER TO START SCRIPT NOW..."
            read enter
            echo "------------------------------------------------------"
            sudo update-alternatives --config javac
            echo " "
            echo "------------------------------------------------------"
            echo "PROGRAM TERMINATED. PRESS ENTER TO GET OUT OF THIS MODE..."
            read enter
            ;;


        *) echo "-------------------------------------"
	   echo "PLEASE ONLY SELECT NUMBERS FROM THE MENU!";;
    esac
done
