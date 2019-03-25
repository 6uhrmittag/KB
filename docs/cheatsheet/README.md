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