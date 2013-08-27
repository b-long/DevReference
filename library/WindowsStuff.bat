
:: Open the current directory in Windows Explorer (Cygwin or Windows Command Processor)
explorer .

:: In Subversion config, i.e. %APPDATA%\Subversion\config, -v is for verbose
ssh = C:/Program Files/putty/plink.exe -v -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

:: With an environment variable (used by some svn clients) the same can be accomplished
key:   SVN_SSH
value: "C:/Program Files/putty/plink.exe"  -i C:/cygwin/home/<username>/.ssh/putty.ppk -l <username>

:: Subversion on the command line (via http://svnbook.red-bean.com/en/1.6/svn-book.html )
:: The simplest update 'svn up' or 'svn update'
svn up

:: Print the status of working copy files and directories.
svn status

:: Print the status of working copy files and directories.
::   --show-updates (or -u) Causes the client to display information about which files in your working copy 
:: are out of date.  This doesn't actually update any of your files—it just shows you which files will be 
:: updated if you then use svn update.
::
svn status -u

:: I think this is right...   Update (as revert, -r) to some specified revision
svn update -r HEAD
svn update -r 1190

:: remove unversioned files 
http://stackoverflow.com/questions/2803823/how-can-i-delete-all-unversioned-ignored-files-folders-in-my-working-copy


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

REM There are a few different ways to create "aliases" for the Windows command processor.  
REM Currently, I'm using this method:
http://superuser.com/a/115259/102047
REM This option also looks pretty good:
http://superuser.com/a/49194/102047

REM ** Case usually doesn't matter **
REM   Batch commands are usually NOT case sensitive.  Therefore, `exit /b 0` and 'exit /B 0'
REM       are equally valid.
REM
REM   To exit a batch script (but remain in the command proccessor): 
exit /b 0

:: Unix utilities (i.e. tee.exe) are provided in: http://sourceforge.net/projects/unxutils/