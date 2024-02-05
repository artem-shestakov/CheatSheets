## Access files

| File name | Description |
| ---- | ---- |
| _/etc/host.conf_ | Tells the network domain server how to look up hostnames. (Normally /etc/hosts, then name server; it can be changed through netconf.) |
| _/etc/hosts_ | Contains a list of known hosts (in the local network). Can be used if the IP of the system is not dynamically generated. For simple hostname resolution (to dotted notation), /etc/hosts.conf normally tells the resolver to look here before asking the network nameserver, DNS or NIS. |
| _/etc/hosts.allow_ | Man page same as hosts_access. Read by tcpd at least. |
| _/etc/hosts.deny_ | Man page same as hosts_access. Read by tcpd at least. |

## Booting and login/logout

| File name | Description |
| ---- | ---- |
| _/etc/issue & /etc/issue.net_ | These files are read by mingetty (and similar programs) to display a "welcome" string to the user connecting from a terminal (issue) or through a telnet session (issue.net). They include a few lines stating the Red Hat release number, name, and Kernel ID. They are used by rc.local. |
| _/etc/redhat-release_ | Includes one line stating the Red Hat release number and name. Used by rc.local. |
| _/etc/rc.d/rc_ | Normally run for all run levels with level passed as argument. For example, to boot your machine in the Graphics mode (X-Server), run the following command from your command line: `init 5`. The runlevel 5 is starts the system in graphics mode. |
| _/etc/rc.d/rc.local_ | Not official. May be called from rc, rc.sysinit, or /etc/inittab. |
| _/etc/rc.d/rc.sysinit_ | Normally the first script run for all run levels. |
| _/etc/rc.d/rc/rc **X**.d_ | Scripts run from rc (**X** stands for any number from 1 to 5). These directories are "run-level" specific directories. When a system starts up, it identifies the run-level to be initiated, and then it calls all the startup scripts present in the specific directory for that run-level. For example, the system usually starts up and the message "entering run-level 3" is shown after the boot messages; this means that all the init scripts in the directory /etc/rc.d/rc3.d/ will be called. |

## File system

| File name | Description |
| ---- | ---- |
| _/etc/mtab_ | This changes continuously as the file /proc/mount changes. In other words, when filesystems are mounted and unmounted, the change is immediately reflected in this file. |
| _/etc/fstab_ | Lists the filesystems currently "mountable" by the computer. This is important because when the computer boots, it runs the command `mount -a`, which takes care of mounting every file system marked with a "1" in the next-to-last column of fstab. |
| _/etc/mtools.conf_ | Configuration for all the operations (mkdir, copy, format, etc.) on a DOS-type filesystem. |

## System administration

| File name | Description |
| ---- | ---- |
| _/etc/group_ | Contains the valid group names and the users included in the specified groups. A single user can be present in more than one group if he performs multiple tasks. For example, is a "user" is the administrator as well as a member of the project group "project 1", then his entry in the group file will look like: `user: * : group-id : project1` |
| _/etc/nologin_ | If the file /etc/nologin exists, login(1) will allow access only to root. Other users will be shown the contents of this file and their logins refused. |
| _etc/passwd_ | See "man passwd". Holds some user account info including passwords (when not "shadowed"). |
| _/etc/rpmrc_ | rpm command configuration. All the rpm command line options can be set together in this file so that all of the options apply globally when any rpm command is run on that system. |
| _/etc/securetty_ | Contains the device names of tty lines (one per line, without leading /dev/) on which root is allowed to login. |
| _/etc/usertty /etc/shadow_ | Contains the encrypted password information for users' accounts and optionally the password aging information. Included fields are: _Login name_ Encrypted password _Days since Jan 1, 1970 that password was last changed_ Days before password may be changed _Days after which password must be changed_ Days before password is to expire that user is warned _Days after password expires that account is disabled_ Days since Jan 1, 1970 that account is disabled |
| _/etc/shells_ | Holds the list of possible "shells" available to the system. |
| _/etc/motd_ | Message Of The Day; used if an administrator wants to convey some message to all the users of a Linux server. |

## Networking

| File name | Description |
| ---- | ---- |
| _/etc/gated.conf_ | Configuration for gated. Used only by the gated daemon. |
| _/etc/gated.version_ | Contains the version number of the gated daemon. |
| _/etc/gateway_ | Optionally used by the routed daemon. |
| _/etc/networks_ | Lists names and addresses of networks accessible from the network to which the machine is connected. Used by route command. Allows use of name for network. |
| _/etc/protocols_ | Lists the currently available protocols. See the NAG (Network Administrators Guide) and man page. C interface is getprotoent. Should never change. |
| _/etc/resolv.conf_ | Tells the kernel which name server should be queried when a program asks to "resolve" an IP Address. |
| _/etc/rpc_ | Contains instructions/rules for RPC, which can be used in NFS calls, remote file system mounting, etc. |
| _/etc/exports_ | The file system to be exported (NFS) and permissions for it. |
| _/etc/services_ | Translates network service names to port number/protocol. Read by inetd, telnet, tcpdump, and some other programs. There are C access routines. |
| _/etc/inetd.conf_ | Config file for inetd. See the inetd man page. Holds an entry for each network service for which inetd must control daemons or other servicers. Note that services will be running, but comment them out in /etc/services so they will not be available even if running. Format: |
| _/etc/sendmail.cf_ | The Mail program sendmail's configuration file. Cryptic to understand. |
| _/etc/sysconfig/network_ | Indicates NETWORKING=yes or no. Read by rc.sysinit at least. |
| _/etc/sysconfig/network-scripts/if*_ | Red Hat network configuration scripts. |

## System commands

| File name | Description |
| ---- | ---- |
| _/etc/lilo.conf_ | Contains the system's default boot command line parameters and also the different images to boot with. You can see this list by pressing Tab at the LILO prompt. |
| _/etc/logrotate.conf_ | Maintains the log files present in the /var/log directory. |
| _/etc/identd.conf_ | Identd is a server that implements the TCP/IP proposed standard IDENT user identification protocol as specified in the RFC 1413 document. identd operates by looking up specific TCP/IP connections and returning the user name of the process owning the connection. It can optionally return other information instead of a user name. See the identd man page. |
| _/etc/ld.so.conf_ | Configuration for the Dynamic Linker. |
| _/etc/inittab_ | This is chronologically the first configuration file in UNIX. The first program launched after a UNIX machine is switched on is init, which knows what to launch, thanks to inittab. It is read by init at run level changes, and controls the startup of the main process. |
| _/etc/termcap_ | A database containing all of the possible terminal types and their capabilities. |

## Daemons

| File name | Description |
| ---- | ---- |
| _/etc/syslogd.conf_ | The configuration file for the syslogd daemon. syslogd is the daemon that takes care of logging (writing to disk) messages coming from other programs to the system. This service, in particular, is used by daemons that would not otherwise have any means of signaling the presence of possible problems or sending messages to users. |
| _/etc/httpd.conf_ | The configuration file for Apache, the Web server. This file is typically not in /etc. It may be in /usr/local/httpd/conf/ or /etc/httpd/conf/, but to make sure, you need to check the particular Apache installation. |
| _/etc/conf.modules or /etc/modules.conf_ | The configuration file for kerneld. Ironically, it is not the kernel "as a daemon". It is rather a daemon that takes care of loading additional kernel modules "on the fly" when needed. |

## The kernel

**Files in the /proc/sys/kernel/ directory**

|File name|Description|
|---|---|
|threads-max|The maximum number of tasks the kernel can run.|
|ctrl-alt-del|If 1, then pressing this key sequence cleanly reboots the system.|
|sysrq|If 1, then Alt-SysRq is active.|
|osrelease|Displays the release of the operating system.|
|ostype|Displays the type of the operating system.|
|hostname|The host name of the system.|
|domainname|Network domain of which the system is a part.|
|modprobe|Specifies whether modprobe should be automatically run at startup, and load the necessary modules.|

## User configuration files: . (dot) files and rc files

|**Filename**|**Description**|
|---|---|
|~/.bash_login|Look at "man bash". Treated by bash like ~/.bash_profile if that doesn't exist.|
|~/.bash_logout|Look at "man bash".Sourced by bash login shells at exit.|
|~/.bash_profile|Sourced by bash login shells after /etc/profile.|
|~/.bash_history|The list of commands executed previously.|
|~/.bashrcÂ|Look at "man bash". Sourced by bash non-login interactive shells (no other files are). Non-interactive shells source nothing unless BASH_ENV or ENV are set.|
|~/.emacs|Read by emacs at startup.|
|~/.forward|If this contains an e-mail address, then all mail to owner of ~ will be forwarded to that e-mail address.|
|~/.fvwmrc ~/.fvwm2rc|Config files for fvwm and fvwm2 (the basic X Window manager).|
|~/.hushlogin|Look at "man login". Causes a "quiet" login (no mail notice, last login info, or MOD).|
|~/.mail.rc|User init file for mail program.|
|~/.ncftp/|Directory for ncftp program; contains bookmarks, log, macros, preferences, trace. See man ncftp. The purpose of ncftp is to provide a powerful and flexible interface to the Internet standard File Transfer Protocol. It is intended to replace the stock ftp program that comes with the system.|
|~/.profile|Look at "man bash". Treated by bash like ~/.bash_profile if that and ~/.bash_login don't exist, and used by other Bourn-heritage shells too.|
|~/.pinerc|Pine configuration|
|~/.muttrc|Mutt configuration|
|~/.exrc|Configuration of vi can be controlled by this file. Example: set ai sm ruler Writing the above line in this file makes vi set the auto-indentation, matching brackets and displaying line number and rows-columns options.|
|~/.vimrc|Default "Vim" configuration file. Same as .exrc.|
|~/.gtkrc|GNOME Toolkit.|
|~/.kderc|KDE configuration.|
|~/.netrc|Default login names and passwords for ftp.|
|~/.rhosts|Used by the r-tools: rsh, rlogin, etc. Very weak security since host impersonation is easy. 1. Must be owned by user (owner of ~/) or superuser. 2. Lists hosts from which users may access this account. 3. Ignored if it is a symbolic link.|
|~/.rpmrc|See "man rpm". Read by rpm if /etc/rpmrc is not present.|
|~/.signature|Message text that will be appended automatically to the mail sent from this account.|
|~/.twmrc|Config file for twm (**T** he **W** indow **M** anager).|
|~/.xinitrc|Read by X at startup (not by xinit script). Mostly starts some progs. Example: exec /usr/sbin/startkde If the above line is present in this file, then the KDE Window Manager is started in when the startx command is issued from this account.|
|~/.xmodmaprc|This file is passed to the xmodmap program, and could be named anything (~/.Xmodmap and ~/.keymap.km, for example).|
|~/.xserverrc|Run by xinit as the X server if it can find X to execute.|
|~/News/Sent-Message-IDs|Default mail history file for gnus.|
|~/.Xauthority|Read and written by xdm program to handle authorization. See the X, xdm, and xauth man pages.|
|~/.Xdefaults, ~/.Xdefaults-hostname|Read by X applications during startup on hostname. If the -hostname file can't be found, .Xdefaults is looked for.|
|~/.Xmodmap|Points to _.xmodmaprc_; Red Hat had (has) .xinitrc using this name.|
|~/.Xresources|Usually the name for the file passed to xrdb to load the X resources database, to avoid the need for applications to read a long .Xdefaults file. (~/.Xres has been used by some.)|
|~/mbox|User's old mail.|

- [](http://www.facebook.com/sharer.php?u=https%3A%2F%2Fdeveloper.ibm.com%2Farticles%2Fl-config%2F&t=Understanding%20Linux%20configuration%20files "Share this on Facebook")

- [](https://twitter.com/intent/tweet?url=https%3A%2F%2Fdeveloper.ibm.com%2Farticles%2Fl-config%2F&text=Understanding%20Linux%20configuration%20files "Share this on Twitter")
- [](http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fdeveloper.ibm.com%2Farticles%2Fl-config%2F&title=Understanding%20Linux%20configuration%20files "Share this on LinkedIn")
Legend

- [
    
    Linux
    
    ](https://developer.ibm.com/technologies/linux)[
    
    IT Infrastructure
    
    ](https://developer.ibm.com/technologies/infrastructure)
    

Interested in generative AI?

[Learn generative AI skills](https://developer.ibm.com/generative-ai-for-developers?cm_sp=ibmdev--developer--GenAI)