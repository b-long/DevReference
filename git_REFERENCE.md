# Git reference 

```shell
# To delete a local branch
git branch -d <local branch name>

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



```
<!-- Remember, ```` needs to be at the end of all the shell stuff -->