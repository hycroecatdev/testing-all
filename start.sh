#!/bin/bash
set -e

# systemd start cheyyan
/usr/sbin/sshd
/sbin/init &

# wait little
sleep 5

# start tmate and save SSH link
tmate -F -n mysession new-session -d
tmate wait tmate-ready

tmate display -p '#{tmate_ssh}' > /tmate_link.txt
tmate display -p '#{tmate_web}' >> /tmate_link.txt

echo "--------------------------------"
echo " Tmate Session Ready!"
echo " $(cat /tmate_link.txt)"
echo "--------------------------------"

# keep container running
tail -f /dev/null
