#!/bin/bash

user_id=$(id -u)
log_dir="/var/log/linux-commands"
log_file="$log_dir/backup.log"
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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $log_file
}

if [ $# -lt 2 ]; then 
    USAGE 
fi    

if [ ! -d $source_dir ]; then
    echo -e "$R source directory: $source_dir doesnot exist $N"
    exit 1
fi 

if [ ! -d $dest_dir ]; then
    echo -e "$R destination: $dest_dir doesnot exist $N"
    exit 1
fi 

files=$(find $source_dir -name "*.log" -type f -mtime +$days)

log "backup started"
log "source directory: $source_dir"
log "destination: $dest_dir"
log "days: $days"