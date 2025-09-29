#!/bin/bash

echo -e "======================================================="

echo -e "Checking Security points for KFR on the server"

echo ""
echo -e "======================================================="
echo ""
echo -e "Ensure Password Fields are Not Empty for any of the local user account which has login shell enabled."

echo -e "================1 point======================================="
 
val=$(awk -F: '$2 == "" { print $1, "has empty password!" }' /etc/shadow)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No users with empty passwords found."
fi

echo ""
echo -e "======================================================="
echo ""
echo -e "Verify No UID 0 Accounts Exist Other Than root."

echo -e "====================2 point==================================="

val=$(awk -F: '$3 == "0" { print $1, "User having UID 0" }' /etc/passwd | uniq -d)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No UID 0 Accounts Exist Other Than root."
fi

echo ""

echo -e "======================================================="
echo ""
echo -e "Group for root Account should be GUID 0"

echo -e "========================3 point==============================="
val=$(id -g root) # check guid is 0

if [[ "$val" -eq "0" ]]
then
echo ""
echo -e "GUID for root Account is 0"
else
echo ""
echo "GUID for root Account is $val"
fi

echo ""
echo -e "======================================================="
echo ""
echo -e "Check for Duplicate UIDs"

echo -e "====================4 point==================================="

val=$(awk -F: '{ print $3 }' /etc/passwd | sort | uniq -d)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No Duplicate UIDs found"
fi

echo ""
echo -e "======================================================="
echo ""
echo -e "Check for User having GID is 0"

echo -e "=========================5 point=============================="

val=$(awk -F: '$4 == "0" { print $1, "User having GID 0" }' /etc/passwd)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No User found with GIDs having 0"
fi

echo ""
echo -e "======================================================="
echo ""
echo -e "Check for Duplicate User Names."

echo -e "========================6 point==============================="

val=$(awk -F: '{ print $1 }' /etc/passwd | sort | uniq -d)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No User found with Duplicate user name"
fi

echo ""
echo -e "======================================================="

echo ""
echo -e "Check for Duplicate Group Names."

echo -e "=========================7 point=============================="


val=$(awk -F: '{print $1}' /etc/group | sort | uniq -d)

if [[ -n "$val" ]]
then
    echo ""
    echo "$val"
else
    echo ""
    echo -e "No Group found with Duplicate group names"
fi


echo ""
echo -e "======================================================="
echo ""
echo -e "Permissions on /etc/sshd_config"

echo -e "=========================8 point=============================="

val=$(stat -c "%a" /etc/ssh/sshd_config)

if [[ "$val" -eq 600 ]]
then
    echo ""
    echo "$val has correct permissions (read/write for owner only)."
else
    echo ""
    echo "$val does not have correct permissions."
fi


echo ""
echo -e "======================================================="
echo ""
echo -e "Ensure SSH PermitEmptyPasswords is set to No."

echo -e "===========================9 point============================"

sshd_config="/etc/ssh/sshd_config"
val=$(grep -E '^\s*#?\s*PermitEmptyPasswords' "$sshd_config")

if [[ -z "$val" ]]
then
    echo "PermitEmptyPasswords is not set in $sshd_config."
elif [[ "$val" =~ ^# ]]
then
    echo "PermitEmptyPasswords is commented out in $sshd_config."
elif [[ "$val" =~ no ]]
then
    echo "PermitEmptyPasswords is set to 'no'."
else
    echo "PermitEmptyPasswords is set to 'yes'"
fi

echo ""
echo -e "=========================END=============================="
