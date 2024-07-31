#!/bin/bash
server=`hostname | cut -d '.' -f 1`
jobtm=`date +"%F %T"`
jobst=`date +%s`

echo "Reposync activity for Ubuntu regular patching servers started at $jobtm on $server... $(date)"
echo "Stage:001 Running reposync for Ubuntu 18.04, 20.04 and 22.04 repositories ... continuing"
    apt-get update
    apt-mirror
echo "Reposync activity completed for Ubuntu 18.04, 20.04 and 22.04 on $server... $(date)"

echo "Stage:002 Getting CNF files for Bionic ... continuing"
    rm -rf /os_mirrors/archive.ubuntu.com/
    for p in "${1:-bionic}"{,-{security,updates}}\
    /{main,restricted};do >&2 echo "${p}"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-amd64.xz"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-i386.xz"
    done

echo "Stage:003 Getting CNF files for Focal ... continuing"
    for p in "${1:-focal}"{,-{security,updates}}\
    /{main,restricted};do >&2 echo "${p}"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-amd64.xz"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-i386.xz"
    done
: <<'END_COMMENT'

echo "Copying new CNF files for focal to local repository files"
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal/restricted/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal-security/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal-security/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal-security/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal-security/restricted/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal-updates/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal-updates/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/focal-updates/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/focal-updates/restricted/

echo "Stage:004 Getting CNF files for Jammy ... continuing"
    rm -rf /os_mirrors/archive.ubuntu.com/
    for p in "${1:-jammy}"{,-{security,updates}}\
    /{main,restricted};do >&2 echo "${p}"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-amd64.xz"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/cnf/Commands-i386.xz"
    wget -q -c -r -np -R "index.html*"\
     "http://archive.ubuntu.com/ubuntu/dists/${p}/binary-i386/"
    done

echo "Copying new CNF files for Jammy to local repository files"
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy/restricted/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy-security/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy-security/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy-security/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy-security/restricted/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy-updates/main/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy-updates/main/
    cp -pr /os_mirrors/archive.ubuntu.com/ubuntu/dists/jammy-updates/restricted/cnf /os_mirrors/ubuntu/mirror/archive.ubuntu.com/ubuntu/dists/jammy-updates/restricted/
echo "Reposync activity completed for Ubuntu 18.04, 20.04 and 22.04 repositories on $server... $(date)"

jobed=`date +%s`
runtime=$((jobed-jobst))
exectime="$(($runtime / 3600))hrs $((($runtime/ 60) % 60))min $(($runtime % 60))sec"
echo "Reposync total time $server: runtime = $exectime"
END_COMMENT
