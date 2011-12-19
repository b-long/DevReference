REM In Subversion config, i.e. %APPDATA%\Subversion\config, -v is for verbose
ssh = C:/Program Files/putty/plink.exe -v -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

REM With an environment variable (used by some svn clients) the same can be accomplished
key:   SVN_SSH
value: "C:/Program Files/putty/plink.exe"  -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

: For development purposes, you may need to edit your 'hosts' file.
REM On Windows, it's location is C:\Windows\System32\drivers\etc\hosts
REM The file can only be modified by administrator, so Shift+Right-click 
REM and open an editor (Notepad++) as Administrator.  Then you can add
REM a named host, i.e. if "myhost" is at 192.168.56.7 
192.168.56.7 myhost

REM Pipe the ipconfig output through the 'more' pager
ipconfig | more

REM Pipe the netstat output to the "find string" (findstr) program, searching for port 445
netstat -ano | findstr :445

REM Trace the network route from a given machine to another
tracert google.com

REM Print the contents of a file
type myFile.txt