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

