#!/bin/bash

# Find the PID of the infinite.sh script
pid=$(ps aux | grep '[i]nfinite.sh' | awk '{print $2}')

# Check if PID is found
if [ -z "$pid" ]; then
    echo "infinite.sh is not running."
else
    # Kill the process
    kill -9 $pid
    echo "infinite.sh (PID $pid) has been terminated."
fi
