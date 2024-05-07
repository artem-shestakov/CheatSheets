# Basic commands
## Help
```shell
<command> --help

man <command>
# Example
man cat
man apropos

man <category> <command>
# Example
man 1 lp
man 4 lp

apropos <search text>
# Example
apropos print
    PA_CHAR (3const)     - define custom behavior for printf-like functions
    PA_DOUBLE (3const)   - define custom behavior for printf-like functions
    ...
    printenv (1)         - print all or part of environment
    printers.conf (5)    - printer configuration file for cups
    printf (1)           - format and print data
    printf (3)           - formatted output conversion
    ...

apropos -s 1,8 link

# Use mandb to create manual db
sudo mandb
```

## File manipulation
```shell
# Absolute path
/home/artem/Documents
/var/log/cron/log

# Relative path
./log
../home
artem/Documents/report.pdf

# Current directory
pwd

# Change directory
cd <path>
cd -
cd artem/Documents

# Create file
touch <filename>

# Create directory
mkdir <directory_path>

# Copy
cp [OPTION]... [-T] SOURCE DEST

# Move/Rename
mv [OPTION]... [-T] SOURCE DEST

# Delete file/directory
rm [OPTION]... [FILE]...
```