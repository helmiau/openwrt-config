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
