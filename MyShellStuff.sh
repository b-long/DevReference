### First and foremost some Git commands
###
### Commit all changes (modified files) with message <-m>
git commit -a -m "Updated <something> with <some changes>"
### Push updates to the server
git push
### Pull updates from the server
git pull
### Rename a file
git mv OldFileName.css NewFileName.css
### Don't forget to commit the changes...
git commit -a -m "Renamed OldFileName.css to NewFileName.css"


### Install something with apt:
sudo apt-get install <thing to install>
### Install something with yum:
sudo yum install <thing to install>

### To query the Linux Standard Base system (modern distros) for system info:
lsb_release -d / -a

### To shutdown the system immediately and halt (-h)
shutdown now -h

### To find/locate a file in a directory
find <directory> -iname "<case-insensitive filename>"
### To find all the .war files in your current directory
find ./ -name "*.war"
### For example, searching from the root of the filesystem:
find / -iname "hadoop"
### Alternatively, locate which is based on a pre-built database
locate "hadoop"  

### Post a message to all terminals logged on, possibly for service/application notifications
wall "Shutting down (some) application, web server, databse or service!"

### Locall netstat related to a specific port
netstat -antp |grep :22 

### netstat related to a certain IP address:
netstat -antp | grep 172.16.10.21

### Network settings for a given interface, i.e. "p2p1"
vi /etc/sysconfig/network-scripts/ifcfg-p7p1

### Check if ZooKeeper is ok
echo ruok | nc <host> <zookeeper-port>

### To secure copy (copy over ssh) use 'scp'
### Remember, the syntax is scp <from> <to>
scp /cygdrive/c/<somepath>/*.war root@<somehost>:/<somepath>/

### To secure copy a file, from Windows host (in Cygwin) to Linux VM
### Given the following: Ethernet adapter VirtualBox Host-Only Network:
### 
###    Connection-specific DNS Suffix  . :
### Link-local IPv6 Address . . . . . : fe80::f965:2c4b:370f:ec25%36
### IPv4 Address. . . . . . . . . . . : 192.168.56.1
### Subnet Mask . . . . . . . . . . . : 255.255.255.0
### Default Gateway . . . . . . . . . :
###
scp /cygdrive/c/<path-to-soruce>/myFile.txt <user>@192.168.56.1:/<destination path>/

### Remember to check the permissions on the file afterward and maybe change them...
chmod 777 myFile.txt

### You can also change permissions a bit more verbosely
chmod u=rwx,g=r,o=r myApplication.jar

### To recursively copy an entire directory:
scp -r user@host:/path/directoryToCopy /cygdrive/c/windows-path/parentDestinationDirectory/

### Determine the size (disk usage) of a directory or file:
du /srv/apache-tomcat-7.0.22/ -h --max-depth=1 |sort -n -r


### To mount a VirtualBox shared folder, named "shared-linux", use the following:
mount -t vboxsf shared-linux /home/<user>/shared-linux

### To uninstall software (verbosely) with RPM.
### For example, to remove the MySQL client:
rpm -ev MySQL-client

### See the last 50 lines of the authorization log 
### From https://help.ubuntu.com/community/LinuxLogFiles
cat -n 50 /var/log/auth.log  

### Show the last 'n' lines (20 in this case) of <file>
tail -n 20 <file>  
### To follow the output
tail -f 

### Create (zip) a tar archive of a directory, recursively
### First cd to the parent directory of the target directory
### Example
### tar with gzip(-z), create an archive (-c), verbosely (-v) and give it a name (-f)
tar -zcvf myArchiveOfDirectory.gz myDirecotry/

### Unzip tar file
tar -xvf myFile.tar 
### Unzip gzip file
tar -xvfz myFile.tar.gz

### Get process information (i.e. for Apache Tomcat)
ps -ef |grep tomcat ### For this example, tomcat's PID is 13763
### Get everyone's (-e) long (-l), full (-f), wide, 
### wide (-w) information on Tomcat (i.e. PID 13763
ps -elfww | grep 13763 
### You can actually 'cd' to that process...
cd /proc/13763
### Which has some information in it...
ls
### Including environment stuff...
cat environ

### In a bourne shell (bash) you can set environment variables like this
JAVA_HOME=/usr/java/jdk1.6.0_26/
export JAVA_HOME
### Then double-check that it got set properly
printenv | grep java


### Bookmarks
### Sun Java on Ubuntu
https://help.ubuntu.com/community/Java#Installing_Sun_Java_from_the_command_line
### Oracle on Ubuntu
https://help.ubuntu.com/community/Oracle
