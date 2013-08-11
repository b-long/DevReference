# Git reference 

##### Standard workflow commands
<!-- 
TODO: Add notes on git's lack of an "inherent 'upstream' or 'downstream'", and how working w/
a distributed VCS is different than VCS/SCM systems like SVN / CVS.  Reference: http://stackoverflow.com/a/2749166/320399

-->
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

# Cleanup (remove) untracked files # via http://stackoverflow.com/a/64966/320399
git clean -f

# Merge in a feature branch for testing without committing / fast-forwarding
git merge <feature branch> --no-commit --no-ff

# To add (stage) an entire directory:
git add /directory/to/stage/*

# To undo unstaged changes
git chekout -- <file to undo>

# When using `git fetch` , it's important to know you have to pull tags explicitly
git fetch -t

# See the history for a specific folder/path (using log2g alias and --name-status)
git log2g --all --name-status -- ./my-widget/*

```

##### Stashing 
```shell

# To stash some changes with a description
git stash save "Description of changes"

# To stash changes including untracked files
git stash -k -u "Description of changes"

# To list things saved in the stash
git stash list

# To apply the changes at the top of the stash (similar to pop)
git stash apply

# To apply a specific change set from the stash (i.e. the second thing stashed)
git stash apply stash@{1}

# To reverse those changes
git stash show stash@{1} -p | git apply --reverse

# To clear out things that are stashed
git stash clear

```


##### Update/change last commit message
```shell
$ git rebase -i HEAD~1                                    (1)
# In the editor, select reword (r) on the last commit     (2)
# Save and exit the editor                                (3)
# Update the commit message in the new editor             (4)
# Save and exit the editor                                (5)
```

##### Undo the last commit ([source](http://stackoverflow.com/a/927386/320399))
This should only be done for commits that have not been pushed to the remote.
<!-- 
TODO: Create a section for undoing local commits and another describing
the use of 'git revert' for commits that have been pushed to a remote.
-->
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

##### Undo a mistake (i.e. a bad rebase).
```shell
### Say for example, you have the following repository and your feature is based on commit F:
#               A--B--C feature
#              /   
#     D---E---F---G master
### After a bad rebase your feature branch is now based on commit G:
#                   A'--B'--C' feature
#                  /
#     D---E---F---G master

### Before you do anything, make a tag for your current state
$ git tag PRE-UNDO-REBASE

#### You can find your earlier state in the reflog
$ git reflog
# The reflog will show you commit C and C' which will both have the same commit message.
# Your earlier state is simply the earlier point in the reflog with commit C.
# To restore it, simply reset to the earlier HEAD pointer (with the appropriate index):
$ git reset --hard HEAD@{5}

### After you verify your state is correct, delete the tag
$ git tag -d PRE-UNDO-REBASE

###  The same method can be used to restore from a bad reset
$ git reset --hard origin/master 
# Oh no!  Everything gone!
$ git reset --hard HEAD@{1}
# Now everything is back to normal :)
```

More info available at <a href="http://gitready.com/">git ready</a>.  See it's repo 
on GitHub too: https://github.com/gitready/gitready 

<!-- Remember ```` needs to be at the end of shell segments, per GitHub Flavored 
Markdown ( http://github.github.com/github-flavored-markdown/ ) and real scripts 
should always end with a new line -->


