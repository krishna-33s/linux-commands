user_id=$(id -u)
log_folder="/var/log/shell"
log_file="/var/log/shell/$0.log"

if [ $user_id -ne 0 ]; then
    echo "pls run the script to root user" | tee -a $log_file
    exit 1

fi

mkdir -p $log_folder

Validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...failed" | tee -a $log_file
        exit 1
    else
        echo "$2...success" | tee -a $log_file
    fi
}

for pack in $@
do 
    dnf list installed $pack &>>$log_file
    if [ $? -ne 0]; then 
        echo "$pack is not installed ,installing now"
        dnf install $pack -y &>>$log_file
        Validate $? "$pack install"
    else 
        dnf "$pack is already installed ,soo bye"
    fi        
done    