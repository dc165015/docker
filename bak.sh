#!/bin/bash
# full system backup

dest=/sysbak
pc=dc0
distro=ubuntu.artful.x64
type=full
date=$(date "+%F")
bakfile="$dest/$distro-$type-$date"

prog=${0##*/}

# specify files and dirs to be excluded
exclude=/sysbak/.bakignore

# -p and --xattrs store all permissions and extended attributes.
# without both, many programs will stop working.
# -v can be removed for verbose on progress.  
#tar --exclude-from=$exclude --xattrs -czpvf ${bakfile}-using-tar.tar.gz /

# full disk /dev/sda backup:
dd if=/dev/sda | gzip >/sysbak/${bakfile}-using-dd.gz
# full disk restore:
# gzip -dc /sysbak/$bakfile.gz | dd of=/dev/sda
