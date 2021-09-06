import os
import sys
import easygui
from easygui import *
import ipaddress
from IPy import IP

loop = 0
while (loop==0):


    def exit_program():
        image = "warning.png"
        msg = "Do you want to Quit the Program?"
        title = "Quit Program?"
        choices = ["Yes", "No"]
        choice = buttonbox(msg, title, choices, image=image)
        if choice == "Yes":
            sys.exit(0)
        else:
            pass

    def vagrant_main_menu():

        vagrant_image = 'Vagrant.png'
        msg = "             >>>>>>>>>>> WELCOME TO VAGRANT VM SETUP PROGRAM <<<<<<<<<\n\n------------------------------------------------------------------------------\n\n  ---> PROGRAM DESCRIPTION, SCOPE, AND INSTRUCTIONS\n\n     - Virtual Box VM deployer\n\n     - It uses Vagrant technology to create Virtual Machines\n\n     - You will be requested to complete many fields, in order to set up your VM\n\n\n       * IMPORTANT: YOU MAY CHANGE THE SETTINGS AS MANY TIMES AS YOU WANT.\n         ONCE THE VM IS DEPLOYED, YOU MUST CHANGE THEM IN THE VIRTUAL BOX\n         SETTINGS SCREEN.\n\n\n                ---> Click the OK button to start the program"
        title = "VAGRANT GUI VM DEPLOYER PROGRAM"
        msgbox(msg, title, image=vagrant_image)
        def set_vm_values():
            
            global title_vm_values
            title_vm_values = "VM SETTINGS CHART "
            global fieldNames
            msg = "-----> THIS IS THE VM SETTINGS AND VALUES CHART <----- \n\nIMPORTANT: FOR THE VM TO BE DEPLOYED SUCCESFULLY\nALL THE FIELDS MUST BE COMPLETED:\n\n    --> Name of the VM\n    --> OS Version\n    --> Ram Size\n    --> CPU Cores amount\n\n- TO COMPLETE THE OS Version FIELD:\n\n     * EXAMPLES OF OS VERSIONS ARE:\n\n     ---> ubuntu/xenial64, ubuntu/trusty64, debian/jessie64,\n            centos/7,generic/oracle7\n\n NOTE: YOU WILL BE REQUIRED TO COMPLETE THE NETWORK\n SETTINGS IN THE NEXT SCREEN, SELECTING EITHER DHCP OR\n STATIC IP"
            fieldNames = ["Project Folder Name", "Name of the VM: ", "OS Version: ", "Ram Size in MB: ", "CPU Cores amount: "]
            global fieldValues
            fieldValues = []
            fieldValues = multenterbox(msg, title_vm_values, fieldNames)

            if fieldValues == None:
                image = "warning.png"
                msg = "Do you want to Quit the Program?"
                title = "Quit Program?"
                choices = ["Yes", "No"]
                choice = buttonbox(msg, title, choices, image=image)
                if choice == "Yes":
                    
                    sys.exit(0)
                    
                if choice == "No":
                    
                    set_vm_values()

                else:
                     set_vm_values()   
            while 1:
                
                if fieldValues == None: break
                errmsg = ""
                for i in range(len(fieldNames)):
                  if fieldValues[i].strip() == "" :
                      errmsg = errmsg + ('* ATENTION!, PLEASE COMPLETE THE "%s" FIELD. IT IS EMPTY.\n\n' % fieldNames[i])
                    
                if errmsg == "": break # no problems found
                title = "ATTENTION"
                warning = "warning.png"
                msgbox(errmsg, title, image=warning)
                fieldValues = multenterbox(msg, title, fieldNames, fieldValues)

                try:
                        
                    if (not fieldValues[3].isdigit()) and (not fieldValues[4].isdigit()):
                        title = "ATTENTION"
                        warning = "warning.png"
                        msg = "TYPE ERROR. REMEMBER ONLY INTEGERS ARE ALLOWED IN BOTH THE Ram Size in MB\n\nand THE CPU Cores amount FIELDS!\n\nCLICK OK TO GET BACK TO THE CHART"
                        msgbox(msg, title, image=warning)
                        set_vm_values()


                    if (not fieldValues[4].isdigit()) or (not fieldValues[3].isdigit()):
                        title = "ATTENTION"
                        warning = "warning.png"
                        msg = "TYPE ERROR. REMEMBER ONLY INTEGERS ARE ALLOWED IN BOTH THE Ram Size in MB\n\nand THE CPU Cores amount FIELDS!\n\nCLICK OK TO GET BACK TO THE CHART"
                        msgbox(msg, title, image=warning)
                        set_vm_values()

                except:

                    if fieldValues == None:
                        image = "warning.png"
                        msg = "Do you want to Quit the Program?"
                        title = "Quit Program?"
                        choices = ["Yes", "No"]
                        choice = buttonbox(msg, title, choices, image=image)
                        if choice == "Yes":
                            
                            sys.exit(0)
                            
                        if choice == "No":
                            
                            set_vm_values()

                        else:
                             set_vm_values()   
                
            notes = 'notes.png'
            title = "PROVIDED DATA"
            lines = "---------------------------------------------"
            msg = "                         VM DEPLOYMENT CONFIRMATION SCREEN\n                         ---------------------------------\n\n\n         * THE DATA YOU PROVIDED TO DEPLOY THE VM IS THE FOLLOWING:\n\n\n        ---> Project Folder Name: "+fieldValues[0]+'\n\n'"        ---> Vm Name: "+fieldValues[1]+'\n\n'"        ---> OS Version: "+fieldValues[2]+'\n\n'"        ---> Ram Size in MB: "+fieldValues[3]+'\n\n'"        ---> CPU Cores amount: "+fieldValues[4]+'\n\n'"        ------------------------------------------------------------------\n\n\n         * TO PROCEED TO THE NETWORK CONFIGURATION SETTINGS\n           SCREEN PRESS ---> CONFIRM NOW\n\n           WARNING: CLICKING ON THE IMAGE WILL TAKE YOU BACK TO THE CHART"
            buttons = ["CONFIRM NOW", "<-- Back to VM SETTINGS CHART", "EXIT PROGRAM"]
            confirm_data = buttonbox(msg, title,  buttons, image=notes)
            if confirm_data == "CONFIRM NOW":

                global project_name, vmname, os_release, vmram, cpu_cores, dhcp, private_ip

                project_name = str(fieldValues[0])
                vmname = str(fieldValues[1])             #VM NAME VALUE
                os_release = str(fieldValues[2])         #OS NAME VALUE    
                vmram = str(fieldValues[3])              #VM RAM VALUE
                cpu_cores = str(fieldValues[4])          #CPU CORES VALUE

                global current_path, make_copy_of_Vagrantfile, create_vagrant_folder_var, vagrant_file, cd, cp, vagrant_project_folder
                global copy_bootstrapfile, copy_public_folder, bootstrapfile
                current_path = os.getcwd()#get current path

                make_copy_of_Vagrantfile = 'cp Vagrantfile Vagrantfile_copy\n'#create copy of vagrantfile variable
                make_copy_of_bootstrap_file = 'cp bootstrap.sh bootstrap2.sh\n'
                
                create_vagrant_folder_var = "mkdir -p vagrant_program_"+project_name+"\n"#create new project folder variable
                lines = "echo '----------------------------------'\n"
                created_folder_string = "echo 'LISTING THE CREATED PROJECT FOLDER: '\n"
                list_created_folder = "ls -l | grep -w vagrant_program_"+project_name+'\n'
                close_session = "echo 'SCRIPT FINISHED, PRESS ENTER TO CLOSE THE TEMINAL...'\n"
                read_enter = "read enter"

                vagrant_file = "Vagrantfile_copy"#Vargantfile copy variable
                bootstrapfile = "bootstrap2.sh "#bootstrap apache server file variable
                publicfoldercmd = "public -r "#public shared synced folder variable
                webminfolder = "webmin-1.941 -r "
                webmindebpackage = "webmin_1.941_all.deb "
                
                cd = "cd "
                cp = "cp "
                
                vagrant_project_folder = "vagrant_program_"+project_name#vagrant project folder variable
                into_new_project = cd+current_path+"/"+vagrant_project_folder+"/"+'\n'#cd into new project folder variable
                
                publicfolder="/home/gus/Vagrant_GUI_VM_Deployer/"
                copy_public_folder = cp+" -r "+publicfolder+"public "+current_path+"/"+vagrant_project_folder+"/"+'\n'#copy public folder into to new project variable
                copy_webmin_folder = cp+webminfolder+current_path+"/"+vagrant_project_folder+"/"+"public"+'\n'#copy webmin server folder
                
                folder_creation_file_bash = open('create_folder_project.sh', 'w')#create folder project bash file
                folder_creation_file_bash.write(str(cd+current_path+'\n'))#access the current path
                folder_creation_file_bash.write(str(create_vagrant_folder_var))#create the new project
                folder_creation_file_bash.write(str(lines))#lines var
                folder_creation_file_bash.write(str(created_folder_string))#string LISTING THE CREATED PROJECT FOLDER:
                folder_creation_file_bash.write(str(list_created_folder))#listing the created folder in terminal
                folder_creation_file_bash.write(str(lines))
                folder_creation_file_bash.write(str(make_copy_of_Vagrantfile))#create the copy of the vagrantfile
                folder_creation_file_bash.write(str(make_copy_of_bootstrap_file))#create the copy of the bootstrap file
                folder_creation_file_bash.write(str(copy_public_folder))#Copy the public folder              
                folder_creation_file_bash.write(str(close_session))#close the session string SCRIPT FINISHED, PRESS ENTER TO CLOSE THE TEMINAL...
                folder_creation_file_bash.close()#close the create_folder_project.sh file
                os.system('gnome-terminal -- bash -c "bash create_folder_project.sh; read line"')#Open gnome-terminal and run the file

                def replcement_vars():
           
                    with open('Vagrantfile_copy', 'r') as file:
                        # read a list of lines into data
                        global data
                        data = file.readlines()

                    global os_release, vmname, private_ip, cpu_cores, vmram, private_network, type_var, dhcp, virtualbox_var, double_quotes #Global function vars
                    global guest, guest_port, guest_port_var, forwarded_port_var, forwarded_port_number, bootstrapfile, public_folder, var_html    #Global function vars

                    private_network = "private_network"     #DCHP PRIVATE NETWORK
                    type_var = "type: "                     #DHCP TYPE
                    dhcp = "dhcp"                           #DHCP VALUE
                    double_quotes = '"'                     #double quotes
                    virtualbox_var = "virtualbox"           #virtualbox GUI var
                    guest = ", guest: "                     #FORWARDED PORT VAR
                    guest_port = "80"                       #GUEST PORT VAR
                    guest_port_var = ", host: "             #HOST PORT VAR
                    forwarded_port_var = "forwarded_port"   #FORWARDED PORT VAR
                    #forwarded_port_number = "8080"          #FORWARDED PORT NUMBER
                    bootstrapfile = "bootstrap2.sh"         #BOOTSTRAP FILE VAR - APACHEV2 SERVER DEPLOY
                    public_folder = "public"                #PUBLIC SHARED FOLDER VAR - CREATES TUNNELED SHARED FOLDER
                    var_html = "/home/vagrant/"              #PUBLIC HTML SHARED PATH

                    global data15, data26, data27, data35, data36, data41, data43, data44, data45

                    data[15] = "  config.vm.box = "+double_quotes+os_release+double_quotes+'\n'#OS VERSION
                    data15 = data[15]
                    
                    data[26] = "  config.vm.provision :shell, path: "+double_quotes+"bootstrap.sh"+double_quotes+'\n'
                    data26 = data[26]

                    data[27] = "  config.vm.synced_folder "+double_quotes+public_folder+double_quotes+", "+double_quotes+var_html+double_quotes+'\n'
                    data27 = data[27] 

                    data[35] = "  config.vm.provider "+double_quotes+virtualbox_var+double_quotes+" "+"do"+" "+"|v|"+'\n'#VM provider settings
                    data35 = data[35]

                    data[36] = "    v.name = "+double_quotes+vmname+double_quotes+'\n'#VM NAME
                    data36 = data[36]

                    data[41] = "    v.memory = "+double_quotes+vmram+double_quotes+'\n'#VM RAM
                    data41 = data[41]

                    data[43] = "    v.cpus = "+double_quotes+cpu_cores+double_quotes+'\n'#VM CPU
                    data43 = data[43]

                    data[44] = "    v.gui = true"+'\n'#VM GUI
                    data44 = data[44]

                    data[45] = "  end"+'\n'#END OF CONFIG MODE
                    data45 = data[45]
                    pass

                def network_settings():
                    
                    notes = 'ip_icon.png'
                    title = "NETWORK SETTINGS SCREEN"
                    lines = "---------------------------------------------"
                    msg = "                 >>>> VM NETWORK SETTINGS SCREEN <<<<\n                 ------------------------------------\n\n\n       * PLEASE SELECT EITHER STATIC IP, OR DHCP ASSIGNMENT:\n\n\nWARNING: CLICKING ON THE IMAGE WILL TAKE YOU BACK TO THE CHART"
                    buttons = ["DHCP ASSIGNMENT", "STATIC IP ASSIGNMENT", "<-- Back to VM SETTINGS CHART", "EXIT PROGRAM"]
                    confirm_ip_addressing = buttonbox(msg, title,  buttons, image=notes)

                    def forwarded_port_dhcp():
                        if confirm_ip_addressing == "DHCP ASSIGNMENT":
                            
                            image = "warning.png"
                            msg = "         * MANDATORY FORWARDED PORT NUMBER REQUIRED\n\n----------------------------------------------------------------------------------\n\n      NOTE: BEFORE CONFIRMING DHCP IP ASSIGNMENT,\n\n                 IT IS MANDATORY TO SPECIFY THE PORT\n\n                 FOR THE PUBLIC SHARED FOLDER\n\n----------------------------------------------------------------------------------\n\n                 Public SHARED FOLDER PATH: YOU CAN ACCESS\n\n                 YOUR Public SHARED FOLDER ON:\n\n                 /vagrant_program_ <name_of_created_project>/\n\n----------------------------------------------------------------------------------\n\n---> PLEASE SPECIFY A UNIQUE PORT NUMBER FOR THE VM.\n\n        EXAMPLE: 8085\n\n        THE VM WILL BE ACCESSED ON:\n\n        ---> http://<dhcp_ipv4_address:forwarded_port_number\n\n - TO CONFIRM THE FORWARDED PORT AND CONTINUE TO\n\n    IP ASSIGNMENT SCREEN CLICK OK\n"
                            title = "FORWARDED PORT"
                            global forwardportnumber
                            forwardportnumber = enterbox(msg, title)
                            space = " "
                            try:
                                
                                if forwardportnumber == str(forwardportnumber):
                                    forwardportnumber = int(forwardportnumber)
                                    if forwardportnumber == str(forwardportnumber):
                                        print("NO VALID PORT NUMBER WAS PROVIDED")
                                        forwarded_port_dhcp()
                                        
                                if forwardportnumber is not None:
                                    good = "good.png"
                                    title = "PORT NUMBER PROVIDED"
                                    msg = "THE PROVIDED PORT NUMBER IS: "+str(forwardportnumber)+".\n\n\n                  * NEXT, YOU WILL CONFIRM T NOT THE DHCP IP ASSIGNMENT\n\n\n                  ---> CONFIRM PORT NUMBER AND GO TO NEXT SCREEN?\n\n\nWARNING: CLICKING ON THE IMAGE WILL TAKE YOU BACK TO THE CHART"
                                    choices = ["Yes", "No"]
                                    choice = buttonbox(msg, title, choices, image=good)
                                    forwardportnumber = str(forwardportnumber)
                                    if choice == "Yes":

                                        
                                        with open('bootstrap2.sh', 'r') as file:
                                            # read a list of lines into data
                                            global data
                                            data = file.readlines()

                                        double_quotes = '"'
                                        quotes = " '"
                                        quote1 = "'"
                                        webminiserv=" /etc/webmin/miniserv.conf"

                                        data[1] = "forwarded_port="+forwardportnumber+'\n'
                                        
                                        data[19] = "   echo -e 'In the meantime you can already log in to the box,'\n"
                                        data[21] = "   echo -e 'with ssh vagrant@<assigned-dhcp.address> and password vagrant'\n"
                                        data[46] = "   sudo firewall-cmd --permanent --zone=public --add-port="+forwardportnumber+"/tcp"+"\n"
                                        data[48] = "   echo -e '7: ---> Added custom defined webmin port "+forwardportnumber+" to firweall rules'\n"
                                        data[50] = "   sed -i 's/port=10000/port="+forwardportnumber+"/g'"+webminiserv+"\n"
                                        data[52] = "   echo -e '---> YOU CAN NOW TRY LOGGING INTO: https://<assigned-dhcp.address>:"+forwardportnumber+"'\n"
                                        data[54] = "   echo -e 'with username: vagrant, and password: vagrant'\n"

                                        data[78] = "   echo -e 'In the meantime you can already log in to the box,'\n"
                                        data[80] = "   echo -e 'with ssh vagrant@<assigned-dhcp.address> and password vagrant'\n"
                                        data[87] = "   sudo ufw allow "+forwardportnumber+"\n"
                                        data[89] = "   echo -e '---> Added custom defined webmin port "+forwardportnumber+" to firweall rules'\n"
                                        data[102] = "   sed -i 's/port=10000/port="+forwardportnumber+"/g'"+webminiserv+"\n"
                                        data[104] = "   echo -e '---> YOU CAN NOW TRY LOGGING INTO: https://<assigned-dhcp.address>:"+forwardportnumber+"'\n"
                                        data[106] = "   echo -e 'with username: vagrant, and password: vagrant'\n"
                                        
                                        with open('bootstrap2.sh', 'w') as file:
                                            file.writelines(data)
                                            
                                        image = "warning.png"
                                        msg = "DO YOU WANT TO CONFIRM DHCP ASSIGNMENT, AND DEPLOY THE VM NOW?"
                                        title = "CONFIRM DHCP?"
                                        choices = ["Yes", "No"]
                                        choice = buttonbox(msg, title, choices, image=image)
                                        if choice == "Yes":
                                            
                                            replcement_vars()
                                            data[23] = "  config.vm.network "+double_quotes+private_network+double_quotes+", "+type_var+double_quotes+dhcp+double_quotes+'\n'#DHCP MODE
                                            data[19] = "  config.vm.network "+double_quotes+forwarded_port_var+double_quotes+guest+guest_port+guest_port_var+forwardportnumber+'\n'#Forward port

                                            # and write everything back

                                            with open('Vagrantfile_copy', 'w') as file:
                                                file.writelines( data )

                                            move_Vagrant_file_to_project_folder = "mv "+vagrant_file+" "+current_path+"/"+vagrant_project_folder+"/"+'\n'#copy Vagrantfile_copy file to new project variable
                                            back_to_originalvagrant_file = "mv Vagrantfile_copy Vagrantfile\n"#Rename file Vagrantfile_copy back to Vagrantfile
                                            move_bootstrap2_file_to_project_folder = "mv "+bootstrapfile+" "+current_path+"/"+vagrant_project_folder+"/"+'\n'
                                            back_to_original_bootstrap_file = "mv bootstrap2.sh bootstrap.sh\n"
                                            
                                         
                                            copy_vagrant_to_project_folder = open('run_vagrant.sh', 'w')
                                            copy_vagrant_to_project_folder.write(str(move_Vagrant_file_to_project_folder))#Copy the vagrant folder to new project
                                            copy_vagrant_to_project_folder.write(str(move_bootstrap2_file_to_project_folder))
                                            copy_vagrant_to_project_folder.write(str(into_new_project))#Access the new project
                                            copy_vagrant_to_project_folder.write(str(back_to_original_bootstrap_file))
                                            copy_vagrant_to_project_folder.write(str(back_to_originalvagrant_file))#rename the Vagrantfile
                                            copy_vagrant_to_project_folder.write(str('gnome-terminal -- bash -c "vagrant up; read line"'))
                                            copy_vagrant_to_project_folder.close()
                                            os.system('gnome-terminal -- bash run_vagrant.sh')
                                            vagrant_main_menu()
                                            
                                        if choice == "No":
                                            
                                            network_settings()

                                        else:
                                             network_settings()

                                    if choice == "No":
                                        
                                        forwarded_port_dhcp()

                                if forwardportnumber is None:
                                    image = "warning.png"
                                    msg = "Do you want to Quit the Program?"
                                    title = "Quit Program?"
                                    choices = ["Yes", "No"]
                                    choice = buttonbox(msg, title, choices, image=image)
                                    if choice == "Yes":
                                        sys.exit(0)

                                    if choice == "No":
                                        forwarded_port_dhcp()

                                    
                                else:
                                    image = "warning.png"
                                    msg = "Do you want to Quit the Program?"
                                    title = "Quit Program?"
                                    choices = ["Yes", "No"]
                                    choice = buttonbox(msg, title, choices, image=image)
                                    if choice == "Yes":
                                        sys.exit(0)

                                    if choice == "No":
                                        forwarded_port_dhcp()

                            except ValueError:

                                forwardportnumber = None
                                if forwardportnumber is None:
                                    
                                    redcross = "redcross.png"
                                    msg = "ERROR: ONLY NUMBERS ARE ALLOWED\n\n---> CLICK OK TO GET BACK TO THE PROMPT"
                                    title = "ERROR"
                                    msgbox(msg, title, image=image)
                                    forwarded_port_dhcp()

                    forwarded_port_dhcp()
                    
                    
                    if confirm_ip_addressing == "STATIC IP ASSIGNMENT":

                        def forwarded_port_static():

                            image = "warning.png"
                            msg = "         * MANDATORY FORWARDED PORT NUMBER REQUIRED\n\n----------------------------------------------------------------------------------\n\n      NOTE: BEFORE CONFIRMING STATIC IP ASSIGNMENT,\n\n                 IT IS MANDATORY TO SPECIFY THE PORT\n\n                 FOR THE PUBLIC SHARED FOLDER\n\n----------------------------------------------------------------------------------\n\n                 Public SHARED FOLDER PATH: YOU CAN ACCESS\n\n                 YOUR Public SHARED FOLDER ON:\n\n                 /vagrant_program_ <name_of_created_project>/\n\n----------------------------------------------------------------------------------\n\n---> PLEASE SPECIFY A UNIQUE PORT NUMBER FOR THE VM.\n\n        EXAMPLE: 8085\n\n        THE VM WILL BE ACCESSED ON:\n\n        ---> http://<provided_ipv4_address:forwarded_port_number\n\n - TO CONFIRM THE FORWARDED PORT AND CONTINUE TO\n\n    IP ASSIGNMENT SCREEN CLICK OK\n\nWARNING: CLICKING ON THE IMAGE WILL TAKE YOU BACK TO THE CHART"
                            title = "FORWARDED PORT"
                            global forwardportnumber
                            forwardportnumber = enterbox(msg, title)
                            space = " "
                            try:

                                if forwardportnumber == str(forwardportnumber):
                                    forwardportnumber = int(forwardportnumber)
                                    if forwardportnumber == str(forwardportnumber):
                                        print("NO VALID PORT NUMBER WAS PROVIDED")
                                        forwarded_port_static()
                                        
                                if forwardportnumber is not None:
                                    good = "good.png"
                                    title = "PORT NUMBER PROVIDED"
                                    msg = "THE PROVIDED PORT NUMBER IS: "+str(forwardportnumber)+".\n\n\n                  * IN THE NEXT SCREEN YOU WILL DEFINE THE STATIC IP \n\n\n                  ---> CONFIRM PORT NUMBER AND GO TO NEXT SCREEN?"
                                    choices = ["Yes", "No"]
                                    choice = buttonbox(msg, title, choices, image=good)
                                    forwardportnumber = str(forwardportnumber)
                                    if choice == "Yes":
                                        def static_ip():
                                            
                                            title = "IP ADDRESS ASSIGNMENT"
                                            msg = "THIS IS THE STATIC IP ADDRESS ASSIGNMENT SCREEN.\n\n-----------------------------------------------------------------------\n\nPLEASE TYPE A VALID PRIVATE IP ADDRESS, \n\nWHICH IS NOT IN YOUR LAN SEGMENT.\n\n\n - IF YOUR LAN IS IN THE 192.168.0.X/24\n\n   SEGMENT RANGE, PLEASE SET THE IP\n\n   TO A 192.168.1.x/24 ADDRESS.\n\n\n - NOTE: DO NOT ENTER THE /24 PLEASE."
                                            enter_private_ip_address = enterbox(msg, title)
                                            quote = "'"
                                            
                                            try:
                                                
                                                def confirm_ip_address():
                                                    
                                                    global ipv4address
                                                    ipv4address = str(ipaddress.ip_address(enter_private_ip_address))
                                                    #print("You entered IP: "+enter_private_ip_address)
                                                    warning = "warning.png"
                                                    title = "CONFIRM IP ADDRESS"
                                                    msg = "STATIC IP ADDRESS CONFIRMATION\n\nTHE STATIC IP YOU PROVIDED IS: "+ipv4address+'\n\n'+"DO YOU WANT TO CONFIRM THIS IP AND DEPLOY THE VM NOW?"
                                                    choices = ["Yes", "No"]
                                                    choice = buttonbox(msg, title, choices, image=warning)
                                                    if choice == "Yes":

                                                        with open('bootstrap2.sh', 'r') as file:
                                                            # read a list of lines into data
                                                            global data
                                                            data = file.readlines()

                                                        double_quotes = '"'
                                                        quotes = " '"
                                                        quote1 = "'"
                                                        webminiserv=" /etc/webmin/miniserv.conf"

                                                        data[1] = "forwarded_port="+forwardportnumber+'\n'
                                                        data[2] = "static_ip_add="+ipv4address+'\n'
                                                        
                                                        data[19] = "   echo -e 'In the meantime you can already log in to the box,'\n"
                                                        data[21] = "   echo -e 'with ssh vagrant@"+ipv4address+":"+" and password vagrant'\n"
                                                        data[46] = "   sudo firewall-cmd --permanent --zone=public --add-port="+forwardportnumber+"/tcp"+"\n"
                                                        data[48] = "   echo -e '---> Added custom defined webmin port "+forwardportnumber+" to firweall rules'\n"
                                                        data[50] = "   sed -i 's/port=10000/port="+forwardportnumber+"/g'"+webminiserv+"\n"
                                                        data[52] = "   echo -e '---> YOU CAN NOW TRY LOGGING INTO: https://"+ipv4address+':'+forwardportnumber+"'\n"
                                                        data[54] = "   echo -e 'with username: vagrant, and password: vagrant'\n"

                                                        data[78] = "   echo -e 'In the meantime you can already log in to the box,'\n"
                                                        data[80] = "   echo -e 'with ssh vagrant@"+ipv4address+":"+" and password vagrant'\n"
                                                        data[87] = "   sudo ufw allow "+forwardportnumber+"\n"
                                                        data[89] = "   echo -e '---> Added custom defined webmin port "+forwardportnumber+" to firweall rules'\n"
                                                        data[102] = "   sed -i 's/port=10000/port="+forwardportnumber+"/g'"+webminiserv+"\n"
                                                        data[104] = "   echo -e '---> YOU CAN NOW TRY LOGGING INTO: https://"+ipv4address+":"+forwardportnumber+"'\n"
                                                        data[106] = "   echo -e 'with username: vagrant, and password: vagrant'\n"
                                                        
                                                        
                                                        
                                                        with open('bootstrap2.sh', 'w') as file:
                                                            file.writelines(data)
                                                            
                                                        quotes = "'"
                                                        replcement_vars()
                                                        data[25] = "  config.vm.network 'private_network', ip: "+quotes+enter_private_ip_address+quotes+'\n'#PRIVATE STATIC IP
                                                        data[19] = "  config.vm.network "+double_quotes+forwarded_port_var+double_quotes+guest+guest_port+guest_port_var+forwardportnumber+'\n'#Forward port

                                                        # and write everything back

                                                        with open('Vagrantfile_copy', 'w') as file:
                                                            file.writelines( data )


                                                        make_copy_of_pubkey = "cp public.gpg.key copy_of_public.gpg.key"
                                                        
                                                        move_Vagrant_file_to_project_folder = "mv "+vagrant_file+" "+current_path+"/"+vagrant_project_folder+"/"+'\n'#copy Vagrantfile_copy file to new project variable
                                                        move_pubkey_to_project_path = "mv copy_of_public.gpg.key "+current_path+"/"+vagrant_project_folder+"/"+'\n'
                                                        move_bootstrap2_file_to_project_folder = "mv "+bootstrapfile+" "+current_path+"/"+vagrant_project_folder+"/"+'\n'
                                                        
                                                        back_to_originalvagrant_file = "mv Vagrantfile_copy Vagrantfile"+'\n'#Rename file Vagrantfile_copy back to Vagrantfile         
                                                        back_to_original_bootstrap_file = "mv bootstrap2.sh bootstrap.sh"+'\n'  
                                                        back_to_original_pubkey_name = "mv copy_of_public.gpg.key public.gpg.key"+'\n'
                                                                        
                                                        copy_vagrant_to_project_folder = open('run_vagrant.sh', 'w')
                                                        copy_vagrant_to_project_folder.write(str(make_copy_of_pubkey))#make copy of pubkey
                                                        copy_vagrant_to_project_folder.write(str(move_Vagrant_file_to_project_folder))#Copy the vagrant folder to new project
                                                        copy_vagrant_to_project_folder.write(str(move_bootstrap2_file_to_project_folder))
                                                        copy_vagrant_to_project_folder.write(str(move_pubkey_to_project_path))
                                                        copy_vagrant_to_project_folder.write(str(into_new_project))#Access the new project
                                                        copy_vagrant_to_project_folder.write(str(back_to_original_pubkey_name))
                                                        copy_vagrant_to_project_folder.write(str(back_to_originalvagrant_file))#rename the Vagrantfile
                                                        copy_vagrant_to_project_folder.write(str(back_to_original_bootstrap_file))#rename bootstrap file
                                                        
                                                        copy_vagrant_to_project_folder.write(str('gnome-terminal -- bash -c "vagrant up; read line"'))
                                                        copy_vagrant_to_project_folder.close()
                                                        os.system('gnome-terminal -- bash run_vagrant.sh')
                                                        vagrant_main_menu()


                                                    if choice == "No":
                                                        network_settings()

                                                    else:
                                                        network_settings()

                                                confirm_ip_address() 

                                                    
                                            except ValueError:
                                                if enter_private_ip_address is None:
                                                    warning = "warning.png"
                                                    title = "EXIT PROGRAM"
                                                    msg = "DO YOU WANT TO EXIT THE PROGRAM?"
                                                    choices = ["Yes", "No"]
                                                    choice = buttonbox(msg, title, choices, image=warning)
                                                    if choice == "Yes":
                                                        sys.exit(0)

                                                    if choice == "No":
                                                        static_ip()

                                                    else:
                                                        static_ip()
                                                    

                                                if enter_private_ip_address is not None:
                                                    redcross = "redcross.png"
                                                    title = "ERROR"
                                                    msg = "ERROR. NO VALID INPUT DETECTED. PLEASE ENTER A VALID IPv4 ADDRESS.\n\n\n                  ---> EXAMPLE: 192.168.1.100\n\n\nDO NOT ENTER THE SUBNET MASK\n\n\nCLICK OK TO GET BACK TO THE PROMPT"
                                                    msgbox(msg, title, image=redcross)
                                                    static_ip()

                                                else:
                                                    
                                                    redcross = "redcross.png"
                                                    title = "ERROR"
                                                    msg = "THE PROVIDED DATA: "+enter_private_ip_address+" IS NOT A VALID IPv4 ADDRESS\n\nPLEASE RE-ENTER A VALID IPv4 ADDRESS\n\nCLICK OK TO GET BACK TO PROMPT"
                                                    msgbox(msg, title, image=redcross)
                                                    static_ip()                               
                                                        
                                        static_ip()

                                        

                                    if choice == "No":
                                        forwarded_port_static()
                                        
                                    forwarded_port_static()


                                else:
                                    image = "warning.png"
                                    msg = "Do you want to Quit the Program?"
                                    title = "Quit Program?"
                                    choices = ["Yes", "No"]
                                    choice = buttonbox(msg, title, choices, image=image)
                                    if choice == "Yes":
                                        sys.exit(0)

                                    if choice == "No":
                                        forwarded_port_static()

                            except ValueError:

                                forwardportnumber = None
                                if forwardportnumber is None:
                                    
                                    redcross = "redcross.png"
                                    msg = "ERROR: ONLY NUMBERS ARE ALLOWED\n\n---> CLICK OK TO GET BACK TO THE PROMPT"
                                    title = "ERROR"
                                    msgbox(msg, title, image=image)
                                    forwarded_port_static()
                                    
                        forwarded_port_static()

                                                
                    if confirm_ip_addressing == "<-- Back to VM SETTINGS CHART":
                        set_vm_values()

                    if confirm_ip_addressing == "EXIT PROGRAM":
                        
                        image = "warning.png"
                        msg = "Do you want to Quit the Program?"
                        title = "Quit Program?"
                        choices = ["Yes", "No"]
                        choice = buttonbox(msg, title, choices, image=image)
                        if choice == "Yes":
                            
                            sys.exit(0)
                            
                        if choice == "No":
                            
                            network_settings()

                        else:
                            network_settings()
                             
                network_settings()          

            if confirm_data == "<-- Back to VM SETTINGS CHART":
                set_vm_values()

            if confirm_data == "EXIT PROGRAM":
                
                image = "warning.png"
                msg = "Do you want to Quit the Program?"
                title = "Quit Program?"
                choices = ["Yes", "No"]
                choice = buttonbox(msg, title, choices, image=image)
                if choice == "Yes":
                    
                    sys.exit(0)
                    
                if choice == "No":
                    
                    set_vm_values()

                else:
                     set_vm_values()

            else:
                set_vm_values()

        set_vm_values()        

    vagrant_main_menu()



    


        
