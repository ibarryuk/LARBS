#Potential variables: timezone, lang and local

passwd

TZuser=$(cat tzfinal.tmp)

ln -sf /usr/share/zoneinfo/$TZuser /etc/localtime

hwclock --systohc

echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_GB ISO-8859-1" >> /etc/locale.gen
locale-gen

pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager
systemctl start NetworkManager

pacman --noconfirm --needed -S dialog grub linux lvm2 linux-firmware

sed  -i.bak -e 's/MODULES=(*/MODULES=(ext4/' \
 -e 's/#* *HOOKS=(base udev autodetect modconf block */HOOKS=(base udev autodetect modconf block encrypt lvm2 /' /etc/mkinitcpio.conf

mkinitcpio -p linux

grub-install # --target=i386-efi /dev/sda 

sed  -i.bak -e 's#^\(GRUB_CMDLINE_LINUX="\)"$#\1cryptdevice=/dev/sda3:luks:allow-discards"#' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

#larbs() { curl -O https://raw.githubusercontent.com/ibarryuk/LARBS/master/larbs.sh && bash larbs.sh ;}
#dialog --title "Install Luke's Rice" --yesno "This install script will easily let you access Luke's Auto-Rice Boostrapping Scripts (LARBS) which automatically install a full Arch Linux i3-gaps desktop environment.\n\nIf you'd like to install this, select yes, otherwise select no.\n\nLuke"  15 60 && larbs
