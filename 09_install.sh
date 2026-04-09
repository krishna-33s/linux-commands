#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then 
    echo "please run with root user"
    exit 1
fi

echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "installing nginx...failed"
else
    echo "installing nginx...success"
fi

echo "installing mysql"
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "installing mysql...failed"
else
    echo "installing mysql...success"
fi

echo "installing nodejs"
dnf install nodejs -y
if [ $? -ne 0 ]; then
    echo "installing nodejs...failed"
else
    echo "installing nodejs...success"
fi