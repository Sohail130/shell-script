```#!/bin/bash

export HOME=/home/opc
export PATH=/home/opc/bin:/usr/bin:/bin
export PATH=$HOME/oci-cli-venv/bin:$PATH


LOG_DIR="/home/opc/scripts/logs"
mkdir -p "$LOG_DIR"

# Set log file with current date
LOG_FILE="$LOG_DIR/oci-stop-$(date +%F).log"

# Run OCI stop command and log output


echo "=======================STOP LOGS OF TEST INSTANCE==========================================="

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtintegration01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtoua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
   --action STOP \
   --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
   >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdboua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdbamssoa01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtams01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomusermgt01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtwebportal01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

#### Added on new servers on 10-07-2025 ######

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddbamssoa01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddboua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdoua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdams01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdintegration01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdwebportal01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo -e "####################################END OF LOG FILE $(date +%F)############################" >> "$LOG_FILE"```
