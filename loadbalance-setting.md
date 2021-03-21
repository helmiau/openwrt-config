
## Setting up Load Balance with mwan3 (for all devices)
!!!if you don't understand English, use translate.google.com to translate it into Indonesian!!!

1. Install Load Balance package first if you don't have it
```sh
opkg update; opkg install mwan3 luci-app-mwan3
```

2. Interface creation & setting up firewall
- Plug in your modems
- Open LuCi IP Address -> Network -> Interface
- Create new interface by
```sh
- Add new interface
- Write interface name
- Protocol interface -> DHCP Client
- Cover the following interface -> ethX (X is number, according your plugged in modems)
```
- After creating new interface -> back to Network -> Interface
```sh
- Edit your written interface name
- Open Firewall Settings tab
- Create / Assign firewall-zone
- goto "unspecified -or- create:"
- Write new firewall name for selected interface
```
- After creating new interface -> back to Network -> Interface
```sh
- Edit your written interface name
- Open Firewall Settings tab
- Create / Assign firewall-zone
- goto "unspecified -or- create:"
- Write new firewall name for selected interface
```
Note : Repeat step 2 for every first new ethernet device connected and openwrt can't recognize it in Interface

- Open your LuCi IP Address -> Network -> Load Balancing
- Open Interface tab -> Delete all interface
- Open Member tab -> Delete all member
- Open Policies tab -> Delete all, except BALANCED
- Open Rules tab -> Delete all, except DEFAULT_RULE
- 

this load balance settings is created for vpn injection, even no internet inside modem, this setting will recognize it as online device
```sh
config interface 'ueth1'
	option enabled '1'
	option initial_state 'online'
	list track_ip '0.0.0.0'
	option family 'ipv4'
	option track_method 'ping'
	option reliability '1'
	option check_quality '0'
	option keep_failure_interval '1'
	option timeout '5'
	option interval '3'
	option failure_interval '3'
	option recovery_interval '1'
	option down '5'
	option up '5'
	option count '4'
	option size '24'
```
