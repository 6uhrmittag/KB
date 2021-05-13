# Usefull commands

# Test Mail
## An E-Mail Adresse

````bash
echo "Subject: Mailfunktion TEST" | sendmail mail@mail.de
````
## An Useraccount

!> Mails an root sollten immer irgendwo ankommen

````bash
echo "Subject: Mailfunktion TEST" | sendmail root
````

# Shell
## Autoformat as table
````bash
echo "one two"| column -t -s' '
````

# Mysql
## Show DBs
````mysql
SHOW DATABASES;
````
## Show Rights
```mysql
SHOW GRANTS FOR 'root'@'localhost';
```

## Show Loaded .conf
````mysql
SHOW VARIABLES LIKE '%max_connect_errors%';
````
## create dump
````bash
mysqldump -u USERNAME -p --databases DATENBANK > DATEINAME.sql
````

## dump import
````bash
mysql -u USERNAME -p --databases DATENBANK < DATEINAME.sql
````

# Postgress  

## Without Useraccount

 ````bash
psql -d DATENBANKNAME --host=localhost -U USERNAME -W
````

## With Useraccount

 ````bash
su - USERNAME
psql
````

## Use DB

 ````bash
psql -d DATENBANKNAME
````

## Information about Connection 

 ````postgresql
\conninfo
````

## Information about User

 ````postgresql
\du
````

## All info

 ````postgresql
\l
````

## Logout

 ````postgresql
\q
````

# SVN
````bash
svn add FILE
````
````bash
svn svn delete FILE
````
````bash
svn commit FILE -m "MESSAGE"
````

# virsh
## DHCP IPs
````bash
sudo virsh net-dhcp-leases default
````

# Ubuntu/Debian

## Change the keyboad map to DE

````bash
loadkeys de
````



# RedHat
## Software collection (RHSCL) 
?> RHSCL allows usage of latest versions and parallel installation of tools.

?> Tools from RHSCL have the prefix **rh-**

?> Tools from RHSCL are installed at `/opt/rh`

?> Tools from RHSCL are not in the PATH by default

### Intro

- Practical intro:
    - https://www.covermymeds.com/main/insights/articles/red-hat-software-collections/
- RedHat overview:
    - https://developers.redhat.com/products/softwarecollections/overview/
- Tutorial:
    - https://developers.redhat.com/products/softwarecollections/hello-world/#fndtn-windows

| Source | support life cycle | 
| ---------- |------------|
| Red Hat Enterprise Linux| up to 10 years           |
| RHSCL         | 2-3 years           |



### Available Software
See: https://access.redhat.com/support/policy/updates/rhscl

### Usage
See: https://access.redhat.com/documentation/en-us/red_hat_software_collections/3/html/3.2_release_notes/chap-usage

#### Put in PATH
````bash
scl enable software_collection... bash
````
####  put RHSCL in PATH permanently
````bash
vim ~/.bashrc
source scl_source enable rh-php72
````
#### Start Service
````bash
service software_collection-service_name start
````
#### Enable Autostart
````bash
chkconfig software_collection-service_name on
````

# Windows

## List of Commands

- https://ss64.com/nt/
