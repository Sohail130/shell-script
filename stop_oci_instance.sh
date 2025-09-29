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
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icl7dcffhkd5fjqzy6zef7gx2iibiztbuzpknewanjflwq \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtoua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
   --action STOP \
   --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2ichmyeqqettkrggicl2ckflmia3p53ja7tdy45hjyhehua \
   >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdboua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icmbrxokfauk6uoi6lda44skd4n6ugcmfnvd5wdui6z3ca \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtdbamssoa01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icwpp6qiobyi7weamphsvbac4cmgg4hihtvlatkyna4u7q \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtams01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icz2dzwwfnpsspuwd66wq5fi3icyts3u5wapr62w4opamq \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomusermgt01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2ic3gtklkduifa3jnztk47fsisvmfvod5ywqabu2pb64wlq \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomtwebportal01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2ickqw6mkkvzbopmb3gheslckncg5dt4bonjfbibs3embbq \
  >> "$LOG_FILE" 2>&1

#### Added on new servers on 10-07-2025 ######

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddbamssoa01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icngw3w4gky5fhvagnb2nbomueuivxzky7kg2nmmhu5xna \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomddboua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2ic5bdkutaa43zn44mewjwuvzazdxfxypl64pedfjfgndda \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdoua01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2ic542orq3ocn52wlkzdtccokwg37bhckvjw6h2g3l2f2fq \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdams01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icerxf3eoa4auockkm7evypoxkjxt3rw2sgs52wknh5fcq \
  >> "$LOG_FILE" 2>&1

echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdintegration01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2icehlzobhlhmw7m4ulkrzvkwul5pvhpymy6zd5xbm27cdq \
  >> "$LOG_FILE" 2>&1


echo "" >> "$LOG_FILE"
echo "==================================================================" >> "$LOG_FILE"
echo "bomdwebportal01 stop logs" >> "$LOG_FILE"

oci compute instance action \
  --action STOP \
  --instance-id ocid1.instance.oc1.ap-mumbai-1.anrg6ljr7hknr2iczixlwn3676hshcvp5tfgc3hb7focmpd7zedu6akcrk3a \
  >> "$LOG_FILE" 2>&1

echo -e "####################################END OF LOG FILE $(date +%F)############################" >> "$LOG_FILE"```
