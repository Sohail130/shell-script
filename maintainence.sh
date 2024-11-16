#!/bin/bash

# ===========================
# Daily Server Maintenance Script
# ===========================

# Define Log File
LOGFILE="/var/log/daily_maintenance.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "====================" >> $LOGFILE
echo "Maintenance Started: $DATE" >> $LOGFILE

# 1. Check Disk Space Usage
echo "Checking disk space usage..." >> $LOGFILE
df -h >> $LOGFILE
echo "--------------------" >> $LOGFILE

# 2. Check System Uptime
echo "Checking system uptime..." >> $LOGFILE
uptime >> $LOGFILE
echo "--------------------" >> $LOGFILE

# 3. Check for Any Available Package Updates (Debian/Ubuntu based)
echo "Checking for available updates..." >> $LOGFILE
apt update && apt list --upgradable >> $LOGFILE
echo "--------------------" >> $LOGFILE

# 4. Rotate Logs (Optional: Using logrotate if needed)
echo "Rotating system logs..." >> $LOGFILE
logrotate /etc/logrotate.conf >> $LOGFILE
echo "--------------------" >> $LOGFILE

# 5. Clean up old system files (Optional: Delete older logs, caches)
echo "Cleaning up old log files and caches..." >> $LOGFILE
find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;  # Truncate log files
echo "--------------------" >> $LOGFILE

# 6. Backup Important Directories (Optional)
# echo "Starting backup..." >> $LOGFILE
# tar -czf /backup/important_files_$(date "+%Y%m%d").tar.gz /home /etc /var/www  # Example backup directories
# echo "Backup completed." >> $LOGFILE
# echo "--------------------" >> $LOGFILE

# 7. Check for Orphaned Packages (Debian/Ubuntu)
echo "Checking for orphaned packages..." >> $LOGFILE
apt-get autoremove -y >> $LOGFILE
echo "--------------------" >> $LOGFILE

# 8. System Reboot (Optional, based on your requirements)
echo "Checking if system needs a reboot..." >> $LOGFILE
needs_reboot=$(who -b | awk '{print $3 " " $4}')
echo "Last system reboot: $needs_reboot" >> $LOGFILE
echo "--------------------" >> $LOGFILE

# Maintenance Complete
DATE_FINISHED=$(date "+%Y-%m-%d %H:%M:%S")
echo "Maintenance Completed: $DATE_FINISHED" >> $LOGFILE
echo "====================" >> $LOGFILE

# End of Script
