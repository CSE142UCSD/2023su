#!/bin/bash
# change to 1.2GHz

core_id=0
while [ $core_id -le 31 ] 
do
#echo $i
    sudo echo 800000 > /sys/devices/system/cpu/cpu$core_id/cpufreq/scaling_max_freq
    core_id=$((core_id+1))
done
#/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
