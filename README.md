# T470

Not working
* Thunderbolt USB-C/DP Digital Sound does not work. Quick workaround - close and open the lid.
* Headphone Jack noise. Layout-id set to 21, 22, 29, 30 works better but still noise after a few seconds.
* Thunderbolt USB extension does not work. Need to try IOElectiry.kext. Might need to add 8086:15C1 to info.plist

Working
* Storage extension. 
  * LITEON 11Plus works. Samsung 960Pro or Samsung 970 Pro/Evo.Evo Plus does not work. Patches at https://github.com/RehabMan/patch-nvme are not required.
* Fix Siri and iMessage and FaceTime - http://www.ituring.com.cn/article/274156
* External 4K display and HDMI digital audio work. RDM helps.
  * DVMT setting is already 128MB if Windows tells it right.
  * BIOS dump and modification. Download T470 BIOS from lenovo website, use UEFITool to search "Setup", found the DVMT-PreAlloc offset is 0xDF while default seems does not belong to any of the options (btw, the biggest option is 64M). EFI-Shell setup_var fails to change the value anyway.
  * Apply minstolenmem patch to KBL driver. Doing this, setting a larger stolen memory and fbmem would not crash the kernel during boot-up.
  * Force HiDPI https://github.com/xzhih/one-key-hidpi
  * USB-C/DP Port 5; HDMI Port 6
  * alc-layout-id = 3
* Power management https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/
  * Disable hiberation as hackintosh does not support it. Must do otherwise system autoreboot after sleep for a while.
  * Add SSDT-XCPM.dsl. As suggested in the link above, running ssdtPRgen.sh to create SSDT.aml is not required as long as plugin-type = 1 injected in SSDT-XCPM.dsl
  * Patch (with MaciASL) DSDL.dsl w/ x220 battery patch, and also the "Fix Mutex with non-zero SyncLevel". https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt. 
  * Fixed LED light keeps blinking after back from sleep. https://github.com/shmilee/T450-Hackintosh/issues/1
* Keyboard and touchpad
  * https://www.insanelymac.com/forum/topic/330440-beginners-guide-fix-keyboard-hot-keys-functional-keys/ - this one is for VoodooPS2Controller
  * Pick close source ApplePS2SmartTouchPad for keyboard and touchpad - better for multiple finger gestures
  * ACPI event captured and enabled for sound and backlight control. Fixed backlight key - F5/6. Q14/Q15. https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/
  * Touch screen works. Add "HS10"... to SSDT-UIAC.dsl
  * Trackpoint disabled - not ergo anyway
* Wireless and bluetooth (DW1560)
  * Bluetooth issue after sleep fixed. Note PID = 0x6417 (25623), VID = 0x0a5c (2652), as shown in USB device Tree. http://ryancuda.blogspot.com/2015/08/how-to-fix-bluetooth-after-sleep-on.html
  * Updated driver as BrcmFirmwareRepo and BrcmPatchRAM2. Seems working again even after sleep. Note BrcmFirmwareRepo is more memory efficient than BrcmFirmwareData, however it MUST be install to /Library/Extension on 10.11+ to prevent bluetooth disappear after sleep.
  * DW1830 is all out of stock.
  * After upgrading to Catalina 10.15.7, Bluetooth disappears again after sleep wake cycle. Instead of failing updating /System/Library/Extensions/IOBluetoothFamily.kext/Contents/PlugIns/BroadcomBluetoothHostControllerUSBTransport.kext/Contents/Info.plist and rebuilding cache (kext does not authenticate, omitting), copy the same IOBluetoothFamily to /L*/E*, and then patch kext plist in config.plist.

* Windows virtual machine. Fix Windows boot after ghost on both Paralles and VMWare.
  * http://www.xitongzhijia.net/xtjc/20170903/106026.html; and https://www.cnblogs.com/bdzwater/p/5516674.html. 




