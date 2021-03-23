## Setting ZTE F609 V3 Build JUN 2020 (also work for older series too)
For those who have experienced the ZTE F609 modem case that does not have a Bridge Connection mode, it is because the software version does not activate the Bridge Connection mode alias it is locked or locked from there.

Bridge mode itself is widely used to facilitate connection to the router so that no more setup / settings are needed on the client side. Because the point is that bridge mode is only to continue the connection, it can also strengthen the WiFi connection from the router side. Configuring the IP Address and DHCP server is done centrally on the router.

To outsmart if the F609 modem you are using doesn't have Bridge Connection mode , you can use itUser Configuration Management is available on this blog to activate Bridge Connection mode.

You can download the user configuration file below:

This [file](https://raw.githubusercontent.com/helmiau/openwrt-config/main/zte-f609-v3-conf/User%20Configuration.bin) contains only bridge connection mode without VLAN.

This [file](https://raw.githubusercontent.com/helmiau/openwrt-config/main/zte-f609-v3-conf/User%20Configuration%20with%20VLAN.bin), contains the bridge connection mode with VLANs. Consists of VLAN IDs 1 to 5. You can see the value or value of the VLAN below:
```sh
bridge-vlan-1 => VLAN ID = 1
bridge-vlan-2 => VLAN ID = 2
bridge-vlan-3 => VLAN ID = 3
bridge-vlan-4 => VLAN ID = 4
bridge-vlan-5 => VLAN ID = 5
```
The User Configuration files above is for version ****[3 (Hardware Version: V5.3)]**** . Because what we use **[ZTE F609 version 3/5.3]**
![bridge-connection-mode-zte-f609](https://user-images.githubusercontent.com/20932301/112091180-7c97ad80-8bc7-11eb-8ae5-d66c8a9366a7.jpg)

