REM In Subversion config, i.e. %APPDATA%\Subversion\config, -v is for verbose
ssh = C:/Program Files/putty/plink.exe -v -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

REM With an environment variable (used by some svn clients) the same can be accomplished
key:   SVN_SSH
value: "C:/Program Files/putty/plink.exe"  -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

REM       Subversion on the command line:
: The simplest update 'svn up' or 'svn update'
svn up

: Print the status of working copy files and directories.
svn status

: Print the status of working copy files and directories.
:   --show-updates (or -u) Causes the client to display information about which files in your working copy 
: are out of date.  This doesn't actually update any of your files—it just shows you which files will be 
: updated if you then use svn update.
:
svn status -u



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

REM To create an alias for Windows command processor, follow this guide:
http://superuser.com/questions/49170/create-an-alias-in-windows-xp#answer-115259