#!/usr/bin/env bash

sudo pw group add firefox_users
sudo pw group add admin
sudo pw useradd admin -g admin -s /usr/local/bin/bash
sudo pw group mod admin -m admin
sudo pw group mod firefox_users -m admin
sudo pw group mod firefox_users -m administrator

sudo pkg install -y     \
nvramtool               \
bash                    \
beadm                   \
bhyve-firmware          \
dmenu                   \
drm-515-kmod            \
firefox                 \
fusefs-sshfs            \
git                     \
gohufont                \
grub2-bhyve             \
slock                   \
mc                      \
rexima                  \
tigervnc-viewer         \
vim                     \
vm-bhyve                \
webcamd                 \
wifibox                 \
xf86-input-libinput     \
xf86-input-synaptics    \
xorg                    \
xterm                   \
acpi_call               \
hwstat                  \
zsh

# clone antigen for zsh
cd ~/ ; git clone git@github.com:zsh-users/antigen.git

# configure bhyve
sudo vm init
sudo vm switch create -a 192.168.8.1/24 public
sudo vm switch add public re0
sudo vm switch add public wlan0
mkdir ~/bhyve/
sudo cp /usr/local/share/examples/vm-bhyve/* ~/bhyve/.templates/
# sudo vm create -c 4 -m 8G -t ubuntu -s 25G machinename01
#
read -p "Enter hostname for this machine:" machine_hostname
export machine_hostname=$machine_hostname

# copy and overwrite some config files

config_files="
/boot/loader.conf
/etc/pf.conf
/etc/rc.conf
/etc/sysctl.conf
/etc/devfs.rules
/etc/devfs.conf
/usr/local/etc/wifibox/appliance/iptables
/usr/local/etc/wifibox/bhyve.conf
"
for file in $config_files ;
do sudo cp -i $PWD/freebsd/files$file $file
; done

# configure freebsd wifibox network ssid password
echo "Configure wpa_supplicant for [wifibox]:"
read -p "[wifibox] Enter network name (ssid): " wifibox_ssid
read -p "[wifibox] Enter network password: " wifibox_password
read -p "[wifibox] Is network hidden ? enter 1 for yes. 0 for no " wifibox_hidden

sudo cat << __EOF__ > /tmp/wpa_supplicant.conf

network={
	ssid="$wifibox_ssid"
	scan_ssid=$wifibox_hidden
	psk="$wifibox_password"
	priority=5
}

__EOF__

sudo cp -i /tmp/wpa_supplicant.conf /usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf
sudo chown root:wheel /usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf
sudo chmod 640 /usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf 
rm /tmp/wpa_supplicant.conf



####################################################################
#
# set battery charging thresholds on laptop:
# FROM: https://forums.freebsd.org/threads/how-to-set-battery-charging-thresholds-on-laptop.79807/
# - check that battery is charging:
#   acpiconf -i0 | grep State
#   State:                   charging   <---- means battery is charging.. even when its 100%. that will damage the battery. so we want to avoid with this trick
# - run the command below to list dev.acpi_ settings.
# - find the handle ie: sysctldev.acpi_ec.0.%location: handle=\_SB_.PCI0.LPCB.EC0_
#   sysctl -a | grep dev.acpi_
# - then, use acpi_call -v -p '\$____REPLACE_WITH_HANDLE_HERE____.HKEY.BCSS' -i 95
# NOTE: BCSS is the percentage to STOP charging
# NOTE: BCCS is the percentage to START charging
# ➜  ~ acpi_call -v -p '\_SB_.AC__.HKEY.BCSS' -i 95
# acpi_callPath: \_SB_.AC__.HKEY.BCSS
# Number of arguments: 1
# Argument 1 type: Integer
# Argument 1 value: 95
# Status: 5
# Result: Unknown object type '0'
# ➜  ~ acpi_call -v -p '\_SB_.AC__.HKEY.BCCS' -i 80
# acpi_callPath: \_SB_.AC__.HKEY.BCCS
# Number of arguments: 1
# Argument 1 type: Integer
# Argument 1 value: 80
# Status: 5
# Result: Unknown object type '0'
# ➜  ~ acpiconf -i0 | grep State
# acpiconfState:                   high  <----- now, its not charging anymore, it says its high. even if it is at 96%


#############################################
# Disable intel me on freebsd:
# sudo nvramtool -w me_state=Disable # disable intel me
