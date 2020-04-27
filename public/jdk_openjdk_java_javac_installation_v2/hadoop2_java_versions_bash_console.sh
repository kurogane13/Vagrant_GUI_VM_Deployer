echo "#########################################################"
echo "JAVA LINUX CLI - JDK SETUP AND CONFIGURATION PROGRAM."
echo "#########################################################"
echo "........................................................."
echo "SELECT ONE OF THE OPTIONS IN THE MENU BELOW: "
echo "........................................................."
options=("- JAVA JDK INSTALLER" "- CHECK JAVA INSTALLED VERSIONS" "- CHECK SET JAVA HOME PATH" "- INSTALL A JAVA VERSION" "- REMOVE A JAVA VERSION" "- FORWARDED PORT")
select opt in "${options[@]}"
do 
    case $opt in

        "- JAVA JDK INSTALLER")
            echo "-------------------------------------"
            echo "MODE 1 - JAVA JDK INSTALLER."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/java_javac_jdk_openjdk_installer.sh
            
            ;;

        "- CHECK JAVA INSTALLED VERSIONS")
            echo "-------------------------------------"
            echo "MODE 2 - CHECK JAVA INSTALLED VERSIONS."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/check_java_installed_versions.sh
            ;;

        
        "- CHECK SET JAVA HOME PATH")
            echo "-------------------------------------"
            echo "MODE 3 - CHECK SET JAVA HOME PATH"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/check_set_java_home_path.sh
            ;;

        "- INSTALL A JAVA VERSION")
            echo "-------------------------------------"
            echo "MODE 4 - INSTALL A JAVA VERSION"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/java_version_install_java_jdk_openjdk.sh
            ;;

        "- REMOVE A JAVA VERSION")
            echo "-------------------------------------"
            echo "MODE 5 - REMOVE A JAVA VERSION"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/java_version_remove_java_jdk_openjdk.sh
            ;;

	"- SWITCH JAVA VERSION")
            echo "-------------------------------------"
            echo "MODE 6 - SWITCH JAVA VERSION"
	    echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/hadoop2/jdk_openjdk_java_javac_installation/switch_java_jdk_openjdk_version.sh
            ;;

        *) echo "-------------------------------------"
	   echo "PLEASE ONLY SELECT NUMBERS FROM THE MENU!";;
    esac
done
