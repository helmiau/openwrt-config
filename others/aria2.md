## Install Aria2, Portainer, Emby, Samba and Adding HDD
Syarat & ketentuan. 
1. Wajib pakai firmware openwrt [dari sini](https://github.com/ophub/amlogic-s9xxx-openwrt).
2. Pilih yang ```s905x```
3. Sdcard wajib extend maksimal. Saya pakai sdcard 16gb. Saya extend ke 12gb. 

### Install Aria2
1. install package yang dibutuhkan 
```
opkg update && opkg install aria2 ariang
```
2. buat file config aria2
```
mkdir -p /etc/aria2
nano /etc/aria2/aria2.conf
```
3. paste config berikut
```
dir=/root/Downloads
enable-rpc=true
rpc-listen-port=6800
rpc-listen-all=true
check-integrity=false
file-allocation=none
log=/dev/null 
console-log-level=error
```
4. edit rc.local biar auto start ketika habis reboot ketik 
```
nano /etc/rc.local
lalu pastekan 
aria2c --conf-path=/etc/aria2/aria2.conf --daemon=true
```
taruh sebelum ```exit 0```

5. kemudian ```reboot```, untuk akses aria2 bisa melalui http://192.168.1.1/ariang

### Add Hdd
1. Untuk add hddnya, saya sudah buat hdd saya menjadi partisi ntfs, untuk add hdd bisa [ikuti cara disini](https://openwrt.org/docs/guide-user/storage/writable_ntfs)

### Install portainer
1. ketikkan perintah berikut di terminal
```
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
2. setelah selesai buka http://192.168.1.1:9000 set username & password, ketik next, pilih local lalu klik next. done

### Install Emby
1. ketikkan perintah berikut di terminal 
```
docker pull linuxserver/emby
```
2. login ke ```portainer```, lalu klik bagian ```local```

4. klik bagian ```stack```, klik ```add```, lalu isi nama portainernya, isi dengan nama ```emby```

bagian web editor, paste perintah dibawah ini, ganti ```/path``` dengan path dimana kamu save medianya. (sesuaikan sesuai kebutuhan)

```
---
version: "2.1"
services:
  emby:
    image: ghcr.io/linuxserver/emby
    container_name: emby
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Jakarta
      - UMASK_SET=<022>
    volumes:
      - /emby/data/config:/config
      - /path:/data/tvshows
      - /path:/data/movies
      - /path:/data/anime
    ports:
      - 8096:8096
      - 8920:8920
    restart: unless-stopped
 ```
 
 4. lalu klik ```deploy the stack```, lalu buka http://192.168.1.1:8096 silahkan seting embynya.


### Konfigurasi Samba bisa pakai cara ini 
 1. login ke luci, klik nas, klik network share.
 2. klik add, lalu isikan nama dan path yang akan di share, 
 3. save and apply. done

##### sumber artikel [disini](https://pastebin.com/raw/pLV5TfM2) dan [post fb disini](https://web.facebook.com/groups/443024392562406/permalink/1535742596623908/?comment_id=1543673359164165&reply_comment_id=1543696952495139&notif_id=1616556449348108&ref=notif&notif_t=group_comment_mention)
Penulis [Ikhsani Hidayat](https://web.facebook.com/ikhsaanh)
