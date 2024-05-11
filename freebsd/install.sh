#!/usr/bin/env bash

sudo pw group add firefox_users
sudo pw group add admin
sudo pw useradd admin -g admin -s /usr/local/bin/bash
sudo pw group mod admin -m admin
sudo pw group mod firefox_users -m admin
sudo pw group mod firefox_users -m administrator

sudo pkg install -y     \
bash                    \
beadm                   \
bhyve-firmware          \
dmenu                   \
drm-515-kmod            \
drm-kmod                \
firefox                 \
fusefs-sshfs            \
git                     \
gohufont                \
grub2-bhyve             \
i3                      \
i3lock                  \
slock                   \
mc                      \
rexima                  \
tabbed                  \
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
zsh

# clone antigen for zsh
cd ~/ ; git clone git@github.com:zsh-users/antigen.git

# configure bhyve
sudo vm init
sudo vm switch create -a 192.168.8.1/24 public
sudo vm switch add public eth0
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
