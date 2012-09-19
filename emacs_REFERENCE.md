# Emacs reference

`The following is assumed to be done INSIDE the Emacs editor`

##### Exit emacs
```shell
`C-x C-c`
```

##### Find (search) & replace string
```shell
# Remember `M-x` is typically ALT + X key
M-x replace-string
# Hit return and you'll be prompted for a string to search: 
"queryStringFoo" 
# Hit return to search for _"queryStringFoo"_ 
`queryReplacementBar` 
# Hit return & all _"queryStringFoo"_ occurences are replaced by _"queryReplacementBar"_ 

```
<!-- Remember, ```` needs to be at the end of all the shell stuff -->