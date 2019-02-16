# bmx-spammerbreaker
A bash script that adds and removes IPs from the "Blacklisted SMTP IP addresses" list on cPanel and handles Exim restarts.

## Installing

To install cd to the same folder as spammerbreaker.sh and run:

```
sudo chmod 555 spammerbreaker.sh && sudo chown root:root spammerbreaker.sh && sudo mv spammerbreaker.sh /usr/local/bin/ 
```

You can add the following aliases to your .bash_aliases, .profile or .bash_profile file, modify the script location:

```
alias sb="/usr/local/bin/spammerbreaker.sh"
alias sbrm="/usr/local/bin/spammerbreaker.sh rm"
alias sbadd="/usr/local/bin/spammerbreaker.sh add"
alias sbres="/usr/local/bin/spammerbreaker.sh restart"
```

Feel free to make changes as you need.


#Usage

After installing and adding the aliases, you can run it like this:

```
sb add 123.123.123.123
```
This will add the IP to your exim's spammeripblocks list. 

```
sb rm 123.123.123.123
```
This will remove all the copies of the IP in your exim's spammeripblocks list. 

```
sb restart
```
This will restart exim using the cPanel binary file.

**Always restart Exim after adding or removing IPs**

You can also use these shortcuts:

```
sbadd 123.123.123.123 #to add IP
sbrm 123.123.123.123 #to remove IP
sbres 123.123.123.123 #to restart Exim
```
