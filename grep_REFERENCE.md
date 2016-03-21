
# Grep reference
_Global Regular-Expression Print_

```shell
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
```