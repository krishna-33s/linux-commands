#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "pls run the script to root user"
    exit 1

fi

Validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...failed"
        exit 1
    else
        echo "$2...success"
    fi
}

dnf install ngihnx -y
Validate $? "installing nginx"

dnf install mysql -y
Validate $? "installing mysql"

dnf install nodejs -y
Validate $? "installing nodejs"