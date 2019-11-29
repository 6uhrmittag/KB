# never ending list of important things for servers in production

OS: Ubuntu

# System
## set hostname
- [ ] `/etc/hostname`
- [ ] `/etc/hosts`

## Updates
### automatic updates
- [ ] `apt install unattended_upgrades` is installed
    - [ ] `vim /etc/apt/apt.conf.d/20auto-upgrades`
        - [ ] is enabled
    - [ ] `vim /etc/apt/apt.conf.d/50unattended-upgrades`
        - [ ] autoremove active
        - [ ] e-mail set
    - [ ] upgrade time scheduled ([configure systemd timer](https://wiki.debian.org/UnattendedUpgrades))

# SSH

- [ ] x

# Systemd Services

- [ ] all needed services should be enabled

# Mail
## Local receivers
## postfix
- [ ] remove duplicate logging to syslog via [howTo](https://serverfault.com/questions/264965/rsyslog-conf-disable-mail-info-and-or-disable-postfix-reporting)
## DEKIM
## SPF
# Logs
## Systemd Journal
- [ ] [limit file size](https://wiki.manjaro.org/index.php?title=Limit_the_size_of_.log_files_%26_the_journal)
## log rotation
- [ ] add custom log roation for apps that don't log to usual paths
- [ ] add custom log rotation for custom scripts that log (backup-scripts etc.)
## log paths
- [ ] check for apps that don't log to `/var/log`
    - [ ] solr
    - [ ] tomcat
- [ ] use separate logs for different vHosts when using webservers
    - [ ] nginx
    - [ ] apache
## log level
- [ ] remove deep log level
    - [ ] apache: `debug` and `trace` in vHost config
    - [ ] nginx: `debug` in vHost config

# Webserver

## Apache
## Nginx
- [ ] use nginx repo instead of os repo vor latest version
- [ ] check if `nginx-full` is needed

# PHP

### Apache mod PHP
### PHP-FPM
# firewall
## ufw
- [ ] enable
- [ ] default deny
- [ ] allow needed ports/protos
- [ ] remove duplicate logs to syslog
    - [ ] `vim /etc/rsyslog.d/20-ufw.conf`
    - [ ] `service rsyslog restart`
## sshguard
- [ ] `aptt install sshguard`
- [ ] whitelist your own IP, if static
# monitoring
# backup
- [ ] verify that the backup is working
- [ ] verify that recovery using backup works
# misc
# security
# testing
- [ ] make sure that only needed apps are listening on public ports `netstat -tulpen`
- [ ] make sure that only needed apps are bind on public interfaces `netstat -tulpen`
# before going live
- [ ] enable backup if disabled while setup
- [ ] remove BasicAuth/protection from webserver
- [ ] enable monitoring
- [ ] check `/var/mail/` for mails from failed cronjobs etc.
- [ ] reboot and make sure everything still works fine
