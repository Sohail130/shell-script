#!/bin/bash
server=`hostname | cut -d '.' -f 1`
jobtm=`date +"%F %T"`
jobst=`date +%s`

echo "This script provides the results for listing out all AD users, groups, centrify config, adinfo all and dzinfo all for each individual user."

echo "The audit reports generation process $jobtm started on $server... $(date)"

adinfo --all >adinfo$server.txt
echo "The adinfo all output has been generated and saved in adinfo$server.txt"

adquery user --all >adusers$server.txt
echo "The adquery user all output has been generated and saved in adusers$server.txt"

adquery group --all >adgroups$server.txt
echo "The adquery group all output has been generated and saved in adgroups$server.txt"

cat /etc/centrifydc/centrifydc.conf >centrifyconfig$server.txt
echo "The centrify configuration output has been generated and saved in centrifyconfig$server.txt"


adquery user --all |awk '{print $1}' |cut -d ':' -f 1 |uniq >alladusers$server.txt
inputfile="alladusers$server.txt"
outputfile="result$server.txt"
while IFS= read -r username; do
        dzinfo $username --all
done < "$inputfile" >"$outputfile"
jobed=`date +%s`
runtime=$((jobed-jobst))
exectime="$(($runtime / 3600))hrs $((($runtime/ 60) % 60))min $(($runtime % 60))sec"

echo "The output of dzdoinfo for each user has been generated and saved in $outputfile"

echo "All audit reports has been genearated on $server: $jobtm runtime = $exectime"
