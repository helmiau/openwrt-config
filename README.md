## My OpenWrt Settings
Index of additional setup for OpenWRT Raspberry Pi 4 (Model B), Gl.iNet GL-AR300M Nand Ext

About firmware
- [Source firmware](https://github.com/helmiau/openwrt-config/blob/main/README.md#source-firmware)  |  [Firmware information and features](https://github.com/helmiau/openwrt-config/blob/main/README.md#firmware-features) | [Firmware installation](https://github.com/helmiau/openwrt-config/blob/main/README.md#firmware-installation)

About Additions
- [AdGuardHome Installation](https://github.com/helmiau/openwrt-config/blob/main/README.md#adguardhome-installation)
- [Simple Adblock](https://github.com/helmiau/openwrt-config/blob/main/README.md#simple-adblock-installation)
- [Debloating/Removing/Uninstalling unused packages](https://github.com/helmiau/openwrt-config/blob/main/README.md#uninstall-unused-packages)
- [Install Neofetch](https://github.com/helmiau/openwrt-config/blob/main/README.md#install-neofetch)
- [Install Libernet for SSH SSL Tunneling](https://github.com/helmiau/openwrt-config/blob/main/README.md#install-libernet-for-ssh-ssl-tunneling-by-lutfailham96)
- [Install Speedtest by Ookla](https://github.com/helmiau/openwrt-config/blob/main/README.md#install-speedtest-by-ookla)
- [Setting up load balance for vpn injection](https://github.com/helmiau/openwrt-config/blob/main/README.md/blob/main/loadbalance-setting.md#setting-up-load-balance-with-mwan3-for-all-devices)


####################################################

### Source Firmware
This firmware is based on snapshot OpenWrt with additional packages from [**Lean packages**](https://github.com/coolsnowwolf/lede) with Chinese as default language. Will be generated automatically every 2:00 AM by github action builds.

[**Firmware source**](https://github.com/SuLingGG/OpenWrt-Rpi)  |  [**Actions Build**](https://github.com/SuLingGG/OpenWrt-Rpi/actions/workflows/build-rpi4-lean-openwrt.yml?query=is%3Asuccess)  |  [**Download Latest**](https://openwrt.cc/releases/targets/bcm27xx/bcm2711)

LuCI login information :
```sh
username : root
password : password
```

### Firmware Features

<details><summary>Features (click to show)</summary>
<p>

- Contains rich OpenWrt original LuCI plug-ins and community LuCI plug-ins
- Integrate most wired, wireless, 3G/4G network card drivers, no need to install additional
- Pre-install the latest version of Clash core and oh-my-zsh to minimize configuration costs
- Pre-install all kmod ipk software packages in the firmware, pre-configure the local opkg software source, keep away from kmod conflicts
- More comprehensive IPV6 support, the firmware built-in IPV6 CLI configuration tool, you can quickly install/uninstall/configure IPV6
- Pull the latest OpenWrt source code and community plug-in source code at 2:00 am every day to compile and provide split downloads to ensure that you always get the latest experience
- Provide packages-server (including WEB server package archive), which can quickly establish LAN software source under Windows
- For advanced users, provide OpenWrt Image Builder, OpenWrt SDK, OpenWrt Tool Chain, and dl archive files
Contains scientific Internet tools:
- The firmware supports the following scientific Internet tools: ①ShadowSocksR Plus+ ②Passwall ③OpenClash
- Among them, ShadowSocksR Plus+ in Offical version firmware is transplanted from Lean version source code.
- Both now support SS/SSR/V2ray/Trojan/Socks5 protocol, support Kcptun, support Netflix streaming, support link/subscription import node, Socks5 server, access control, automatic switching of failed nodes. Among them, Passwall additionally supports Brook and V2ray diversion.
- For OpenClash, the latest version of Clash core (clash/clash_tun/clash_game) has been pre-installed in the firmware, and it can be used out of the box without additional download.
- Support ad blocking AdGuard Home
```sh
Note: The advertisement blocking effect at the router level is not good. If you are very sensitive to advertisements, it is recommended to use the browser plug-in-level advertisement blocking plugin. In addition, ad blocking tools may severely affect internet speed.
```
- Support to unlock NetEase Cloud gray songs:
- Contains three schemes of Golang/Nodejs/cloud unlocking.
- Support Jingdong sign-in service, you can get 20+ golden beans/day unattended.
- Support Docker container arm and aarch64 (arm64) architecture images. Before pulling the image, please confirm that the image has the above architecture version and use the corresponding architecture tag to pull it.
- Support AirPlay2 and PCHiFi digital turntable remote control function, you can push music to the Raspberry Pi to play and control through the AirPlay feature.
- Support Samba/CIFSD/FTP/SFTP file transfer, support mounting Samba/NFS file system to local, support Syncthing and VerySync synchronization, support Rclone to mount network disk files to local.
- Support disk management, you can create/remove partitions and create Raid arrays with one click.
- Support file assistant / file browser (Filemanager) / Kodexplorer (Kodexplorer), can manage the files in OpenWrt online.
- Support Aria2 and Transmission download tools, you can download http/https/BT seeds/magnet links to Raspberry Pi.
- Support SSR server (libv/python), V2ray server, Brook server, Trojan server, PPTP VPN server, IPSec VPN server, OpenVPN server, N2N v2 VPN, ZeroTier, support OpenVPN client, PPTP/L2TP client, OpenConnect client, WireGuard VPN.
- Support DDNS (support Dnspod and Alibaba Cloud DDNS), SmartDNS, ARP binding.
- Support Frpc/NPS intranet penetration and Frps server.
- Support WeChat push (Server sauce), USB print server, KMS server, Wake-on-LAN, Thunderbird, Tianyi Family Cloud/Cloud Disk to speed up.
- Support SQM Qos, Socat, support udpspeeder and udp2raw acceleration, support SFE acceleration, bridge acceleration, IPV6 acceleration, FULLCONE NAT acceleration, BBR acceleration.
- Support multi-line multi-dial, load balancing, MWAN3 shunt assistant.

</p>
</details>

#### Information
- If you encounter any functional problems before and during the use of the firmware, please refer to the content described in this article first. If you still do not get a satisfactory answer, you can submit Issues in this project or consult through the following methods:
- Contact information: [QQ group](https://jq.qq.com/?_wv=1027&k=5RkQisS) / [Telegram group](https://t.me/joinchat/Fc-MpxcaH3mEPA4yOMtJPQ) / [Telegram Channel](https://t.me/beautifulapps) (Please read the document carefully before joining the group)
- (The QQ group is the main contact method, the Telegram group is the alternate contact method, and the Telegram channel will push notifications of firmware and article updates)
- **If you are a user with rich OpenWrt experience and pursue a streamlined and customized firmware, you can take a look to this mini project [OpenWrt-Mini](https://github.com/SuLingGG/OpenWrt-Mini)**

### Firmware Installation

<details><summary>Installation (Windows) (click to show)</summary>
<p>

- Download firmware which contain **sysupgrade** or **factory** words 
- Download [Rufus](https://github.com/pbatard/rufus/releases/download/v3.13/rufus-3.13p.exe)
- Insert SdCard
- Open Rufus
- Select disk (sdcard)
- Drag and drop downloaded firmware to Rufus window
- Start

</p>
</details>

### AdGuardHome Installation
for all devices
Need Internet Connection
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-config/main/adguardhome-install.sh" -P /root/ && cd /root && chmod 777 adguardhome-install.sh && bash adguardhome-install.sh
```
else you can do this manually
````sh
mkdir /etc/AdGuardHome
cd /etc/AdGuardHome/
wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_arm.tar.gz -O AdGuardHome-bin.tar.gz
#wget https://github.com/AdguardTeam/AdGuardHome/releases/download/${latest_ver}/AdGuardHome_linux_${Arch}.tar.gz -O AdGuardHome-bin.tar.gz
tar -xzvf AdGuardHome-bin.tar.gz
cd AdGuardHome/
./AdGuardHome -s install
uci set dhcp.@dnsmasq[0].noresolv='1'
uci add_list dhcp.@dnsmasq[0].server='127.0.0.1#53535'
uci commit
service dnsmasq reload
````

### Simple Adblock Installation
for all devices
Need Internet Connection !!!!!! here is the [source](https://docs.openwrt.melmac.net/simple-adblock/)
```sh
opkg update
cd /tmp/
opkg download dnsmasq-full
opkg install ipset
opkg remove dnsmasq
opkg install /tmp/dnsmasq-full*
rm -f /tmp/dnsmasq-full*

#if you need ipv6 support, install these
opkg install ip6tables-mod-nat kmod-ipt-nat6

#recomended to install these package for speed up adblocking process
opkg --force-overwrite install gawk grep sed coreutils-sort

#main installation package is this
opkg install simple-adblock
opkg install luci-app-simple-adblock
opkg install https-dns-proxy
opkg install luci-app-https-dns-proxy
cd
```

### Uninstall Unused Packages
for [**this firmware**](https://github.com/SuLingGG/OpenWrt-Rpi/actions/workflows/build-rpi4-lean-openwrt.yml?query=is%3Asuccess)
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
luci-app-ddns
```

</p>
</details>

online uninstallation
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-config/main/uninstall-unused-packages.sh" -P /root/ && cd /root && chmod 777 uninstall-unused-packages.sh && bash uninstall-unused-packages.sh
```
<details><summary>You can copy this scripts manually (click to expand)</summary>
<p>
  
`````sh
#!/bin/sh
#remove languages
opkg remove --force-removal-of-dependent-packages luci-i18n-*
#remove luci-app-xxxxx
opkg remove --force-removal-of-dependent-packages luci-app-jd-dailybonus
opkg remove --force-removal-of-dependent-packages luci-app-serverchan
opkg remove --force-removal-of-dependent-packages luci-app-wifischedule
opkg remove --force-removal-of-dependent-packages luci-app-uugamebooster
opkg remove --force-removal-of-dependent-packages luci-app-mentohust
opkg remove --force-removal-of-dependent-packages luci-app-unblockmusic
opkg remove --force-removal-of-dependent-packages luci-app-familycloud
opkg remove --force-removal-of-dependent-packages luci-app-frpc
opkg remove --force-removal-of-dependent-packages luci-app-frps
opkg remove --force-removal-of-dependent-packages luci-app-baidupcs-web
opkg remove --force-removal-of-dependent-packages luci-app-filebrowser
opkg remove --force-removal-of-dependent-packages luci-app-kodexplorer
opkg remove --force-removal-of-dependent-packages luci-app-ps3netsrv
opkg remove --force-removal-of-dependent-packages luci-app-amule
opkg remove --force-removal-of-dependent-packages luci-app-syncthing
opkg remove --force-removal-of-dependent-packages luci-app-nft-qos
opkg remove --force-removal-of-dependent-packages vsftpd-alt
opkg remove --force-removal-of-dependent-packages luci-app-nfs
opkg remove --force-removal-of-dependent-packages luci-app-gowebdav
opkg remove --force-removal-of-dependent-packages luci-app-minidlna
opkg remove --force-removal-of-dependent-packages luci-app-mjpg-streamer
opkg remove --force-removal-of-dependent-packages luci-app-music-remote-center
opkg remove --force-removal-of-dependent-packages luci-app-syncdial
opkg remove --force-removal-of-dependent-packages luci-app-flowoffload
opkg remove --force-removal-of-dependent-packages luci-app-netdata
opkg remove --force-removal-of-dependent-packages luci-app-smartdns
opkg remove --force-removal-of-dependent-packages luci-app-accesscontrol
opkg remove --force-removal-of-dependent-packages luci-app-xlnetacc
opkg remove --force-removal-of-dependent-packages luci-app-shairplay
opkg remove --force-removal-of-dependent-packages luci-app-rclone
opkg remove --force-removal-of-dependent-packages luci-app-socat
opkg remove --force-removal-of-dependent-packages luci-app-udpxy
opkg remove --force-removal-of-dependent-packages luci-app-watchcat
opkg remove --force-removal-of-dependent-packages luci-app-nps
opkg remove --force-removal-of-dependent-packages luci-app-zerotier
opkg remove --force-removal-of-dependent-packages luci-app-sqm
opkg remove --force-removal-of-dependent-packages luci-app-tinyproxy
opkg remove --force-removal-of-dependent-packages luci-app-haproxy-tcp
opkg remove --force-removal-of-dependent-packages luci-app-wol
opkg remove --force-removal-of-dependent-packages luci-app-transmission
opkg remove --force-removal-of-dependent-packages luci-app-fileassistant
opkg remove --force-removal-of-dependent-packages luci-app-filetransfer
opkg remove --force-removal-of-dependent-packages luci-app-ssr-mudb-server
opkg remove --force-removal-of-dependent-packages luci-app-guest-wifi
opkg remove --force-removal-of-dependent-packages luci-app-v2ray-server
opkg remove --force-removal-of-dependent-packages luci-app-vsftpd
opkg remove --force-removal-of-dependent-packages luci-app-ddns
opkg remove --force-removal-of-dependent-packages luci-app-mwan3helper
opkg remove --force-removal-of-dependent-packages luci-app-adguardhome 
#remove debs and libs
opkg remove --force-removal-of-dependent-packages amule
opkg remove --force-removal-of-dependent-packages wifischedule
opkg remove --force-removal-of-dependent-packages UnblockNeteaseMusic
opkg remove --force-removal-of-dependent-packages UnblockNeteaseMusicGo
opkg remove --force-removal-of-dependent-packages frpc
opkg remove --force-removal-of-dependent-packages frps
opkg remove --force-removal-of-dependent-packages baidupcs-web
opkg remove --force-removal-of-dependent-packages ps3netsrv
opkg remove --force-removal-of-dependent-packages syncthing
opkg remove --force-removal-of-dependent-packages nft-qos
opkg remove --force-removal-of-dependent-packages nfs-kernel-server
opkg remove --force-removal-of-dependent-packages nfs-kernel-server-utils
opkg remove --force-removal-of-dependent-packages nfs-utils
opkg remove --force-removal-of-dependent-packages nfs-utils-libs
opkg remove --force-removal-of-dependent-packages gowebdav
opkg remove --force-removal-of-dependent-packages forked-daapd
opkg remove --force-removal-of-dependent-packages minidlna
opkg remove --force-removal-of-dependent-packages mjpg-streamer
opkg remove --force-removal-of-dependent-packages netdata
opkg remove --force-removal-of-dependent-packages smartdns
opkg remove --force-removal-of-dependent-packages shairplay
opkg remove --force-removal-of-dependent-packages shairport-sync-openssl
opkg remove --force-removal-of-dependent-packages rclone
opkg remove --force-removal-of-dependent-packages rclone-ng
opkg remove --force-removal-of-dependent-packages rclone-webui-react
opkg remove --force-removal-of-dependent-packages socat
opkg remove --force-removal-of-dependent-packages udpxy
opkg remove --force-removal-of-dependent-packages watchcat
opkg remove --force-removal-of-dependent-packages etherwake
opkg remove --force-removal-of-dependent-packages zerotier
opkg remove --force-removal-of-dependent-packages sqm-scripts
opkg remove --force-removal-of-dependent-packages tinyproxy
opkg remove --force-removal-of-dependent-packages haproxy
opkg remove --force-removal-of-dependent-packages wol
opkg remove --force-removal-of-dependent-packages transmission-daemon-openssl
opkg remove --force-removal-of-dependent-packages transmission-web-control
opkg remove --force-removal-of-dependent-packages ddns-*
opkg remove --force-removal-of-dependent-packages adguardhome
#reboot
reboot

`````

</p>
</details>

<details><summary>Additionals dependencies for myself (click)</summary>
<p>
  
  INTERNET CONNECTION IS NEEDED !!!!!!!
  
```sh
#simple adblock
opkg --force-overwrite install git gawk grep sed coreutils-sort ip6tables-mod-nat kmod-ipt-nat6 simple-adblock luci-app-simple-adblock https-dns-proxy luci-app-https-dns-proxy
#libernet
mkdir -p ~/Downloads && cd ~/Downloads
git clone git://github.com/lutfailham96/libernet.git
cd libernet && bash install.sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-config/main/fix-xderm-libernet-gui" -P /root/ && chmod 777 /root/fix-xderm-libernet-gui && cd /root && bash fix-xderm-libernet-gui
#neofetch
wget -O /bin/neofetch "https://raw.githubusercontent.com/helmiau/openwrt-config/main/neopet"
chmod +x /bin/neofetch
#speedtest
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/speedtest/main/install-speedtest" -P /root/ && chmod 777 /root/install-speedtest && cd /root && bash install-speedtest
#update debs
opkg update
opkg --force-overwrite install git gawk grep sed coreutils-sort ip6tables-mod-nat kmod-ipt-nat6
```

</p>
</details>

### Install Neofetch
for all devices
forked from [**dylanaraps/neofetch**](https://github.com/dylanaraps/neofetch) 
```sh
wget -O /bin/neofetch "https://raw.githubusercontent.com/helmiau/openwrt-config/main/neopet"
chmod +x /bin/neofetch
```

### Install [**Libernet for SSH SSL Tunneling by lutfailham96**](https://github.com/lutfailham96/libernet)
for all devices
```sh
opkg update && opkg install bash curl
bash -c "$(curl -sko - 'https://raw.githubusercontent.com/lutfailham96/libernet/main/install.sh')"

```

default username and password
```sh
Username: admin
Password: libernet
```


if you get error downloading index.php everytime, then fix with this : (thanks to [vitoharhari](https://github.com/vitoharhari/xderm-mini-gui) for comparison scripts)
```sh
bash -c "$(curl -sko - 'raw.githubusercontent.com/helmiau/openwrt-config/main/fix-xderm-libernet-gui')"

```

or you can use this scripts if above error
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-config/main/fix-xderm-libernet-gui" -P /root/ && chmod 777 /root/fix-xderm-libernet-gui && cd /root && bash fix-xderm-libernet-gui

```


### Install Speedtest by Ookla
for all devices
Connection needed ! scripts by [vitoharhari](https://github.com/vitoharhari/speedtest)
```sh
bash -c "$(curl -sko - 'https://raw.githubusercontent.com/vitoharhari/speedtest/main/install-speedtest')"

```


or you can use this scripts if above error
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/speedtest/main/install-speedtest" -P /root/ && chmod 777 /root/install-speedtest && cd /root && bash install-speedtest

```

[**notes**](links)
