#!/bin/bash

user_id=$(id -u)
log_dir="/home/ec2-user/app-log"
log_file="$log_dir/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $user_id -ne 0 ]; then
        echo -e "$r pls run the script to root user $n" | tee -a $log_file
        exit 1

fi

mkdir -p log_dir

USAGE(){
    echo -e "$R sudo backup <source_dir> <dest_dir> <days>[default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then 
    USAGE 
fi    