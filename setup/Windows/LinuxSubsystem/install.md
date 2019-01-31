## system
````bash
sudo apt install aptitude
sudo apt install ruby
sudo apt-get install ruby-dev
sudo apt-get install ruby2.5-dev
sudo apt-get install g++
````

## unattended-upgrades
sudo apt install unattended-upgrades
vi /etc/apt/apt.conf.d/50unattended-upgrades

uncomment:
````text
        "${distro_id}:${distro_codename}-updates";
````
## Puppet bolt
https://puppet.com/docs/bolt/1.x/bolt_installing.html
````bash
wget https://apt.puppet.com/puppet6-release-bionic.deb
sudo dpkg -i puppet6-release-bionic.deb
sudo apt-get update 
sudo apt-get install puppet-bolt
````
## Python Stuff
````bash
sudo apt install python3
sudo apt install python
sudo apt-get install python3-setuptools
sudo apt-get install python3-pip
sudo python3 -m pip install setuptools
sudo apt install tox
````

## dev stuff
````bash
sudo apt install make
sudo apt install nodejs
sudo gem install travis
````

