# Git reference

##### Standard workflow commands
<!--
TODO: Add notes on git's lack of an "inherent 'upstream' or 'downstream'", and how working w/
a distributed VCS is different than VCS/SCM systems like SVN / CVS.  Reference: http://stackoverflow.com/a/2749166/320399

-->
```shell
# To start, clone a repository (you only need to do this once)
git clone <some git URL> 
# An example
git clone https://github.com/b-long/DevReference.git

# Next, navigate into the repository
cd DevReference

# Next, access the branch you want to work with
git checkout master

# You can identify the branch you're on, just to double-check
git branch

# If you're starting new work, create a new branch.
# Note, you are "branching off of" the current selection
git checkout -b <new branch name>

# To delete a local branch
git branch -d <local branch name>

# To push a local branch (so it's tracked on the server)
git push <remote> <new branch nam>  # i.e. git push origin mybranch

# To delete a remote branch (so it's no longer on the server)
git push <remote> :<branch to delete> # i.e. git push origin :mybranch

# To view information about your remote branches
git remote show origin

# To prepare code that you want to commit, you have to tell 
# git to "stage" the files.  You can stage files individually
# or by directory.
#
# To stage a single file: 
git add some-file.txt

# To stage (add) an entire directory:
git add /directory/to/stage/*

# To un-stage some file
git chekout -- <path-to-file>

# Once files are added, you can commit them
git commit -m "My awesome code"

# Finally, push these changes to your server
# Be it GitHub.com, GitLab.com BitBucket.org, or a private server
#
# Note <new branch name> is created above
git push origin <new branch name>
```

##### Other git features
```shell
# When using `git fetch` , it's important to know you have to ask for tags explicitly
git fetch -t

# See the history for a specific folder/path (using log2g alias and --name-status)
git log2g --all --name-status -- ./my-widget/*

# Cleanup (remove) untracked files # via http://stackoverflow.com/a/64966/320399
git clean -f

# Merge in a feature branch for testing without committing / fast-forwarding
git merge <feature branch> --no-commit --no-ff
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


##### Scratch notes
```

# Commit all changes (modified files) with message <-m>
git commit -a -m "Updated <something> with <some changes>"
# Push updates to the server
git push
# Pull updates from the server
git pull
# Rename a file
git mv OldFileName.css NewFileName.css
# Don't forget to commit the changes...
git commit -a -m "Renamed OldFileName.css to NewFileName.css"
# Git workflows:
http://schacon.github.com/git/gitworkflows.html
# Find out what branch you're on
git branch <no arguments>
# Find out which tags have been created in a repository
git tag <no arguments>
# Find information about the(potentially gold copy) remote's origin.  This
# will describe the URL used for fetching/pushing changes as well as which
# local branches are linked to remote tracking branches.
git remote show origin
# To undo (and erase) changes to your local branch that have been commited, use
# the hashcode of the origin (or "real") HEAD (master/origin) commit to revert back to it.
git reset --hard <hash code>
# As a shortcut you can accomplish this via the following (be sure to checkout the local master branch)
git reset --hard origin/master
# To see what's changed in your feature branch (assuming you carried over changes pulled into master)
git log --graph origin/<feature branch name>..HEAD

```
