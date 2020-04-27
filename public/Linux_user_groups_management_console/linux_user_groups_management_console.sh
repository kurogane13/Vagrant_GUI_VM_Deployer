echo "#########################################################"
echo "LINUX USERS AND GROUPS MANAGEMENT CONSOLE."
echo "#########################################################"
echo "........................................................."
echo "SELECT ONE OF THE OPTIONS IN THE MENU BELOW: "
echo "........................................................."
options=("--> Display /etc/passwd file" "--> Display SUDOERS list" "--> Find users and groups in /etc/passwd file" "--> Find USER in users List." "--> Find GROUP in groups List." "--> Find which GROUPS a USER belongs to." "--> Find ALL members of a GROUP" "--> Find USER´S PRIMARY GROUP" "--> CHANGE A USER´S PRIMARY GROUP" "--> Show USERS list" "--> Show GROUPS list" "+ ADD USER TO SUDOERS GROUP" "- REMOVE USER FROM SUDOERS GROUP" "+ NEW USER/S AND FOLDER/S" "- REMOVE USER, FOLDER AND IT´S PRIMARY GROUP" "+ NEW GROUP/S" "- DELETE GROUP/S" "+ Create a new SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE CRETAED" "- Delete a SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE DELETED" "+ Add user to a group" "- Remove user from a group" "--> Change user´s username" "--> Set | Change a user's password" "--> Change/Rename group's name")
select opt in "${options[@]}"
do 
    case $opt in

	"--> Display /etc/passwd file")
            echo "-------------------------------------"
            echo "MODE 1 - Display /etc/passwd file."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/display_etc_passwd_file.sh
            ;;

	"--> Display SUDOERS list")
            echo "-------------------------------------"
            echo "MODE 2 - Display SUDOERS list."
            echo "PRESS ENTER TO SHOW THE SUDOERS LIST NOW..."
            read enter
            grep -Po '^sudo.+:\K.*$' /etc/group
            ;;

	"--> Find users and groups in /etc/passwd file")
            echo "-------------------------------------"
            echo "MODE 3 - - Find users and groups in /etc/passwd file."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/display_users_and_groups.sh
            ;;

	"--> Find USER in users List.")
            echo "-------------------------------------"
            echo "MODE 4 - Find USER in users List."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            echo "Type the USER you wish to find and press enter..."
            read finduser
            echo "-------------------------------------"
            cut -d: -f1 /etc/passwd | grep $finduser
            echo "-------------------------------------"
            echo "If the line above returned your input,"
            echo "the user was found, otherwise re-run"
            echo "the script again and check spelling/syntax"
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

	"--> Find GROUP in groups List.")
            echo "-------------------------------------"
            echo "MODE 5 - Find GROUP in groups List."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "Type the GROUP you wish to find and press enter..."
            read findgroup
            echo "-------------------------------------"
            getent group $findgroup
            echo "-------------------------------------"
            echo "If the line above returned your input,"
            echo "the user was found, otherwise re-run"
            echo "the script again and check spelling/syntax"
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

        "--> Find which GROUPS a USER belongs to.")
            echo "-------------------------------------"
            echo "MODE 6 - Find which GROUPS a USER belongs to."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "Type the USER to see which GROUPS it belongs to..."
            read matchusergroup
            echo "-------------------------------------"
            groups $matchusergroup
            echo "-------------------------------------"
            echo "If the line above returned your input,"
            echo "the user was found, and the group/s it"
            echo "belongs to."
            echo "-------------------------------------"
            echo "Otherwise, re-run the script again and check spelling/syntax."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

	"--> Find ALL members of a GROUP")
            echo "-------------------------------------"
            echo "MODE 7 - Find ALL members of a GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "Type a GROUP name to see which members it has"
            read groupname
            echo "-------------------------------------"
            grep $groupname /etc/group
            echo "-------------------------------------"
            echo "If the line above returned your input,"
            echo "the GROUP was found, and the members who"
            echo "belong to it."
            echo "-------------------------------------"
            echo "Otherwise, re-run the script again and check spelling/syntax."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

        "--> Find USER´S PRIMARY GROUP")
            echo "-------------------------------------"
            echo "MODE 8 - Find USERS PRIMARY GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "Type a USER´s name to see which is it´s PRIMARY GROUP..."
            read primarygroup
            echo "-------------------------------------"
            id -gn $primarygroup
            echo "-------------------------------------"
            echo "If the line above returned an output,"
            echo "the PRIMARY GROUP was found, and the user"
            echo "which belongs to it."
            echo "-------------------------------------"
            echo "Otherwise, re-run the script again and check spelling/syntax."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;


	"--> CHANGE A USER´S PRIMARY GROUP")
            echo "-------------------------------------"
            echo "MODE 9 - CHANGE A USER´S PRIMARY GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            echo "Type the USERNAME, for you wish to change its primary group..."
            read username
            echo "-------------------------------------"
            echo "Now enter the NEW PRIMARY GROUP, to REPLACE the previous one entered..."
            read NewPrimaryGroup
            echo "-------------------------------------"
            echo "ATENTION: You will be changing the ACTUAL PRIMARY GROUP: $username"
            echo "for the NEW PRIMARY GROUP name: $NewPrimaryGroup"
            echo "-------------------------------------"
            echo "To confirm this action now, press enter (CTRL+C TO abort)..."
            read enter
            sudo usermod -g $NewPrimaryGroup $username
            echo "-------------------------------------"
            getent group $NewPrimaryGroup
            echo "-------------------------------------"
            echo "If the line above returned an output with "$NewPrimaryGroup
            echo "the PRIMARY GROUP was changed. "
            echo "-------------------------------------"
            echo "Otherwise, re-run the script again and check spelling/syntax."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;


	"--> Show USERS list")
            echo "-------------------------------------"
            echo "MODE 10 - Show USERS list"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            cut -d: -f1 /etc/passwd
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

	"--> Show GROUPS list")
            echo "-------------------------------------"
            echo "MODE 11 - Show GROUPS list"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            getent group
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;
##
	"+ ADD USER TO SUDOERS GROUP")
            echo "-------------------------------------"
            echo "MODE 12 - ADD USER TO SUDOERS GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
	    echo "Showing list of sudoers: "
            grep -Po '^sudo.+:\K.*$' /etc/group
            echo "-------------------------------------"
            echo "Enter EXISISTING user to add to SUDOERS group and press enter (CTRL+C) to abort..."
            read newsudoer
            echo "-------------------------------------"
            cut -d: -f1 /etc/passwd | grep $newsudoer
            echo "-------------------------------------"
            echo "If the user entered is in the line above, you can proceed"
            echo "to add it to the SUDOERS group by pressing enter now..."
            read enter
            sudo adduser $newsudoer sudo
            echo "-------------------------------------"
            echo "Re-listing the sudoers group filtering by $newsudoer:"
            grep -Po '^sudo.+:\K.*$' /etc/group | grep $newsudoer
	    echo "-------------------------------------"
            echo "If you see the user $newsudoer in the list above, it is now"
            echo "a SUDO user. If not re-run this mode again and check spelling."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;

         "- REMOVE USER FROM SUDOERS GROUP")
            echo "-------------------------------------"
            echo "MODE 13 - REMOVE USER FROM SUDOERS GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
	    echo "Showing list of sudoers: "
            grep -Po '^sudo.+:\K.*$' /etc/group
            echo "-------------------------------------"
            echo "Enter EXISISTING user to remove from SUDOERS group and press enter (CTRL+C) to abort..."
            read newsudoer
            echo "-------------------------------------"
            grep -Po '^sudo.+:\K.*$' /etc/group | grep $newsudoer
            echo "-------------------------------------"
            echo "If the user entered is in the line above, you can proceed"
            echo "to remove it to from the SUDOERS group by pressing enter now..."
            read enter
            sudo deluser $newsudoer sudo
            echo "-------------------------------------"
            echo "Re-listing the sudoers group filtering by $newsudoer:"
            grep -Po '^sudo.+:\K.*$' /etc/group | grep $newsudoer
	    echo "-------------------------------------"
            echo "If the user $newsudoer is not in the list above, it was succesfully"
            echo "removed. If you still see the user $newsudoer,"
            echo "re-run this mode again and check spelling."
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter
            ;;
##

	"+ NEW USER/S AND FOLDER/S")
            echo "-------------------------------------"
            echo "MODE 14 - NEW USER AND FOLDER"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            while :
            	do 
                    echo "Create new USER and Folder?"
		    options=("Create new USER and Folder" "No, don´t create new USER and Folder")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Create new USER and Folder") 
            								echo "-------------------------------------"
	    								echo "Enter the name of the USER  you want to"
            								echo "create and press enter..."
            								read newuser
	    								sudo useradd -m $newuser
            								echo "-------------------------------------"
	    								echo "Showing added user: "
            								cut -d: -f1 /etc/passwd | grep $newuser
	    								echo "-------------------------------------"
            								echo "Showing user folder path: "
	    								ls -la -h /home/ | grep $newuser
            								echo "-------------------------------------"
            								echo "You should now see the user added in the"
            								echo "line above. "
            								echo "-------------------------------------"
            								echo "If you don´t see it, it means it was not added,"
            								echo "please check your syntax, and re-run the program."
            								echo "-------------------------------------"
            								echo "Adding $newuser to /bin/bash..."
	    								sudo usermod --shell /bin/bash $newuser
	    								echo "-------------------------------------"
            								echo "Press enter to set a password for this user now (CTRL+C to abort)..."
            								read enter
            								sudo passwd $newuser
	    								echo "-------------------------------------"
            								echo "To switch to $newuser press enter (CTRL+C to abort)..."
            								read enter
            								su - $newuser
            								echo "-------------------------------------"
            								echo "Program terminated, press enter to close session now..."
	    								read enter
            								;;
			 "No, don´t create new USER and Folder")
									echo "You decided not to create a new user and folder. Press enter to get back to main menu..."
		                          			read enter
                                          			bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          			;;
		        esac
		    done
            	done	
            ;;
	
	"- REMOVE USER, FOLDER AND IT´S PRIMARY GROUP")
            echo "-------------------------------------"
            echo "MODE 15 - REMOVE USER, FOLDER AND PRIMARY GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            while :
            	do 
                    echo "Remove user, folder and primary group?"
		    options=("Yes, Remove user, folder and primary group" "No, don´t remove user, folder and primary group")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Yes, Remove user, folder and primary group")
            										echo "-------------------------------------"
            										echo "Enter the name of the USER  you want to"
            										echo "remove and press enter..."
            										read existinguser
	    										echo "-------------------------------------"
            										cut -d: -f1 /etc/passwd | grep $existinguser
	    										echo "-------------------------------------"
            										echo "WARNING: You will be deleting a user"
            										echo "its folder and primary group. "
            										echo "-------------------------------------"
            										echo "If you see the user matched below your input"
	    										echo "you can remove it, by pressing enter now (CTRL+C to abort)..."
            										read enter
            										sudo userdel -r $existinguser
	    										sudo rm -r /home/$existinguser
            										echo "-------------------------------------"
            										echo "Re-listing the users list: "
            										cut -d: -f1 /etc/passwd | grep $existinguser
            										echo "-------------------------------------"
            										echo "If the user is not shown above, it"
            										echo "means it was deleted."
            										echo "-------------------------------------"
            										echo "Still seeing the user?, check your spelling"
            										echo "and re-run this program again."
            										echo "-------------------------------------"
            										echo "Program terminated, press enter to close session now..."
	    										read enter
            										;;
                              "No, don´t remove user, folder and primary group")
											echo "You decided not to remove a user, its folder and primary group. Press enter to get back to main menu..."
		                          						read enter
                                          						bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          						;;
		        esac
		    done
            	done	
            ;;

	"+ NEW GROUP/S")
            echo "-------------------------------------"
            echo "MODE 16 - NEW GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            while :
            	do 
                    echo "Create new Group/s?"
		    options=("Yes Create a NEW Group" "No, don´t Create a NEW Group")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Yes Create a NEW Group") 
            							echo "-------------------------------------"
            							echo "Enter the name of the GROUP you want to"
            							echo "create and press enter..."
            							read group
            							sudo groupadd $group
	    							echo "-------------------------------------"
            							echo "Username:Password:User ID (UID)"
            							getent group $group
								echo "-------------------------------------"
								echo "If you see the GROUP in the line above,"
	    							echo "then it was created successfully."
            							echo "-------------------------------------"
            							echo "If not re-run the script and check the syntax."
            							echo "-------------------------------------"
            							echo "Program terminated, press enter to close session now..."
	    							read enter     
            							;;
			      "No, don´t Create a NEW Group")
								echo "You decided not to create a new a group. Press enter to get back to main menu..."
		                          			read enter
                                          			bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          			;;
		        esac
		    done
            	done	
            ;;

	"- DELETE GROUP/S")
            echo "-------------------------------------"
            echo "MODE 17 - DELETE GROUP"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            while :
            	do 
                    echo "Delete Group/s?"
		    options=("Yes Delete a Group" "No, don´t Delete a Group")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Yes Delete a Group") 
            							echo "-------------------------------------"
            							echo "Enter the name of the GROUP  you want to"
            							echo "delete and press enter..."
            							read group
            							echo "-------------------------------------"
            							echo "Username:Password:User ID (UID)"
            							getent group $group
            							echo "-------------------------------------"
            							echo "NOTE: Re-run the script and check the syntax if the group,"
            							echo "is not listed in the line above."
            							echo "-------------------------------------"
            							echo "WARNING: you will be deleting a group."
            							echo "If you see the GROUP in the line above,"
	    							echo "you can proceed to delete it, by pressing enter now (CTRL+C to abort)..."
            							read enter
            							sudo groupdel $group
            							echo "-------------------------------------"
            							echo "Re-listing groups: "
            							getent group $group
            							echo "-------------------------------------"
            							echo "Program terminated, press enter to close session now..."
	    							read enter     
            							;;
			     "No, don´t Delete a Group")
								echo "You decided not to delete a group. Press enter to get back to main menu..."
		                          			read enter
                                          			bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          			;;
		        esac
		    done
            	done	
            ;;

#
        "+ Create a new SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE CRETAED")
            echo "-------------------------------------"
            echo "MODE 18 - Create a new SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE CRETAED"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/add_user_linux.sh
            ;;

        "- Delete a SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE DELETED")
            echo "-------------------------------------"
            echo "MODE 19 - Delete a SUDO USER and group. SAME USERNAME AND GROUPNAME WILL BE DELETED"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/del_user_linux.sh
            ;;

	"+ Add user to a group")
            echo "-------------------------------------"
            echo "MODE 20 - Add user to a group."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            while :
            	do 
                    echo "Add user/s to group?"
		    options=("Yes add User to Group" "No, don´t add user to Group")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Yes add User to Group") 
		                          echo "---------------------------"
		        		  echo "Enter the GROUP where you want to add the user..."
		        		  read mygroup
		        		  echo "---------------------------"
		        		  getent group $mygroup
		        		  echo "---------------------------"
		        		  echo "If you see the group in the line above, press enter to proceed adding the user..."
		        		  read enter
		        	          echo "---------------------------"
					  echo "Enter an EXISTING user to add to the group (CTRL+C to abort adding another user)..." 
					  read user
					  echo "---------------------------"
					  cut -d: -f1 /etc/passwd | grep $user
					  echo "---------------------------"
					  echo "If the user is shown above, press enter to add it now (CTRL+C to abort)..."
					  read enter
					  sudo usermod -a -G $mygroup $user
					  echo "---------------------------"
					  grep $mygroup /etc/group 
					  echo "---------------------------"
					  echo "If you see "$user
					  echo "in the line above, it was added succesfully"
					  ;;

				     "No, don´t add user to Group") 
				          echo "You decided not to add a user to a group. Press enter to get back to main menu..."
		                          read enter
                                          bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          ;;
		        esac
		    done
            	done	
            ;;

	"- Remove user from a group")
            echo "-------------------------------------"
            echo "MODE 21 - Remove user from a group."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."	
            read enter
            while :
            	do 
                    echo "Remove user/s to group?"
		    options=("Yes Remove User to Group" "No, don´t remove user from Group")
		    select opt in "${options[@]}"
		    do 
			case $opt in
				    "Yes Remove User to Group") 
            			     				bash /home/$USER/Linux_user_groups_management_console/del_user_from_group.sh
            							;;
                                    "No, don´t remove user from Group")
                                                                echo "You decided not to remove a user from a group. Press enter to get back to main menu..."
		                          			read enter
                                          			bash /home/$USER/Linux_user_groups_management_console/linux_user_groups_management_console.sh
		                          ;;
		        esac
		    done
            	done	
            ;;

        
        "--> Change user´s username")
            echo "-------------------------------------"
            echo "MODE 22 - Change user´s username."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/change_user_name.sh
	    ;;


	"--> Set | Change a user's password")
            echo "-------------------------------------"
            echo "MODE 23 - Change a user's password."
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            bash /home/$USER/Linux_user_groups_management_console/change_user_password.sh
	    ;;

         "--> Change/Rename group's name")
            echo "-------------------------------------"
            echo "MODE 24 - Change/Rename group's name"
            echo "PRESS ENTER TO RUN SCRIPT NOW..."
            read enter
            echo "-------------------------------------"
            echo "Enter the name of the GROUP you wish to rename and press enter..."
            read groupname
            echo "-------------------------------------"
            getent group $groupname
            echo "-------------------------------------"
            echo "If you see the GROUP $groupname above,"
            echo "provide a NEW name and press enter to rename it now..."
            read newgroupname
            echo "-------------------------------------"
            echo "You will be replacing $groupname, "
            echo "with $newgroupname. Press enter now to make changes effective..."
            read enter
            sudo groupmod --new-name $newgroupname $groupname
            echo "-------------------------------------"
            echo "Re-listing groups filtering $newgroupname: "
            getent group $newgroupname
            echo "-------------------------------------"
	    echo "Program terminated, press enter to close session now..."
	    read enter     
            ;;

       
        *) echo "-------------------------------------"
	   echo "PLEASE ONLY SELECT NUMBERS FROM THE MENU!";;
    esac
done
