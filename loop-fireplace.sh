#!/bin/bash

# Path to the .wav file
SONG_PATH="/opt/fireplace-jazz/fireplace.wav"

# Check if the file exists
if [[ ! -f "$SONG_PATH" ]]; then
    echo "Error: File '$SONG_PATH' not found!"
    exit 1
fi

# make sure program exits correctly
trap "exit 0" EXIT

# Infinite loop to replay the song
while true; do
    echo "Now playing: $SONG_PATH"
	sudo machinectl shell --uid=admin .host /usr/bin/play --volume 1.2 "$SONG_PATH"   
 
    # Check the exit status of aplay
    if [[ $? -ne 0 ]]; then
        echo "Error playing the song. Exiting loop."
        break
    fi
done

