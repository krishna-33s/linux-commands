#!/bin/bash
set -e
trap "echo 'error occured in $LINENO, Command: $BASH_COMMAND'" ERR

user_id=$(id -u)
log_folder="/var/log/shell"
log_file="/var/log/shell/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $user_id -ne 0 ]; then
    echo -e "$R pls run the script to root user $N" | tee -a $log_file
    exit 1

fi

mkdir -p $log_folder



for pack in $@
do 
    dnf list installed $pack &>>$log_file
    if [ $? -ne 0 ]; then 
        echo "$pack is not installed ,installing now"
        dnf install $pack -y &>>$log_file
    else 
        echo -e "$pack is already installed ,$R soo bye $N"
    fi        
done