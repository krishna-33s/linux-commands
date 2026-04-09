user_id=$(id -u)
log_folder="/var/log/shell"
log_file="/var/log/shell/$0.log"

if [ $user_id -ne 0 ]; then
    echo "pls run the script to root user"
    exit 1

fi

mkdir -p $logs_folder

Validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...failed"
        exit 1
    else
        echo "$2...success"
    fi
}

dnf install nginx -y >>& $log_file
Validate $? "installing nginx"

dnf install mysql -y >>& $log_file
Validate $? "installing mysql"

dnf install nodejnijjs -y >>& $log_file
Validate $? "installing nodejs"