#!/bin/bash

user_id=$(id -u)
log_dir="/var/log/shell-script"
log_file="$log_dir/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
dest_dir=$2
days=${3:-14}

if [ $user_id -ne 0 ]; then
        log -e "$R pls run the script to root user $N" | tee -a $log_file
        exit 1

fi

mkdir -p $log_dir

USAGE(){
    log "$R sudo backup <source_dir> <dest_dir> <days>[default 14 days] $N"
    exit 1
}

log(){
    echo -e "$G $(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $log_file
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

if [ -z "${files}" ]; then 
    log "no files to archieve ...$Y leaving $N"
else 
    log "files found to archieve: $files"
    timestamp=$(date +%F-%H-%M-%S)
    zip_file="$dest_dir/app-log-$timestamp.tar.gz"
    log "archieve name: $zip_file"
    tar -zcvf $zip_file $(find $source_dir -name "*.log" -type f -mtime +$days)

    if [ -f $zip_file ]; then 
        log "archeival is...$G success $N"

        while IFS= read -r path; do 
        log "deleting file: $path"
        rm -f $path
        log "deleted file: $path"
        done <<< $files
    else 
        log "archeival is...$R failure $N"
        exit 1        
    fi
fi    
