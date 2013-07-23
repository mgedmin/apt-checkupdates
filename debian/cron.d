#
# Download Debian updates every night at 04:00
#
0 4 * * * root if [ -x /usr/sbin/apt-checkupdates ]; then /usr/sbin/apt-checkupdates; fi

#
# If this is a desktop machine that is turned off at night, uncomment the
# following line to download Debian updates on every reboot -- or use anacron.
#
##@reboot root if [ -x /usr/sbin/apt-checkupdates ]; then /usr/sbin/apt-checkupdates; fi
