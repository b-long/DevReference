
# GNU find reference

```shell
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
# find all of the PDF files, sort them (by full path name) & output to the screen and a log file
find . -type f -iname "*.pdf" | sort | tee all_PDFs.log

# Alternatively, locate which is based on a pre-built database
locate "hadoop"
```
