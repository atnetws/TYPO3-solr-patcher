# TYPO3-solr-patcher (log4shell CVE-2021-44228)
Small shell script that patches Apache solr versions needed for EXT:solr 


I used this script to patch our Solr Servers that we use for our TYPO3 based web sites.  
It patches the startup script solr.in.sh, backups the previous lib4j files, downloads version 2.15.0 and copies them to Solr's library directory.  

This is a quick hack solution, but it works so far.  


Tested and working in

Solr 8.2.0  
Solr 8.9.0

### Requirements:

- Privileged access to your server
- wget
- tar
- gzip


### Usage

- Create a backup of your solr configuration.  
- I repeat: create a backup of your solr configuration.  

- Either clone this repo on your server or copy patchSolr.sh there.

- Make the script executable 
- Adjust the variables. This script assumes that your solr resides in /opt/solr, System user solr, User group solr.

- Run it as a privileged user that has full access to the solr directory


#### Author
Marcus Raphelt <info@atnet-ws.de>
