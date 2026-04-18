#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
message=""

log(){
    echo -e "$G $(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $log_file
}

disk_usage=$(df -hT | grep -v Filesystem)
usage_threshold=2

while IFS= read -r line
do 
    usage=$($line | awk '{print $6}'|cut -d "%" -f1)
    partition_name=$(df -hT | grep -v Filesystem | awk '{print $7}')

    if [ "$usage" -gt "$usage_threshold" ]; then
        message+="high disk usage on $partition_name: $usage
    fi

done <<<$disk_usage

echo "$message"