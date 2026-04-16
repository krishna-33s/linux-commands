#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

log_dir="/home/ec2-user/app-log"
log_file="$log_dir/$0.log"


if [ ! -d $log_dir ]; then 
    echo "$log_dir does not exist"
    exit 1
fi

find_files=$(find $log_dir -name "*.log" -mtime +14)

while IFS= read -r path; do 
    echo "$path"
done <<< $find_files    