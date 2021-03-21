
## Setting up Load Balance with mwan3 (for all devices)
!!!if you don't understand English, use translate.google.com to translate it into Indonesian!!!

1. Install Load Balance package first if you don't have it (use terminal)
```sh
opkg update; opkg install mwan3 luci-app-mwan3
```


#### 2. Interface creation & setting up firewall
- Plug in your modems
- Open LuCi IP Address -> Network -> Interface
- Add new interface

![firefox_za5Llw3UvC](https://user-images.githubusercontent.com/20932301/111910005-1e1ce300-8a92-11eb-8b90-c6619f65fb0d.png)

- Write interface name

![image](https://user-images.githubusercontent.com/20932301/111910024-34c33a00-8a92-11eb-9060-41914ff46773.png)

- Protocol interface -> DHCP Client

![image](https://user-images.githubusercontent.com/20932301/111910047-502e4500-8a92-11eb-99d1-de131d18a816.png)

- Cover the following interface -> ethX (X is number, according your plugged in modems)

![image](https://user-images.githubusercontent.com/20932301/111910058-5de3ca80-8a92-11eb-944d-945b18310fd8.png)

- After creating new interface -> back to Network -> Interface
- Edit your written interface name

![firefox_PiwSOtnqMq](https://user-images.githubusercontent.com/20932301/111910090-8cfa3c00-8a92-11eb-95aa-6e3a863ebf2c.png)

- Open Firewall Settings tab

![image](https://user-images.githubusercontent.com/20932301/111910105-9b485800-8a92-11eb-8acb-5b182681d1b8.png)

- Create / Assign firewall-zone
- goto "unspecified -or- create:"
- Write new firewall name for selected interface

![image](https://user-images.githubusercontent.com/20932301/111910119-aac7a100-8a92-11eb-89b6-fe43356ea553.png)

- Open your LuCi IP Address -> Network -> Firewall

![firefox_PQ3VvRmdDE](https://user-images.githubusercontent.com/20932301/111910192-efebd300-8a92-11eb-813d-55b83ca2685f.png)

- Scroll down and find new firewall you create before, then edit it

![image](https://user-images.githubusercontent.com/20932301/111910230-14e04600-8a93-11eb-8a03-f1822e7d2607.png)

- Find this scroll bar, and slide right until ```Edit``` button appeared

![firefox_uNHJC6p6W6](https://user-images.githubusercontent.com/20932301/111910281-5113a680-8a93-11eb-951d-db6ac7e61cb5.png)

- Click ```Edit``` button

![image](https://user-images.githubusercontent.com/20932301/111910293-5e309580-8a93-11eb-9f7f-0ac9e30daffe.png)

Zone (this is firewall name)
- Input 		-> Reject
- Output 		-> Accept
- Forward 		-> Reject
- Masquerading		-> Checked
- MSS clamping		-> Checked
- Covered networks 	-> interface name

![image](https://user-images.githubusercontent.com/20932301/111910313-756f8300-8a93-11eb-9dc8-f81463ceeedd.png)

![image](https://user-images.githubusercontent.com/20932301/111910325-7ef8eb00-8a93-11eb-89a5-a83a1891705e.png)

Inter-Zone Forwarding

![image](https://user-images.githubusercontent.com/20932301/111910338-8cae7080-8a93-11eb-9d0c-0e1c72054d02.png)

- Allow forward to destination zones 	-> dont select anything
- Allow forward from source zones 	-> lan

![image](https://user-images.githubusercontent.com/20932301/111910345-93d57e80-8a93-11eb-92b1-5499a9b201f9.png)

##### Note : Repeat step 2 for every first new ethernet device connected and openwrt can't recognize it in Interface


#### 3. Setting up loadbalance / mwan3
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
