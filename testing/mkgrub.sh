sed  -i.bak -e 's#^\(GRUB_CMDLINE_LINUX="\)"$#\1 cryptdevice=/dev/sdX3:luks:allow-discards"#' /etc/default/grub
