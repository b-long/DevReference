# Oracle reference 

### Backing up an Oracle instance (from a UNIX, Linux or POSIX machine)

In the terminal
```shell
# Prepare a place to create backups (optional)
# Become the oracle user and change directories
su - oracle
cd ~

# Make a directory to hold the dump file (named with schema, count of records or other info)
mkdir myexport_1000rows

# Connect as SYSDBA
sqlplus / as sysdba
```
In sqlplus
```shell
SQL> create directory myexport_1000rows as '/home/oracle/myexport_1000rows/';
SQL> exit;
```

In the terminal
```shell
expdp db_admin_user DIRECTORY=myexport_1000rows DUMPFILE=myexport_1000rows.dmp SCHEMAS=db_admin_user

###
### Sample output
###
Connected to: Oracle Database ...
Starting "DB_ADMIN_USER"."SYS_EXPORT_SCHEMA_01":  db_admin_user/******** DIRECTORY=myexport_1000rows DUMPFILE=db_admin_user_101964.dmp SCHEMAS=db_admin_user
Estimate in progress using BLOCKS method...
Processing object type SCHEMA_EXPORT/TABLE/TABLE_DATA
Total estimation using BLOCKS method: 690.0 MB
Processing object type SCHEMA_EXPORT/...

Master table "DB_ADMIN_USER"."SYS_EXPORT_SCHEMA_01" successfully loaded/unloaded
******************************************************************************
Dump file set for DB_ADMIN_USER.SYS_EXPORT_SCHEMA_01 is:
  /home/oracle/myexport_1000rows/db_admin_user_101964.dmp
. . exported "DB_ADMIN_USER"."FOO"            71.90 MB   87420 rows
...
... # Clippped for brevi
...
Master table "DB_ADMIN_USER"."SYS_EXPORT_SCHEMA_01" successfully loaded/unloaded
******************************************************************************
Dump file set for DB_ADMIN_USER.SYS_EXPORT_SCHEMA_01 is:
  /home/oracle/myexport_1000rows/db_admin_user_101964.dmp
Job "DB_ADMIN_USER"."SYS_EXPORT_SCHEMA_01" completed ...


# Afterward, you'll probably want to archive with tar:
cd ..
tar -cvzf myexport_1000rows.tar.gz myexport_1000rows




```
<!-- Remember, ```` needs to be at the end of all the shell stuff -->
