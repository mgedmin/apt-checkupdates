#
# Download Debian updates every night at 04:00
#
0 4 * * * root test -f /usr/sbin/apt-checkupdates && /usr/sbin/apt-checkupdates

#
# If this is a desktop machine that is turned off at night, uncomment the
# following line to download Debian updates on every reboot -- or use anacron.
#
##@reboot root test -f /usr/sbin/apt-checkupdates && /usr/sbin/apt-checkupdates
