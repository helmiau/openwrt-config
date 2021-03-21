
## Setting up Load Balance with mwan3 (for all devices)
!!!if you don't understand English, use translate.google.com to translate it into Indonesian!!!

1. Install Load Balance package first if you don't have it (use terminal)
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
![image](https://user-images.githubusercontent.com/20932301/111909707-f0836a00-8a90-11eb-869a-c6d4eb37c84f.png)

- After creating new interface -> back to Network -> Interface
```sh
- Edit your written interface name
- Open Firewall Settings tab
- Create / Assign firewall-zone
- goto "unspecified -or- create:"
- Write new firewall name for selected interface
```
![image](https://user-images.githubusercontent.com/20932301/111909798-3f310400-8a91-11eb-8ed4-c53115d064a6.png)

- Open your LuCi IP Address -> Network -> Firewall
- Find new firewall you create before, then edit it
```sh
Zone (this is firewall name)
- Input 		-> Reject
- Output 		-> Accept
- Forward 		-> Reject
- Masquerading		-> Checked
- MSS clamping		-> Checked
- Covered networks 	-> interface name

Inter-Zone Forwarding
- Allow forward from source zones 	-> lan
```
Note : Repeat step 2 for every first new ethernet device connected and openwrt can't recognize it in Interface


3. Setting up loadbalance / mwan3
- Open your LuCi IP Address -> Network -> Load Balancing
- Open Interface tab -> Delete all interface
- Create new Interface with ```Interface name inside Network -> Interface``` and create new one according your Interface name then click ```Add`` button
- Open Member tab -> Delete all member
- Create new Member and set Interface to Interface name above and create new one according your Interface name with metric 1 and weight 1
- Open Policies tab -> Delete all, except BALANCED
- Edit ```Balanced``` and set ```Member used``` to Member name above
![image](https://user-images.githubusercontent.com/20932301/111909663-c7fb7000-8a90-11eb-9c1c-ca7b94b96070.png)

- Open Rules tab -> Delete all, except DEFAULT_RULE

Note : this load balance settings is created for vpn injection, even no internet, this setting will recognize modem as online device
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
