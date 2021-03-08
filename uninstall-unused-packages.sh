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
