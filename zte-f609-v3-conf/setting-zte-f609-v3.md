## Setting ZTE F609 V3 Build JUN 2020
###### also work for older series too with same hardware and firmware version 

For those who have experienced the ZTE F609 modem case that does not have a Bridge Connection mode, it is because the software version does not activate the Bridge Connection mode alias it is locked or locked from there.

Bridge mode itself is widely used to facilitate connection to the router so that no more setup / settings are needed on the client side. Because the point is that bridge mode is only to continue the connection, it can also strengthen the WiFi connection from the router side. Configuring the IP Address and DHCP server is done centrally on the router.

To outsmart if the F609 modem you are using doesn't have Bridge Connection mode , you can use itUser Configuration Management is available on this blog to activate Bridge Connection mode.

### Download configuration file
This [file configuration 1](https://raw.githubusercontent.com/helmiau/openwrt-config/main/zte-f609-v3-conf/User%20Configuration.bin) contains only bridge connection mode without VLAN.

This [file configuration 2](https://raw.githubusercontent.com/helmiau/openwrt-config/main/zte-f609-v3-conf/User%20Configuration%20with%20VLAN.bin), contains the bridge connection mode with VLANs. Consists of VLAN IDs 1 to 5. You can see the value or value of the VLAN below:
```sh
bridge-vlan-1 => VLAN ID = 1
bridge-vlan-2 => VLAN ID = 2
bridge-vlan-3 => VLAN ID = 3
bridge-vlan-4 => VLAN ID = 4
bridge-vlan-5 => VLAN ID = 5
```
The User Configuration files above is for version **3 (Hardware Version: V5.3)** . Because what we use **ZTE F609 version 3/5.3**

![bridge-connection-mode-zte-f609](https://user-images.githubusercontent.com/20932301/112091180-7c97ad80-8bc7-11eb-8ae5-d66c8a9366a7.jpg)

### Installation Steps
- Log in to the modem as admin by accessing the address http://192.168.1.1 (ZTE F609 modem default address).
Default login info :
```sh
Username : admin 
Password : Telkomdso123
```
- If you have successfully logged in, then enter the menu ```Administration >> System Management >> User Configuration Management``` to upload and restore the User Management settings that were downloaded above.
After entering the modem, then click the ```Restore Configuration``` button. The modem will restart in a few moments.

![user-configuration-management](https://user-images.githubusercontent.com/20932301/112091724-984f8380-8bc8-11eb-9b8b-ae80ccf0c1c9.jpg)

- Then log back into the modem.
##### For the IP Address, Username and Password for the configuration file above:
```
IP Address   : 192.168.1.1
SSID         : hotspot.nuslab.com
Username     : admin 
Password     : Telkomdso123
```

- Enter the menu ```Network >> WAN Configuration```.
There will be a **Connection Name** setting with the name: ***bridge only*** or ***bridge-vlan-1*** to ***bridge-vlan-5*** with the **Type: Bridge Connection** that was disabled which was made previously through the ***User Configuration Management*** above.

![image](https://user-images.githubusercontent.com/20932301/112093617-588a9b00-8bcc-11eb-94b7-032b260240ba.png)

- So that the LAN and WiFi ports can be used as Bridge mode, enter the menu ```Network >> WAN >> Port Binding``` to activate the port you want to bridge.
Until this step has been completed and the modem can be used for Bridge Connection mode .

![image](https://user-images.githubusercontent.com/20932301/112093781-a3a4ae00-8bcc-11eb-9509-21cb8eff67ab.png)

##### Note : I use above setting sample because LAN 3, 4 for output connection only

### Additional Settings for OpenWrt
- Go to ```LAN >> DHCP Server```
- Set ```LAN IP Address```, ```DNS Server1 IP Address```, and ```Default Gateway``` with your OpenWrt WebUi IP Address, and change the numbers after last dot with 20 or something else. this setting will allow you to access router WebUi under OpenWrt connection.
For an example : my OpenWrt router IP is 192.168.1.1, then i set the ```LAN IP Address``` with 192.168.1.20

![image](https://user-images.githubusercontent.com/20932301/112094315-a358e280-8bcd-11eb-8029-f686be18ec89.png)

- Then uncheck the ```Enable DHCP Server```
![image](https://user-images.githubusercontent.com/20932301/112094497-f6cb3080-8bcd-11eb-8312-107926fd31e4.png)

- Set ```DHCP Start IP Address```
![image](https://user-images.githubusercontent.com/20932301/112094528-05b1e300-8bce-11eb-95e9-198b4028399d.png)

- The click ```Submit``` button


[article source](https://www.nuslab.com/2020/01/solusi-zte-f609-tidak-ada-mode-bridge-connection.html)
