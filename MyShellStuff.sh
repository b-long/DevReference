#!/bin/bash

### Explanation of the first line
# TODO: insert explanation...

###
### BASH
###
# Change to the users's $home directory ('cd <blank>')
cd ; # Semicolon isn't needed, just hit return after a space

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
### GIT
###
# Commit all changes (modified files) with message <-m>
git commit -a -m "Updated <something> with <some changes>"
# Push updates to the server
git push
# Pull updates from the server
git pull
# Rename a file
git mv OldFileName.css NewFileName.css
# Don't forget to commit the changes...
git commit -a -m "Renamed OldFileName.css to NewFileName.css"

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

###
### SSH Stuff
###
#Setup passwordless ssh for server A to server B
a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

# To find/locate a file in a directory
find <directory> -iname "<case-insensitive filename>"
# To find all the .war files in your current directory
find ./ -name "*.war"
# To find all the .war files in your current directory (i.e. dev machine)
#   and then copy them to some server (i.e. qa) for testing
scp $(find . -name "*.war") user@qa-server:/srv/apache-tomcat-x.y.zz/webapps/
# For example, searching from the root of the filesystem:
find / -iname "hadoop"
# Alternatively, locate which is based on a pre-built database
locate "hadoop"  

# Post a message to all terminals logged on, possibly for service/application notifications
wall "Shutting down (some) application, web server, databse or service!"

# Locall netstat related to a specific port
netstat -antp |grep :22 

# netstat related to a certain IP address:
netstat -antp | grep 172.16.10.21

# Network settings for a given interface, i.e. "p2p1"
vi /etc/sysconfig/network-scripts/ifcfg-p7p1

# Check if ZooKeeper is ok
echo ruok | nc <host> <zookeeper-port>

# To secure copy (copy over ssh) use 'scp'
# Remember, the syntax is scp <from> <to>
scp /cygdrive/c/<somepath>/*.war root@<somehost>:/<somepath>/

# Perform multiple operations (i.e. moving things) after SSH'ing in
# This example is specific to Jenkins (using $SVN_REVISION)
ssh root@host.com "cd /root/myBuilds/; mkdir ${SVN_REVISION}; mv /root/myBuilds/temp/ /root/builds/${SVN_REVISION}/"

# To recursively copy an entire directory:
scp -r user@host:/path/directoryToCopy /cygdrive/c/windows-path/parentDestinationDirectory/

# Secure copy from a Cygwin path
scp /cygdrive/c/<path-to-soruce>/myFile.txt <user>@192.168.56.1:/<destination path>/

# Remember to check the permissions on the file afterward and maybe change them...
chmod 777 myFile.txt

# You can also change permissions a bit more verbosely
chmod u=rwx,g=r,o=r myApplication.jar


# Determine the size (disk usage) of a directory or file:
du /srv/apache-tomcat-7.0.22/ -h --max-depth=1 |sort -n -r

# To mount a VirtualBox shared folder, named "shared-linux", use the following:
mount -t vboxsf shared-linux /home/<user>/shared-linux

# To uninstall software (verbosely) with RPM.
# For example, to remove the MySQL client:
rpm -ev MySQL-client

# See the last 50 lines of the authorization log 
# From https://help.ubuntu.com/community/LinuxLogFiles
cat -n 50 /var/log/auth.log  

# Show the last 'n' lines (20 in this case) of <file>
tail -n 20 <file>  
# To follow the output
tail -f 

# Create (zip) a tar archive of a directory, recursively
# First cd to the parent directory of the target directory
# Example
# tar with gzip(-z), create an archive (-c), verbosely (-v) and give it a name (-f)
tar -zcvf myArchiveOfDirectory.gz myDirecotry/

# Unzip tar file
tar -xvf myFile.tar 
# Unzip gzip file
tar -xvfz myFile.tar.gz

###
### The power of GREP! ( "Global Regular-Expression Print" )
###
# Find some <pattern> and print the 5 lines after (-A) it.
man grep | grep -A5 -- "-A"
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


# Bookmarks
# Sun Java on Ubuntu
https://help.ubuntu.com/community/Java#Installing_Sun_Java_from_the_command_line
# Oracle on Ubuntu
https://help.ubuntu.com/community/Oracle
