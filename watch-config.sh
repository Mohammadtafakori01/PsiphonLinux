#!/bin/bash

CONFIG_FILE="./configs/psiphon.config"

# Start the psiphon process
./psiphon-tunnel-core-x86_64 -config "$CONFIG_FILE" &

# Monitor the config file for changes
while inotifywait -e modify "$CONFIG_FILE"; do
    # Kill the old process
    pkill -f "psiphon-tunnel-core-x86_64"
    
    # Restart the psiphon process
    ./psiphon-tunnel-core-x86_64 -config "$CONFIG_FILE" &
done

