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
