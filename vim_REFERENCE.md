# Vim reference

`The following is assumed to be done INSIDE the Vim editor`

##### Exit vim
```shell
:q
```
##### Turn on line numbers
```shell
:set number
```

##### Turn off line numbers
```shell
:set number!
```

 Go to line
```shell
:<line number> # Then hit enter/return
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
