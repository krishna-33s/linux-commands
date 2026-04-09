#!/bin/bash

user-id=$(id -u)

if [ $user-id -ne 0 ]; then 
    echo "please run with root user"
    exit 1
if    

echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "installing nginx...failed"
else
    echo "installing nginx...success"
fi

