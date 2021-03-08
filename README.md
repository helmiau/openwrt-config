# OpenWrt Raspberry Pi 4 (Model B)
Additional setup for OpenWRT Raspberry Pi 4 (Model B)

# Source Firmware
This firmware is based on snapshot OpenWrt with additional packages from https://github.com/coolsnowwolf/lede [**notes**](links)
[**Firmware source**](https://github.com/SuLingGG/OpenWrt-Rpi)  |  [**Actions Build**](https://github.com/SuLingGG/OpenWrt-Rpi/actions/workflows/build-rpi4-lean-openwrt.yml)  |  [**Download Latest**](https://openwrt.cc/releases/targets/bcm27xx/bcm2711)

# AdGuardHome Installation
Need Internet Connection
```sh
wget --no-check-certificate "https://raw.githubusercontent.com/helmiau/openwrt-rpi4/main/adguardhome-install.sh" -P /root/ && cd /root && chmod 777 adguardhome-install.sh && bash adguardhome-install.sh
```

# Uninstall Unused Packages
[**notes**](links)
