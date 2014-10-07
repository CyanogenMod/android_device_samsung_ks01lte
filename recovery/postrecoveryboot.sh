#!/sbin/sh

# The partition to use is named "PARAM" and can be found by dumping the PIT.

# 0: charge
# 1: direct
# 2: recovery_enter
# 3: recovery_end
# 4: download_end

echo "0" > /sys/devices/msm_dwc3/f9200000.dwc3/gadget/lun0/cdrom
