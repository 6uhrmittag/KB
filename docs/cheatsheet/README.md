# Mail
````bash
echo "Subject: Mailfunktion TEST" | sendmail mail@mail.de
````
````bash
echo "Subject: Mailfunktion TEST" | sendmail root
````

# Mysql
## Show DBs
````bash
SHOW DATABASES;
````
## Rights
```bash
SHOW GRANTS FOR 'root'@'localhost';
```

## Loaded .conf
````bash
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

 `psql -d DATENBANKNAME --host=localhost -U USERNAME-W`

## With Useraccount

`sudo -u USERNAME psql`

## Use DB

`psql -d DATENBANKNAME`

## Information about Connection 

`\conninfo`

## Information about  User

`\du`

## All info

`\l`

## Logout

`\q`

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