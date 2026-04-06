#!/bin/bash


task_time=$(date +%s)


sleep 15

end_task_time=$(date +%s)

total_time=$(($end_task_time-$task_time))
echo "time taken:$total_time"