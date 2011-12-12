#!/bin/ash

Echo "This will disable the jasager interface.  You can check here for the ssh access guide http://www.digininja.org/jasager/usage_cli.php"
Echo "Note that in my experiance, this will jam legitimate access points in the area"

uci set wireless.wifi0.disabled=0
uci commit wireless && wifi
uci set wireless.@wifi-iface[0].txpower=18
uci commit wireless

echo "address=/#/192.168.1.1" > /etc/dnsmasq.conf

mv /etc/init.d/jasager /etc/init.d/jasager.stock
mv jasager /etc/init.d/jasager
chmod +x /etc/init.d/jasager

mv bg.gif index.html nyan-looped.ogg nyan-looped.mp3 snyan.gif stylesheet.css slkscr-webfont.eot slkscr-webfont.ttf slkscr-webfont.woff slkscr-webfont.svg favicon.ico /www/

echo "E404:/www/index.html" >> /etc/nyhttpd.conf
echo ".ogg:audio/ogg" >> /etc/nyhttpd.conf
echo ".mp3:audio/mpeg" >> /etc/nyhttpd.conf

mv /etc/init.d/httpd /etc/init.d/httpd.stock
mv httpd /etc/init.d/httpd
chmod +x /etc/init.d/httpd

rm install.sh
echo "Done - Rebooting!"
reboot
