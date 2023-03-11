#!/bin/sh
# Inisialisasi variable
# Penggunaaan:
#  - Download file ke "/root/rcrakit.sh"
#  - Jalankan perintah di terminal: "chmod +x /root/rcrakit.sh"
#  - Buka file rc.local, masukkan perintah "/root/rcrakit.sh eth1" di atas baris "exit 0"
#  - eth1 bisa di ubah ke interface tujuan kalian
#
interpes="$1"
ifc_restart_count=0

while true; do
    ip=$(ifconfig ${interpes} | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')
    if [ -n "$ip" ]; then
        ping -c3 8.8.8.8 >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Internet OK"
            logger "rcrakit.sh:: Internet OK"
            sleep 5
        else
            echo "No internet"
            logger "rcrakit.sh:: No internet"
            ip=$(ifconfig ${interpes} | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')
            if [ -n "$ip" ]; then
                echo "Modem terhubung tidak ada internet, restarting interface"
                logger "rcrakit.sh:: Modem terhubung tidak ada internet, restarting interface"
                sleep 1m
              #interface name disesuaikan dulu
                ifdown modem && ifup modem
                ifc_restart_count=$((ifc_restart_count+1))
                sleep 2m
            else
                echo "Modem tidak terhubung"
                logger "rcrakit.sh:: Modem tidak terhubung"
                sleep 3m
            fi
        fi
    else
        echo "Modem tidak terhubung"
        logger "rcrakit.sh:: Modem tidak terhubung"
        sleep 3m
    fi
    # Jika sudah restart interface sebanyak 2 kali, reboot dan tunggu 4 menit sebelum ke perintah 1
    if [ $ifc_restart_count -ge 2 ]
    then
        echo "Restarting modem..."
        logger "rcrakit.sh:: Restarting modem..."
     #ttyACM2 disesuaikan dulu
        echo "AT+CFUN=1,1" | atinout - /dev/ttyACM2 -
        sleep 4m
        ifc_restart_count=0
    fi
done