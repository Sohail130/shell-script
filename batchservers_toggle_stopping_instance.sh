#!/bin/bash

SERVER1_NAME="bompamsbatch01"
SERVER2_NAME="bompamsbatch02"
SERVER1_OCID=""
SERVER2_OCID=""

STATE_FILE="/home/opc/scripts/.last_batch_server"
LOG_FILE="/home/opc/scripts/toggle_batch_servers.log"

if [ ! -f "$STATE_FILE" ]
 then
  echo "$SERVER2_NAME" > "$STATE_FILE"
fi

LAST=$(cat "$STATE_FILE")

if [ "$LAST" == "$SERVER1_NAME" ]
 then
  echo "$(date): Stopping $SERVER1_NAME and Starting $SERVER2_NAME" >> "$LOG_FILE"
  oci compute instance action --instance-id "$SERVER1_OCID" --action STOP
  oci compute instance action --instance-id "$SERVER2_OCID" --action START
  echo "$SERVER2_NAME" > "$STATE_FILE"
 else
  echo "$(date): Stopping $SERVER2_NAME and Starting $SERVER1_NAME" >> "$LOG_FILE"
  oci compute instance action --instance-id "$SERVER2_OCID" --action STOP
  oci compute instance action --instance-id "$SERVER1_OCID" --action START
  echo "$SERVER1_NAME" > "$STATE_FILE"
fi
