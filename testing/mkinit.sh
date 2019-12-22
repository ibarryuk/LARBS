sed  -i.bak -e 's/MODULES=(*/MODULES=(ext4/' \
 -e 's/#* *HOOKS=(base udev autodetect modconf block */HOOKS=(base udev autodetect modconf block encrypt lvm2/' /etc/mkinitcpio.conf
