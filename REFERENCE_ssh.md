
# ssh reference
_Secure Shell_

### Automating Authentication

If you already have an RSA public/private key pair.  You can automate the authentication process by adding
a local user's RSA public key to remote (server) user's `authorized_keys` file:
```shell

# For the following examples assume the current user is a@A and a remote connection b@B is available
# Setup passwordless ssh for user `a` (on host `A`) to server `B` using user account `b`
a@A:~> cat ~/.ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
```

### Copying files over `ssh`
This is known as `scp` or _secure copy_ :
```
# The usage syntax is scp <from> <to>
scp something.txt user@<somehost>:/<somepath>/

# The scp tool is also available in Cygwin:
scp /cygdrive/c/<somepath>/*.war user@<somehost>:/<somepath>/

# Perform multiple operations (i.e. moving things) after SSH'ing in
# This example is specific to Jenkins (using $SVN_REVISION)
ssh root@host.com "cd /root/myBuilds/; mkdir ${SVN_REVISION}; mv /root/myBuilds/temp/ /root/builds/${SVN_REVISION}/"

# To recursively copy an entire directory:
scp -r user@host:/path/directoryToCopy /cygdrive/c/windows-path/parentDestinationDirectory/
```

### Tunneling Traffic
```
# Setup an SSH tunnel for the current user to some remote machine `C` that
# cannot be accessed directly from the current machine (`A`).  This allows
# us to tunnel a connection from A to C, where C is a server B can access.  
# This method can be used to access resources on any of the ports listening
# on `C`, by mapping an available local port to it.  The flag "-L" can be used
# multiple times to map such ports and the sytnax allows us to reference C
# by an IP address or hostname known to B.  In the example below we map
# ports 50001 and 50002 locally to port 22 and 80 respectively, allowing us
# to access C:80 (HTTP) and C:22 (SSH) which we couldn't normally access from A.  
# The local machine will be able to browse to "http://localhost:50001" and open
# an ssh connection to C by executing the command "ssh localhost -p 50002" .
ssh -L 50001:<host name of C>:80 -L 50002:<IP address of C>:22  b@B
```

### Other examples
```
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

```
