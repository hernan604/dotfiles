xrdb ~/.Xresources
chown administrator:firefox_users /tmp/administrator_Xauthority
chmod g+rw /tmp/administrator_Xauthority
xrandr --dpi 220
redshift &
synclient TapButton3=2
exec i3
