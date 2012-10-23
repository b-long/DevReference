# Git reference 

```shell
# To create a local branch (first checkout the branch to.. branch from)
git checkout -b <new branch name>

# To delete a local branch
git branch -d <local branch name>

# To push a local branch (so it's tracked on the server)
git push <remote> <new branch nam>  # i.e. git push origin mybranch

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

More info available @ <a href="http://gitready.com/">git ready</a>.  See it's rep on GitHub too -> https://github.com/gitready/gitready
<!-- Remember, ```` needs to be at the end of all the shell stuff -->