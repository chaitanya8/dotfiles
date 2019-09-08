```udevadm info --path=/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1/sound/card2/controlC2

udevadm info /dev/snd/by-id/usb-FiiO_FiiO_USB_DAC_K1-01

udevadm info --name=snd/controlC2

P: /devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1/sound/card2/controlC2
N: snd/controlC2
S: snd/by-id/usb-FiiO_FiiO_USB_DAC_K1-01
S: snd/by-path/pci-0000:00:14.0-usb-0:3:1.1
E: DEVLINKS=/dev/snd/by-id/usb-FiiO_FiiO_USB_DAC_K1-01 /dev/snd/by-path/pci-0000:00:14.0-usb-0:3:1.1
E: DEVNAME=/dev/snd/controlC2
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1/sound/card2/controlC2
E: ID_BUS=usb
E: ID_MODEL=FiiO_USB_DAC_K1
E: ID_MODEL_ENC=FiiO\x20USB\x20DAC\x20K1
E: ID_MODEL_ID=100c
E: ID_PATH=pci-0000:00:14.0-usb-0:3:1.1
E: ID_PATH_TAG=pci-0000_00_14_0-usb-0_3_1_1
E: ID_REVISION=0001
E: ID_SERIAL=FiiO_FiiO_USB_DAC_K1
E: ID_TYPE=audio
E: ID_USB_DRIVER=snd-usb-audio
E: ID_USB_INTERFACES=:030000:010100:010200:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=FiiO
E: ID_VENDOR_ENC=FiiO
E: ID_VENDOR_ID=262a
E: MAJOR=116
E: MINOR=13
E: SUBSYSTEM=sound
E: TAGS=:uaccess:
E: USEC_INITIALIZED=15187341013
```

#Rules in /etc/udevd/rules.d
SUBSYSTEM=="usb", ACTION=="add", ENV{ID_MODEL}=="FiiO_USB_DAC_K1",  RUN+="/bin/plugin_dac.sh"

SUBSYSTEM=="usb", ACTION=="remove", ENV{ID_MODEL}=="FiiO_USB_DAC_K1", RUN+="/bin/device_removed.sh"

SUBSYSTEM=="usb", ACTION=="remove", ENV{DEVPATH}=="/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1/sound/card2/controlC2", RUN+="/bin/remove_dac.sh"

