#!/bin/bash

directory=$HOME
echo "present directory:$directory"
task_time=$(date +%s)

echo "started:$task_time"
sleep 15

end_task_time=$(date +%s)

total_time=$(($end_task_time-$task_time))
echo "time taken:$total_time"