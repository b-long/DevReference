It might be useful at times to simultaneiously view and capture the output of `STDOUT` and `STDERR`.  
You can do this by the following convention :
```shell
CMD 2>&1 | tee "captured_output.$(date +%F_%R).log"
```
This will create a timestamped file like : `captured_output.2015-11-19_11:33.log`.
