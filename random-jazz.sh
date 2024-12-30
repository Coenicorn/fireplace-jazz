#!/bin/bash

# Directory containing .wav files
DIR="/opt/fireplace-jazz/jazz"

# Check if the directory exists and contains .wav files
if [[ ! -d "$DIR" ]] || [[ -z "$(ls -A "$DIR"/*.wav 2>/dev/null)" ]]; then
    echo "Directory '$DIR' does not exist or contains no .wav files."
    exit 1
fi

# Function to handle Ctrl+C
cleanup() {
    echo "Exiting the script..."
    exit 0
}

# Trap SIGINT (Ctrl+C) and call the cleanup function
trap cleanup EXIT

# Infinite loop to play random .wav files
while true; do
    # Select a random .wav file
    FILE=$(find "$DIR" -type f -name '*.wav' | shuf -n 1)

    if [[ -n "$FILE" ]]; then
        echo "Now playing: $FILE"
    	sudo machinectl shell --uid=admin .host /usr/bin/play --volume 0.1 "$FILE"
    else
        echo "No .wav files found in the directory."
        break
    fi
done
