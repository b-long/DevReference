# Vim reference

`The following is assumed to be done INSIDE the Vim editor`

##### Exit vim
```shell
:q
```


##### Moving around
```shell
# Move to end of line
$
# Move to first non-whitespace character
^
# Move to the beginning of the line 
0
# Go to line
:<line number> # Then hit enter/return
# Page down / scroll down (OSX)
CTRL + f
# Page up / scroll up (OSX)
CTRL + b
```

##### Line numbers
```shell
# Turn line numbers on
:set number
# Turn line numbers off
:set number!
```

##### Select all
```shell
#Press gg to go to the first line, then v for visual selection, and then shift+g to go to the end of file.
:ggvG
```

##### Copy (yank) text
```shell
# After selecting some text
y
```

##### Past text
```shell
# With something in the clipboard
<Escape> + p
```


<!-- Remember, ```` needs to be at the end of all the shell stuff -->
