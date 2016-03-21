# RPM reference

The following is assumed to be done on a host that supports RPM

```shell
# View RPM file contents
rpm -qlp <file name>.rpm

# View RPM package information
cat <file name>.rpm | rpm -qip -

# Install RPM
rpm –ivh <file name>.rpm

# Find out what depends on a package
rpm --test -e <package name>

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
