#!/bin/bash

echo -e "\e[1;35mSystems specs\e[0m"

kernel=$(cat /proc/version | awk '{print $3}')
host=$(cat /proc/sys/kernel/hostname)
cpu=$(cat /proc/cpuinfo | grep "model name" | awk '{print $4,$5,$6,$7}')
uptime_info=$(uptime -p)
mem_info=$(free -h)
total_mem=$(echo "$mem_info" | awk 'NR==2 {print $2}')
used_mem=$(echo "$mem_info" | awk 'NR==2 {print $3}')
free_mem=$(echo "$mem_info" | awk 'NR==2 {print $4}')
user_name=$(whoami)
current_date=$(date)
os_version=$(lsb_release -d | awk -F"\t" '{print $2}')

echo -e "\e[1;33mHostname\e[0m: $host"
echo -e "\e[1;33mDate and Time\e[0m: $current_date"
echo -e "\e[1;33mUsername\e[0m:  $user_name"
echo -e "\e[1;33mUptime\e[0m: $uptime_info"
echo -e "\e[1;33mSystem version\e[0m: $os_version"
echo -e "\e[1;33mKernel\e[0m:   $kernel"
echo -e "\e[1;33mCPU\e[0m:      $cpu"
echo -e "\e[1;33mTotal memory\e[0m:   $total_mem, \e[1;33mUsed memory\e[0m:  $used_mem, \e[1;33mRemained memory\e[0m:  $free_mem"

exit 0
