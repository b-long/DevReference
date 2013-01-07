#!/bin/sh
#
# TODO: Explain shebang (preffered and difference with #!/bin/bash)
#
# Other thoughts:
# TODO: Insert Explanations & table of contents...
# 
# TODO: Consider extracting commands to their own file inside this project.  Then the project would serve as
# a supplement to man and info pages

###
### LESS
###
# Forward one page (Also known as "Page Down")
f
# Backward one page (Also known as "Page Up")
b
# Search
/
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
# Git workflows:
http://schacon.github.com/git/gitworkflows.html
# Find out what branch you're on
git branch <no arguments>
# Find out which tags have been created in a repository
git tag <no arguments>
# Find information about the(potentially gold copy) remote's origin.  This 
# will describe the URL used for fetching/pushing changes as well as which 
# local branches are linked to remote tracking branches.
git remote show origin
# To undo (and erase) changes to your local branch that have been commited, use
# the hashcode of the origin (or "real") HEAD (master/origin) commit to revert back to it.
git reset --hard <hash code> 
# As a shortcut you can accomplish this via the following (be sure to checkout the local master branch)
git reset --hard origin/master
# To see what's changed in your feature branch (assuming you carried over changes pulled into master)
git log --graph origin/<feature branch name>..HEAD


###
### Maven
###
# Install my service module, building and installing persistence and common code first
# cd to the top of the multi-module project 
mvn -pl group:project-commons,group:project-persistence,group:project-services install
# Or, a bit shorter version
mvn -pl group:project-persistence -am install
# The reverse (build & install persistence & everything that depends on it)
mvn -pl group:project-persistence -amd install
# A bit more fancy, build (and install) project-services and everything 
# it depends on, while outputting to standard out and a log file
mvn -pl group:project-services -am install 2>&1 | tee build.log

# Package this module and then scp the .war's to deploy on a jboss server
mvn package && scp $(find . -name "*.war") <user>@<host name>:/srv/jboss-6.0.0/server/default/deploy/
# Clean & rebuild everything, then run 1 integration test class
mvn -Dtest=MyTestIT verify
# Since the maven lifecycle now contains an "integration-test" phase, it'll run before verify.
# http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
# Alternatively you could use
mvn integration-test
# In some environments, you may have to run integration tests with this form:
mvn test -Dtest=**/*IT.java
# Run 1 unit test
mvn -Dtest=MyTest#someTestMethod test


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
# This works for RedHat, Fedora, Scientifi OS, ... 
cat /etc/*-release


###
### SSH Stuff
###
# For the following examples assume the current user is a@A and a remote connection b@B is available
# Setup passwordless ssh for user `a` (on host `A`) to server `B` using user account `b`
a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
# Setup an SSH tunnel for the current user to some host that server B can access.  With the
# following a user will be able to access `localhost:8888` and be tunnelled through 
# server B to <Some computer>:8080 .  A browser can now surf to `localhost:8888` 
ssh -L 8888:<IP address of some computer B can access>:8080 b@B


# Print the welcom/message of the day after you're already logged in
cat /etc/issue

###
### GNU find
### 
# To find/locate a file in a directory
find <directory> -iname "<case-insensitive filename>"
# To find all the .war files in your current directory
find ./ -name "*.war"
# To find all the .war files in your current directory (i.e. dev machine)
#   and then copy them to some server (i.e. qa) for testing
scp $(find . -name "*.war") user@qa-server:/srv/apache-tomcat-x.y.zz/webapps/
# For example, searching from the root of the filesystem:
find / -iname "hadoop"
# find all the Java WAR files and copy them (copy file identified by "{}") and print 
find . -iname "*.war" -exec cp {} $TOMCAT_HOME/webapps/ \; -print
# find all of the files (following symbolic links) owned by the root user
find -L -user root
# find all of the files owned by root and change them to be owned by the tomcat user
find -L -user root -exec chown tomcat:tomcat {} \;

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

# Enable ports in IP tables for Accumulo
iptables -I LOCAL-INPUT 10 -p tcp --dport 9999 -j ACCEPT
iptables -I LOCAL-INPUT 10 -p tcp --dport 9997 -j ACCEPT

# Save iptables
service iptables save

# Check if ZooKeeper is up
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
scp /cygdrive/c/<path-to-soruce>/myFile.txt <user>@<host>:/<destination path>/

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

###
### GREP! ( "Global Regular-Expression Print" )
###
# Bookmarks
#   http://www.catonmat.net/download/bash-redirections-cheat-sheet.pdf
#   http://gskinner.com/RegExr/
#   http://www.regular-expressions.info
# Find some <pattern> and print the 5 lines after (-A) it.
man grep | grep -A5 -- "-A"
grep -nIre <RegEx> <Path>
# Usage: 
# Pipe the output of looking for this pattern to grep and skip all the logs
grep -nIre 192\.168\. *|grep -v \.log
# Find some text in any file in a directory
grep <text to find> /path/to/directory/*
# Example searching for Exceptions in all log files
grep -i Exception /my-server/logs/*
# Search a specific directory, including all of it's subdirectories
# for all java and javascript files containing the pattern "url"
grep -nIrie url /my/server/webapps/ --include=\*.{java,js}
# Search the current directory (and sub-directories) for the same file/pattern
grep -nIrie url ./ --include=\*.{java,js}
# Search only subdirectories of the current directory for the same file/pattern
grep -nIrie url * --include=\*.{java,js}
# Search only the current directory for the same file/pattern
grep -nIie url . --include=\*.{java,js}


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

# Tar pipe a file from one place to another
tar -c ./myFile.txt | ssh <user>@<host>:/destination/ tar -x
# Can be used for entire directories as well
tar -C /path/to/parent/ -c <folder-to-copy> | ssh <user>@<host> tar -C /path/to/destination -x

### Netcat to see if some arbitrary port (22 here) is listening for connections on some host
nc -v -w 1 localhost -z 22

### Check if ssh is up
while (nc -v -w 1 localhost -z 22);
do
  echo "SSH is up"
  sleep 1
done

while (nc -v -w 1 localhost -z 22; test ! "$?" = "0");
do
  echo "SSH is down"
  sleep 1
done

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
