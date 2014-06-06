#!/system/bin/sh

if [ ! -f /data/misc/audio/mbhc.bin ]; then
	mount -o remount,rw /system
	mkdir -p /data/misc/audio
	chmod 770 /data/misc/audio
	chown media:audio /data/misc/audio
	cp /system/etc/wcd9320_mbhc.bin /data/misc/audio/mbhc.bin
	chown media:audio /data/misc/audio/mbhc.bin
	chmod 700 /data/misc/audio/mbhc.bin
	mkdir -p /system/etc/firmware/wcd9320
	rm /system/etc/firmware/wcd9320/wcd9320_mbhc.bin
	ln -s /data/misc/audio/mbhc.bin /system/etc/firmware/wcd9320/wcd9320_mbhc.bin
	mount -o remount,ro /system
fi

if [ ! -f /data/misc/audio/wcd9320_anc.bin ]; then
	mount -o remount,rw /system
	mkdir -p /data/misc/audio
	chmod 770 /data/misc/audio
	chown media:audio /data/misc/audio
	cp /system/etc/wcd9320_anc.bin /data/misc/audio/
	chown media:audio /data/misc/audio/wcd9320_anc.bin
	chmod 700 /data/misc/audio/wcd9320_anc.bin
	mkdir -p /system/etc/firmware/wcd9320
	rm /system/etc/firmware/wcd9320/wcd9320_anc.bin
	ln -s /data/misc/audio/wcd9320_anc.bin /system/etc/firmware/wcd9320/wcd9320_anc.bin
	mount -o remount,ro /system
fi
