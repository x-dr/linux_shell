#!/bin/sh

sudo apt-get update
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

FILE="/etc/apt/sources.list"
FILE2=$FILE.backup

sudo cp $FILE $FILE2
echo "already backup source list."
cat <<EOM >$FILE
deb http://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ bullseye main non-free contrib
deb http://mirrors.aliyun.com/debian-security/ bullseye-security main
deb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main
deb http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib
EOM
echo "already write source list."
sudo apt-get update
sudo apt-get upgrade
echo "already change source list. All update & upgrade have done!"


echo "install openssh"
sudo apt-get install openssh-server -y
echo "install openssh done"

echo "install git"
sudo apt-get install git -y
echo "install git done"

echo "install vim"
sudo apt-get install vim -y
echo "install vim done"

echo "install curl"
sudo apt-get install curl -y
echo "install curl done"


echo "root ssh"
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "already root ssh"


