#!/bin/bash


pid=$(ps aux | grep '[i]nfinite.sh' | awk '{print $2}') && [ -z "$pid" ] && echo "infinite.sh is not running." || (kill -9 $pid && echo "infinite.sh (PID $pid) has been terminated.")