#!/bin/bash

export HOME=/home/opc
export PATH=/home/opc/bin:/usr/bin:/bin
export PATH=$HOME/oci-cli-venv/bin:$PATH


LOG_DIR="/home/opc/scripts/logs"
mkdir -p "$LOG_DIR"

# Set log file with current date
LOG_FILE="$LOG_DIR/oci-start-$(date +%F).log"

# Run OCI start command and log output

echo ""  >> "$LOG_FILE"
echo "=================================================================="  >> "$LOG_FILE"
echo "start bomtintegration01 logs" >> "$LOG_FILE"


oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtoua01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdboua01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtams01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdbamssoa01 start logs" >> "$LOG_FILE"


oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxx \
  >> "$LOG_FILE" 2>&1



echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomusermgt01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxx \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtwebportal01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1




echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddbamssoa01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1






echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddboua01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1





echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdoua01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1





echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdams01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1




echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdintegration01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1




echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdwebportal01 start logs" >> "$LOG_FILE"

oci compute instance action \
  --action START \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.xxxx \
  >> "$LOG_FILE" 2>&1

echo -e "=======================END OF LOG FILE $(date +%F) ====================================" >> "$LOG_FILE"
