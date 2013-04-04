# RPM reference

The following is assumed to be done inside a terminal w/ rpm support

##### Random notes
```shell
# View contents of rpm
rpm -qlp <file name>.rpm

# Install rpm
rpm –ivh <file name>.rpm

# To uninstall software (verbosely) the RPM that was just installed.
rpm -ev <file name>  ### Note, the extension is not included in this case

# To uninstall other packages, for example the MySQL client:
rpm -ev MySQL-client

# Extract an RPM
rpm2cpio ${RPM} | cpio -idmv

# Extract a group of RPMs
for F in $(ls *.rpm); do rpm2cpio ${F}|cpio -idmv; done
```
<!-- Remember, ```` needs to be at the end of all the shell stuff -->
