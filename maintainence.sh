#!/bin/bash

# Enable debugging (optional, removes after testing)
#set -x  # Prints each command as it is executed, helpful for troubleshooting

# ===========================
# Daily Server Maintenance Script (RPM-based Systems)
# ===========================

# Define Log File
sudo rm /var/log/daily_maintenance.log
LOGFILE="/var/log/daily_maintenance.log"

# Ensure log file is writable by checking permissions and creating if needed
if [ ! -e $LOGFILE ]; then
    sudo touch $LOGFILE
    sudo chmod 666 $LOGFILE
fi

DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "====================" >> $LOGFILE
echo "Maintenance Started: $DATE" >> $LOGFILE

# 1. Check Disk Space Usage
echo "Checking disk space usage..." >> $LOGFILE
df -h >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "Disk space check completed successfully." >> $LOGFILE
else
    echo "Error running df command." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 2. Check System Uptime
echo "Checking system uptime..." >> $LOGFILE
uptime >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "System uptime check completed successfully." >> $LOGFILE
else
    echo "Error running uptime command." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 3. Check for Any Available Package Updates (RPM-based systems)
echo "Checking for available updates..." >> $LOGFILE
dnf check-update -y >> $LOGFILE 2>&1   # For RHEL/CentOS 8+ and Fedora
if [ $? -eq 0 ]; then
    echo "Package check completed successfully." >> $LOGFILE
else
    echo "Error during package update check." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 4. Rotate Logs (Optional: Using logrotate if needed)
echo "Rotating system logs..." >> $LOGFILE
logrotate /etc/logrotate.conf >> $LOGFILE 2>&1
if [ $? -eq 0 ]; then
    echo "Log rotation completed." >> $LOGFILE
else
    echo "Log rotation failed." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 5. Clean up old system files (Optional: Delete older logs, caches)
echo "Cleaning up old log files and caches..." >> $LOGFILE
find /var/log -type f -name "*.log" -exec sudo truncate -s 0 {} \; >> $LOGFILE 2>&1  # Truncate log files with sudo
if [ $? -eq 0 ]; then
    echo "Log files truncated successfully." >> $LOGFILE
else
    echo "Error truncating log files." >> $LOGFILE
fi
sudo rm -rf /var/cache/yum/* >> $LOGFILE 2>&1  # Clean up YUM cache (for RHEL/CentOS 7)
sudo rm -rf /var/cache/dnf/* >> $LOGFILE 2>&1  # Clean up DNF cache (for RHEL/CentOS 8+)
if [ $? -eq 0 ]; then
    echo "Cache cleanup completed." >> $LOGFILE
else
    echo "Error during cache cleanup." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 6. Backup Important Directories (Optional)
echo "Starting backup..." >> $LOGFILE
tar -czf /backup/important_files_$(date "+%Y%m%d").tar.gz /home /etc  2>&1 >> $LOGFILE  # Example backup directories
if [ $? -eq 0 ]; then
    echo "Backup completed successfully." >> $LOGFILE
else
    echo "Backup failed." >> $LOGFILE
fi
echo "--------------------" >> $LOGFILE

# 7. Check for Orphaned Packages (RPM-based systems)
echo "Checking for orphaned packages..." >> $LOGFILE
dnf repoquery --unsatisfied -y >> $LOGFILE 2>&1   # For RHEL/CentOS 8+ and Fedora
if [ $? -eq 0 ]; then
    echo "Orphaned packages check completed successfully." >> $LOGFILE
else
    echo "Error checking orphaned packages." >> $LOGFILE
fi
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

