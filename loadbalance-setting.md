
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

![firefox_GxKWIifcax](https://user-images.githubusercontent.com/20932301/111910616-b320db80-8a94-11eb-952c-cb86ea7a33c2.png)

- Create new Interface with ```Interface name inside Network -> Interface``` and create new one according your Interface name then click ```Add`` button

![firefox_VzkD9xY9oF](https://user-images.githubusercontent.com/20932301/111910693-02ffa280-8a95-11eb-989b-b52a4df08cef.png)

![image](https://user-images.githubusercontent.com/20932301/111910717-1a3e9000-8a95-11eb-80f0-649fb9caed6c.png)

- Scroll down and click ```Save & Apply```

![firefox_f84tTmbT6a](https://user-images.githubusercontent.com/20932301/111910767-4ce88880-8a95-11eb-8952-cbbe05ce7756.png)

- Open Member tab -> Delete all member

![firefox_AlSfIVZjMx](https://user-images.githubusercontent.com/20932301/111910805-76091900-8a95-11eb-9742-edf0a0c55a35.png)

- Create new Member and set Interface to Interface name above and create new one according your Interface name with metric 1 and weight 1

![firefox_qSFR797GCx](https://user-images.githubusercontent.com/20932301/111910856-9df87c80-8a95-11eb-9455-1ad706ffffc7.png)

![firefox_yTkoajEC0Q](https://user-images.githubusercontent.com/20932301/111910860-a2249a00-8a95-11eb-8ed2-753031aedd10.png)

![firefox_PMr8Lkiugr](https://user-images.githubusercontent.com/20932301/111910874-b8325a80-8a95-11eb-9117-9c2c4fa48452.png)

- Click ```Save & Apply```
- Open Policies tab -> Delete all, except BALANCED

![image](https://user-images.githubusercontent.com/20932301/111910913-db5d0a00-8a95-11eb-8f45-cd79f7fb67ec.png)

- Edit ```Balanced``` and set ```Member used``` to Member name above

![firefox_E8pWSnXAen](https://user-images.githubusercontent.com/20932301/111911004-47d80900-8a96-11eb-95bb-b13ee5e7d04c.png)

![firefox_qSn9AxASh9](https://user-images.githubusercontent.com/20932301/111911022-4c9cbd00-8a96-11eb-9c74-9c20605dec77.png)

- Click ```Save & Apply```
- Open Rules tab -> Delete all, except ```DEFAULT_RULE```

![image](https://user-images.githubusercontent.com/20932301/111911037-5a524280-8a96-11eb-93ac-d345d37c20c4.png)

- Edit ```DEFAULT_RULE```

![image](https://user-images.githubusercontent.com/20932301/111911074-88378700-8a96-11eb-8e0a-5bfb591bda1f.png)

![image](https://user-images.githubusercontent.com/20932301/111911084-938ab280-8a96-11eb-8602-8cd4417283fb.png)

![image](https://user-images.githubusercontent.com/20932301/111911090-98e7fd00-8a96-11eb-93c4-8b3f48fdbab6.png)

- Click ```Save & Apply```

##### Note : this load balance settings is created for vpn injection, even no internet, this setting will recognize modem as online device

- Edit ```etc/config/mwan3``` file using WinSCP or Terminal or Putty
- Find created Network Interface name before, i use ```ueth1``` for an example
- Edit config like this (copy and paste it! if it's differents, you can compare these scripts to your config
```sh
.........

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
	
...........
```
- Then copy and paste ```config interface 'interface_name'``` until end of line of scripts above
- Then edit it to other interface name
