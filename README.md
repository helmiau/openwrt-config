## OpenWrt Raspberry Pi 4 (Model B)
Additional setup for OpenWRT Raspberry Pi 4 (Model B)

### Source Firmware
This firmware is based on snapshot OpenWrt with additional packages from [**Lean packages**](https://github.com/coolsnowwolf/lede) with Chinese as default language.

[**Firmware source**](https://github.com/SuLingGG/OpenWrt-Rpi)  |  [**Actions Build**](https://github.com/SuLingGG/OpenWrt-Rpi/actions/workflows/build-rpi4-lean-openwrt.yml?query=is%3Asuccess)  |  [**Download Latest**](https://openwrt.cc/releases/targets/bcm27xx/bcm2711)

LuCI login information :
```sh
username : root
password : password
```

### Firmware Features

<details><summary>Features (click to show)</summary>
<p>

- This project provides OpenWrt firmware suitable for all Raspberry Pi devices (1~4), NanoPi R2S (Beta), Jingdou Cloud 2.0 and x86 platforms
- Contains rich OpenWrt original LuCI plug-ins and community LuCI plug-ins
- Integrate most wired, wireless, 3G/4G network card drivers, no need to install additional
- Pre-install the latest version of Clash core and oh-my-zsh to minimize configuration costs
- Pre-install all kmod ipk software packages in the firmware, pre-configure the local opkg software source, keep away from kmod conflicts
- More comprehensive IPV6 support, the firmware built-in IPV6 CLI configuration tool, you can quickly install/uninstall/configure IPV6
- Pull the latest OpenWrt source code and community plug-in source code at 2:00 am every day to compile and provide split downloads to ensure that you always get the latest experience
- Provide packages-server (including WEB server package archive), which can quickly establish LAN software source under Windows
- For advanced users, provide OpenWrt Image Builder, OpenWrt SDK, OpenWrt Tool Chain, and dl archive files

</p>
</details>

- If you encounter any functional problems before and during the use of the firmware, please refer to the content described in this article first. If you still do not get a satisfactory answer, you can submit Issues in this project or consult through the following methods:
- Contact information: [QQ group](https://jq.qq.com/?_wv=1027&k=5RkQisS) / [Telegram group](https://t.me/joinchat/Fc-MpxcaH3mEPA4yOMtJPQ) / [Telegram Channel](https://t.me/beautifulapps) (Please read the document carefully before joining the group)
- (The QQ group is the main contact method, the Telegram group is the alternate contact method, and the Telegram channel will push notifications of firmware and article updates)
- **If you are a user with rich OpenWrt experience and pursue a streamlined and customized firmware, you can take a look to this mini project [OpenWrt-Mini](https://github.com/SuLingGG/OpenWrt-Mini)**

### AdGuardHome Installation
Need Internet Connection
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-rpi4/main/adguardhome-install.sh" -P /root/ && cd /root && chmod 777 adguardhome-install.sh && bash adguardhome-install.sh
```
else you can do this manually
````sh
mkdir /etc/AdGuardHome
cd /etc/AdGuardHome/
wget https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.105.1/AdGuardHome_linux_arm64.tar.gz -O AdGuardHome-bin.tar.gz
tar -xzvf AdGuardHome-bin.tar.gz
cd AdGuardHome/
./AdGuardHome -s install
uci set dhcp.@dnsmasq[0].noresolv='1'
uci add_list dhcp.@dnsmasq[0].server='127.0.0.1#53535'
uci commit
service dnsmasq reload
````
### Uninstall Unused Packages

<details><summary>My bloatware lists (click to show)</summary>
<p>
  
```sh
All languages
luci-app-jd-dailybonus
luci-app-serverchan
luci-app-wifischedule
luci-app-uugamebooster
luci-app-mentohust
luci-app-unblockmusic
luci-app-familycloud
luci-app-frpc
luci-app-frps
luci-app-baidupcs-web
luci-app-filebrowser
luci-app-kodexplorer 
luci-app-ps3netsrv 
luci-app-amule 
luci-app-syncthing 
luci-app-nft-qos 
vsftpd-alt
luci-app-nfs 
luci-app-gowebdav 
luci-app-minidlna 
luci-app-mjpg-streamer 
luci-app-music-remote-center 
luci-app-syncdial 
luci-app-flowoffload 
luci-app-netdata 
luci-app-smartdns 
luci-app-accesscontrol 
luci-app-xlnetacc 
luci-app-shairplay 
luci-app-rclone 
luci-app-socat 
luci-app-udpxy 
luci-app-watchcat 
luci-app-nps
luci-app-zerotier 
luci-app-sqm 
luci-app-tinyproxy 
luci-app-haproxy-tcp 
luci-app-wol 
luci-app-transmission 
luci-app-fileassistant 
luci-app-filetransfer 
luci-app-ssr-mudb-server 
luci-app-guest-wifi 
luci-app-v2ray-server 
luci-app-vsftpd 
luci-app-adguardhome
```

</p>
</details>

online uninstallation
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-rpi4/main/uninstall-unused-packages.sh" -P /root/ && cd /root && chmod 777 uninstall-unused-packages.sh && bash uninstall-unused-packages.sh
```
you can do copy this manually
`````sh
#remove languages
opkg remove --force-removal-of-dependent-packages luci-i18n-*
#remove luci-app-xxxxx
opkg remove --force-removal-of-dependent-packages luci-app-jd-dailybonus luci-app-serverchan luci-app-wifischedule luci-app-uugamebooster luci-app-mentohust luci-app-unblockmusic luci-app-familycloud luci-app-frpc luci-app-frps luci-app-baidupcs-web luci-app-filebrowser luci-app-kodexplorer luci-app-ps3netsrv amule luci-app-amule luci-app-syncthing luci-app-nft-qos vsftpd-alt
opkg remove --force-removal-of-dependent-packages luci-app-nfs luci-app-gowebdav luci-app-minidlna luci-app-mjpg-streamer luci-app-music-remote-center luci-app-syncdial luci-app-flowoffload luci-app-netdata luci-app-smartdns luci-app-accesscontrol luci-app-xlnetacc luci-app-shairplay luci-app-rclone luci-app-socat luci-app-udpxy luci-app-watchcat luci-app-nps
opkg remove --force-removal-of-dependent-packages luci-app-zerotier luci-app-sqm luci-app-tinyproxy luci-app-haproxy-tcp luci-app-wol luci-app-transmission luci-app-fileassistant luci-app-filetransfer luci-app-ssr-mudb-server luci-app-guest-wifi luci-app-v2ray-server luci-app-vsftpd luci-app-adguardhome
#remove debs and libs
opkg remove --force-removal-of-dependent-packages wifischedule UnblockNeteaseMusic UnblockNeteaseMusicGo frpc frps baidupcs-web ps3netsrv syncthing nft-qos nfs-kernel-server nfs-kernel-server-utils nfs-utils nfs-utils-libs gowebdav forked-daapd minidlna mjpg-streamer netdata smartdns shairplay shairport-sync-openssl rclone rclone-ng rclone-webui-react socat udpxy watchcat etherwake
opkg remove --force-removal-of-dependent-packages zerotier sqm-scripts tinyproxy haproxy wol transmission-daemon-openssl transmission-web-control adguardhome
#reboot
reboot

`````


[**notes**](links)
