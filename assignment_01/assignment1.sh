#!/bin/bash

# adding and deleting a user
sudo adduser ayman
sudo deluser ayman

touch abduu.txt

# changing with two ways
chmod 654 abduu.txt
chmod g+x abduu.txt

# make and remove a dir
mkdir milano
rm -rf milano

# search with the name
find . -name "abduu.txt"

# preview data in abduu file
echo "No.1" >> abduu.txt
cat abduu.txt

# make a new alias
alias clr='clear'
alias m='man'
m docker
clr

#nano & history & date
nano abduu.txt
history
date

