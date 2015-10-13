# SVN reference

##### The easy way: working with SVN and avoiding a full checkout
```shell
# Get some info about a repository without actually checking out the entire baseline
svn log https://subversion.example.com/svn/foo/

# Sparse checkout
# A sparse checkout will allow you to pull down portions of a repository, allowing
# you to invoke "svn update" from the top of a hierarchy, without having to 
# worry about large files/extraneous components being pulled into your working copy.
# Here's an example: 
svn checkout --depth empty https://subversion.example.com/svn/foo/ foo
# Go into the foo directory and configure SVN to only pull the 
# directories that are direct children of 'foo'
cd foo
svn update --set-depth immediates
# Assuming these directories are created: 'bar', 'baz', 'buz'
# Configure SVN to always pull all of 'bar'
cd bar 
svn update --set-depth infinity
# Now from the top of our working copy 'foo', we'll always get the latest
# directories contained inside 'foo', as well as all of the latest 
# files in foo/bar and none of the changes to foo/baz or foo/buz

```

##### Working with Bioconductor packages
```
# Convenience variables
svn_remote=https://hedgehog.fhcrc.org/bioconductor/trunk/madman/Rpacks/BiocInstaller
svn_clone=BiocInstaller

# Get the latest revision of some sub-directory 
svn info "$svn_remote" |grep Revision

# Clone that revision to a subdirectory of the current folder
git svn clone -r 109574 "$svn_remote" "$svn_clone"

# cd to that folder
cd "$svn_clone"

# Something isn't right about this, so we need to remove some of the git-svn metadata
rm -r .git/svn

# Get the history of the directory (takes a while)
git svn rebase
```

<!-- TODO: Add sectioin on locking, 
e.g. 
# Since MS Office files do not play well with SVN
#
# To configure SVN such that modifying a file requires the "lock" :
svn propset svn:needs-lock '*' *

# To configure all MS Excel documents in the current directory require locking:
svn propset svn:needs-lock '*' *.xslx

# To determine which files in the current directory require
# the "lock" to perform edits: 
svn propget svn:needs-lock *

# To lock a file (for editing):
svn lock foo.docx
# To unlock the file (when finished):
svn unlock foo.docx

 -->

