# rsync reference 

### Backing up using rsync

My normal usage: 
```shell
# Remember the `-c` option will calculate checksums for all files and is not usually needed.
rsync -r -t -v --progress --ignore-existing --partial -i -s /tiny-storage/rsync-source /big-storage/rsync-destination
```
<!-- Remember ```` needs to be at the end of shell segments 
and real scripts should always end with a new line -->

