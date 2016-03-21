#!/bin/sh
#
# TODO: Explain shebang (preffered and difference with #!/bin/bash)
#
# Other thoughts:
# TODO: Insert Explanations & table of contents...
#
# TODO: Consider extracting commands to their own file inside this project.  Then the project would serve as
# a supplement to man and info pages
#
# TODO: Add something about using 'xsltproc' and the fact that this REFERENCE is meant to
# be generally applicapble to most *nix variants.
# Example usage: xsltproc stylesheet.xsl document.xml # Output is the transformed document
#

###
### LESS
###
# Forward one page (Also known as "Page Down")
f
# Backward one page (Also known as "Page Up")
b
# Go to the top of the buffer
gg
# Go to the end of the buffer
G
# Search (Reg Ex)
/
# Make searching case-insensitive
-i
# Execute some command
!<command> #For example !date
# Help (when viewing something in less, i.e. man pages)
h
# Additional info
man less

###
### INFO (Supplements "man" pages)
###
# Normal usage
info <some command>
# Info is displayed in an Emacs window, and uses Emacs navigation
# To quit
Ctrl + x , Ctrl + c
# For more ... info...
info info


###
### BASH
###
# Change to the users's $home directory ('cd <space>')
cd ; # Semicolon isn't needed, just hit return after a space
# Do something, output to standard out and pipe to a file
find . -iname "*.pdf" 2>&1 | tee location_of_pdfs.txt


# The .bash_profile (in the home directory) can
# be used for aliasing.  Edit it with vim:
vim ~/.bash_profile # where .filename indicates hidden file
# Add useful aliases, like:
alias lpn='cd ~/mylongpathname/subdirectory/subdirectory/'
# Now that 'cd' can be invoked with just 'lpn'
# If you want to use the updated ~/.bash_profile immediately
# From the home directory, run:
source .bash_profile



###
### OS INFORMATION
###
#To query the Linux Standard Base system (modern distros) for system info:
lsb_release -d / -a

## Software / package management
# Install something with apt:
sudo apt-get install <thing to install>
# Install something with yum:
sudo yum install <thing to install>

# To shutdown the system immediately and halt (-h)
shutdown now -h
# To shutdown the system in 3 hours and halt
shutdown 03:00 -h
# To reboot
reboot
# Determine which version (distribution) of Linux you're using
# This works for Ubuntu, RedHat, Fedora, Scientific Linux, CentOS, ...
cat /etc/*-release


# Print the welcom/message of the day after you're already logged in
cat /etc/issue


# Post a message to all terminals logged on, possibly for service/application notifications
wall "Shutting down (some) application, web server, databse or service!"

# Locall netstat related to a specific port
netstat -antp |grep :22

# netstat related to a certain IP address:
netstat -antp | grep 172.16.10.21

# Network settings for a given interface, i.e. "p2p1"
vi /etc/sysconfig/network-scripts/ifcfg-p7p1

# Enable ports in IP tables for Accumulo
iptables -I LOCAL-INPUT 10 -p tcp --dport 9999 -j ACCEPT
iptables -I LOCAL-INPUT 10 -p tcp --dport 9997 -j ACCEPT

# Save iptables
service iptables save

# Check if ZooKeeper is up
echo ruok | nc <host> <zookeeper-port>

# Remember to check the permissions on the file afterward and maybe change them...
chmod 777 myFile.txt

# You can also change permissions a bit more verbosely
chmod u=rwx,g=r,o=r myApplication.jar

# Change permissions on an entire directory
chmod -R 755 /path/to/directory

###
### `du' (Disk Usage)
###
# Determine the size (disk usage) of a directory or file:
du /srv/apache-tomcat-7.0.22/ -h --max-depth=1 |sort -n -r
# Determine the size of each directory within a directory
cd /path/to/parent/directory && du -sh *

# To mount a VirtualBox shared folder, named "shared-linux", use the following:
mkdir /home/<user>/shared-linux # Be sure to have the mount point made
mount -t vboxsf shared-linux /home/<user>/shared-linux

###
### RPM stuff
###
# View contents of rpm
rpm -qlp file.rpm
# Install rpm
rpm –ivh <file name>.rpm
# To uninstall software (verbosely) the RPM that was just installed.
rpm -ev <file name>  ### Note, the extension is not included in this case
# To uninstall other packages, for example the MySQL client:
rpm -ev MySQL-client

# See the last 50 lines of the authorization log
# From https://help.ubuntu.com/community/LinuxLogFiles
cat -n 50 /var/log/auth.log

# Show the last 'n' lines (37 in this case) of <file>
tail -n 37 <file name>
# To follow the output
tail -f <file name>

# Create (zip) a tar archive of a directory, recursively.  First cd to the parent
# directory of the target directory.  My standard usage:
# Create an archive (-c), verbosely (-v), using gzip (-z) and give it a name (-f)
tar -cvzf <theArchive>.tar.gz <theFolderToArchive>
# So, for example
tar -cvzf myArchiveOfDirectory.gz myDirecotry/


# Unzip tar file
tar -xvf myFile.tar
# Unzip gzip file
tar -xvzf myFile.tar.gz


# Grep processes and look for some term in the full command line
# pgrep -fl <term>
# i.e.
pgrep -fl apache

# Get process information (i.e. for Apache Tomcat)
ps -ef |grep tomcat ### For this example, tomcat's PID is 13763
# Get everyone's (-e) long (-l), full (-f), wide,
# wide (-w) information on Tomcat (i.e. PID 13763
ps -elfww | grep 13763
# You can actually 'cd' to that process...
cd /proc/13763
# Which has some information in it...
ls
# Including environment stuff...
cat environ

# In a bourne again shell (bash) you can set environment variables like this
JAVA_HOME=/usr/java/jdk1.6.0_26/
export JAVA_HOME
# Then double-check that it got set properly
printenv | grep java


# New stuff!
echo $(cygpath -w /cygdrive/c) # Some windows command, also cygpath to convert to a Windows path
echo `cygpath -w /cygdrive/c` # Same as above, but with tick marks
dir "$(cygpath -w /cygdrive/c/Program\ Files\ \(x86\)/)" # Same as above, but looking at Program Files

### Top starts the program.
### Afterwards:
### Shift + o   --> (order by)
### n           --> (Memory usage)
top


### Random history
ps aux |grep jboss
watch -n 1 ps aux \|grep jboss
man signal
man kill
kill -s SIGHUP 29223
\rm -rf log*/* work/* tmp/* # Cleanup JBoss

###
### Bookmarks
###
# Sun Java on Ubuntu
https://help.ubuntu.com/community/Java#Installing_Sun_Java_from_the_command_line
# Oracle on Ubuntu
https://help.ubuntu.com/community/Oracle
# Advanced bash scripting guide:
http://tldp.org/LDP/abs/html/
# Learning the shell
http://linuxcommand.org/learning_the_shell.php
