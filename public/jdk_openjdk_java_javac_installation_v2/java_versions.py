from tkinter import *
#import tkMessageBox
import tkinter
import time
import datetime
import os
window_title='JAVA - JDK - OPENJDK CONSOLE'
window_size='455x240'
window= Tk()
window.title(window_title)
window.geometry(window_size)
window.config(background = 'orange')

def JAVA_JDK_VERSION_INSTALLER_WIZARD():
    JAVA_JDK_VERSION_INSTALLER_WIZARDcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_javac_jdk_openjdk_installer.sh')
    return JAVA_JDK_VERSION_INSTALLER_WIZARDcommand
JAVA_JDK_VERSION_INSTALLER_WIZARD=Button(window, text='JDK INSTALLATION WIZARD', fg='white', bg='black', width=25, height=2, command=JAVA_JDK_VERSION_INSTALLER_WIZARD)
JAVA_JDK_VERSION_INSTALLER_WIZARD.grid(row=0, column=0)
buttonname = 'CHECK INSTALLED VERSIONS'
command = 'bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_java_installed_versions.sh'

def JAVA_JDK_VERSION_FAST_INSTALL():
    JAVA_JDK_VERSION_FAST_INSTALLcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_jdk_fast_install.sh')
    return JAVA_JDK_VERSION_FAST_INSTALLcommand
JAVA_JDK_VERSION_FAST_INSTALL=Button(window, text='JDK FAST INSTALL', fg='green', bg='black', width=25, height=2, command=JAVA_JDK_VERSION_FAST_INSTALL)
JAVA_JDK_VERSION_FAST_INSTALL.grid(row=1, column=0)
buttonname = 'CHECK INSTALLED VERSIONS'
command = 'bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_java_installed_versions.sh'


def CHECK_INSTALLED_VERSIONS():
    CHECK_INSTALLED_VERSIONScommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_java_installed_versions.sh')
    return CHECK_INSTALLED_VERSIONScommand
CHECK_INSTALLED_VERSIONS=Button(window, text='SHOW JAVA INSTALLED VERSIONS', fg='blue', bg='black', width=25, height=2, command=CHECK_INSTALLED_VERSIONS)
CHECK_INSTALLED_VERSIONS.grid(row=2, column=0)


def CHECK_OR_SET_JAVA_HOME():
    CHECK_OR_SET_JAVA_HOMEcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/check_set_java_home_path.sh')
    return CHECK_OR_SET_JAVA_HOMEcommand
CHECK_OR_SET_JAVA_HOME=Button(window, text='SET THE JAVA HOME PATH', fg='yellow', bg='black', width=25, height=2, command=CHECK_OR_SET_JAVA_HOME)
CHECK_OR_SET_JAVA_HOME.grid(row=3, column=0)

def UPDATE_ALT_JAVA_FAST():
    UPDATE_ALT_JAVA_FASTcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/update_alt_java.sh')
    return UPDATE_ALT_JAVA_FASTcommand
UPDATE_ALT_JAVA_FAST=Button(window, text='SELECT JAVA VERSION', fg='pink', bg='black', width=25, height=2, command=UPDATE_ALT_JAVA_FAST)
UPDATE_ALT_JAVA_FAST.grid(row=4, column=0)


def REMOVE_EXISTING_JAVA_VERSION():
    REMOVE_EXISTING_JAVA_VERSIONcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/java_version_remove_java_jdk_openjdk.sh')
    return REMOVE_EXISTING_JAVA_VERSIONcommand
REMOVE_EXISTING_JAVA_VERSION=Button(window, text='REMOVE A JDK VERSION', fg='black', bg='red', width=25, height=2, command=REMOVE_EXISTING_JAVA_VERSION)
REMOVE_EXISTING_JAVA_VERSION.grid(row=0, column=1)


def SWITCH_JAVA_VERSION():
    SWITCH_JAVA_VERSIONcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/switch_java_jdk_openjdk_version.sh')
    return SWITCH_JAVA_VERSIONcommand
SWITCH_JAVA_VERSION=Button(window, text='SWITCH JAVA VERSION WIZARD', fg='orange', bg='black', width=25, height=2, command=SWITCH_JAVA_VERSION)
SWITCH_JAVA_VERSION.grid(row=1, column=1)

def DEFAULT_JAVA_VERSION():
    DEFAULT_JAVA_VERSIONcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/show_default_java.sh')
    return DEFAULT_JAVA_VERSIONcommand
DEFAULT_JAVA_VERSION=Button(window, text='SHOW DEFAULT JAVA VERSION', fg='white', bg='black', width=25, height=2, command=DEFAULT_JAVA_VERSION)
DEFAULT_JAVA_VERSION.grid(row=2, column=1)

def SHOW_JAVA_HOME():
    SHOW_JAVA_HOMEcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/show_java_home.sh')
    return SHOW_JAVA_HOMEcommand
SHOW_JAVA_HOME=Button(window, text='SHOW JAVA HOME PATH', fg='yellow', bg='black', width=25, height=2, command=SHOW_JAVA_HOME)
SHOW_JAVA_HOME.grid(row=3, column=1)

def UPDATE_ALT_JAVAC_FAST():
    UPDATE_ALT_JAVAC_FASTcommand=os.system('gnome-terminal -- bash /home/$USER/jdk_openjdk_java_javac_installation_v2/update_alt_javac.sh')
    return UPDATE_ALT_JAVAC_FASTcommand
UPDATE_ALT_JAVAC_FAST=Button(window, text='SELECT JAVAC VERSION', fg='pink', bg='black', width=25, height=2, command=UPDATE_ALT_JAVAC_FAST)
UPDATE_ALT_JAVAC_FAST.grid(row=4, column=1)

window.mainloop()


