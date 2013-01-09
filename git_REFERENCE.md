# Git reference 

##### Standard workflow commands
```shell
# To create a local branch (first checkout the branch to.. branch from)
git checkout -b <new branch name>

# To delete a local branch
git branch -d <local branch name>

# To push a local branch (so it's tracked on the server)
git push <remote> <new branch nam>  # i.e. git push origin mybranch

# To delete a remote branch (so it's no longer on the server)
git push <remote> :<branch to delete> # i.e. git push origin :mybranch

# To view information about your remote branches
git remote show origin 

# To add an entire directory:
git add /directory/to/stage/*

# To undo unstaged changes
git chekout -- <file to undo>

# To stash some changes with a description
git stash save "Description of changes"

# To list things saved in the stash
git stash list

# To apply the changes at the top of the stash (similar to pop)
git stash apply

# To apply a specific change set from the stash (i.e. index #2)
git stash apply stash@{1}

# When using `git fetch` , it's important to know you have to pull tags explicitly
git fetch -t

# See the history for a specific folder/path (using log2g alias and --name-status)
git log2g --all --name-status -- ./my-widget/*


```

##### Undo the last commit ([source](http://stackoverflow.com/a/927386/320399))
This should only be done for commits that have not been pushed to the remote.
```shell
$ git commit ...              (1)
$ git reset --soft HEAD^      (2)
# edit (or unstage) files     (3)
$ git add ....                (4)
$ git commit -c ORIG_HEAD     (5)

### 
### Explanation of the above steps
### 

### (1) This is what you want to undo

### (2) This is most often done when you remembered what you just committed is incomplete, 
### or you misspelled your commit message, or both. Leaves working tree as it was before "reset".

### (3) Make corrections to working tree files.

### (4) Stage changes for commit.

### "reset" copies the old head to .git/ORIG_HEAD; redo the commit by starting with its log message.
### If you do not need to edit the message further, you can give -C option instead.

```


More info available at <a href="http://gitready.com/">git ready</a>.  See it's repo 
on GitHub too: https://github.com/gitready/gitready 

<!-- Remember ```` needs to be at the end of shell segments, per GitHub Flavored 
Markdown ( http://github.github.com/github-flavored-markdown/ ) and real scripts 
should always end with a new line -->



