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

Validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...$Y failed $N" | tee -a $log_file
        exit 1
    else
        echo "$2...$R success $N" | tee -a $log_file
    fi
}

for pack in $@
do 
    dnf list installed $pack &>>$log_file
    if [ $? -ne 0 ]; then 
        echo "$pack is not installed ,installing now"
        dnf install $pack -y &>>$log_file
        Validate $? "$pack install"
    else 
        echo "$pack is already installed ,$R soo bye $N"
    fi        
done