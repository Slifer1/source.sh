#!/bin/bash
#compile and install software from source

echo -e "Which file do you want to extract?"
read file

if [ -d /home/$file ] # find directory
  then
    cd $file
    ./configure
    make
    sudo checkinstall # turn it into a .deb
elif [ -f /home/$file.tar.gz ] # find tar.gz archive
  then
    tar -xzvf $file.tar.gz # extract tar.gz
    cd $file
    ./configure
    make
    sudo checkinstall
elif [ -f /home/$file.tar.bz2 ] # find tar.bz2 archive
  then 
    tar -xjvf $file.tar.bz2 # extract tar.bz2
    cd $file
    ./configure
    make
    sudo checkinstall
else
  echo "$file does not exist"
fi