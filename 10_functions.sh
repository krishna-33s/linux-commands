#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "pls run the script to root user"
    exit 1

fi

Validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...failed"
    else
        echo "$2...success"
    fi
}

dnf install nginx -y
validate $? "installing nginx"

dnf install mysql -y
validate $? "installing mysql"

dnf install nodejs -y
validate $? "installing nodejs"