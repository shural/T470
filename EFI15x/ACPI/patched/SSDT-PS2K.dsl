// tjl - add T460 identifier
DefinitionBlock ("", "SSDT", 2, "T470", "KBD", 0)
{
    External(\_SB.PCI0, DeviceObj)
    External(\_SB.PCI0.LPCB, DeviceObj)
    External(\_SB.PCI0.LPCB.KBD, DeviceObj)
    Scope (\_SB.PCI0.LPCB.KBD)
    {
        // Select specific items in VoodooPS2Controller
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
		//ClickPad works better with TouchPoint
                "RM,oem-table-id", "Thinkpad_ClickPad",
            })
        }
        // Overrides for settings in the Info.plist files)
        Name(RMCF, Package()
        {
            "Keyboard", Package()
            {
//                "ActionSwipeLeft",  "37 d, 21 d, 21 u, 37 u",
//                "ActionSwipeRight", "37 d, 1e d, 1e u, 37 u",

//            "ActionSwipeUp", "37 d, 7e d, 7e u, 37 u",
//            "ActionSwipeDown", "37 d, 7d d, 7d u, 37 u",

            "ActionSwipeLeft", "37 d, 7b d, 21 d, 21 u, 7b u, 37 u",
            "ActionSwipeRight", "37 d, 7c d, 21 d, 21 u, 7c u, 37 u",
                "SleepPressTime",   "1500",
                "Swap command and option", ">y",
                
                "Custom ADB Map", Package()
                {
                    Package(){},
                    "e037=64", // PrtSc=F13
                },
            },
            
            "Synaptics TouchPad", Package()
            //"Thinkpad_Trackpad", Package()
            {
		// Try to emulate Thinkpad_Trackpad set as 100
                "BogusDeltaThreshX", 100,
                "BogusDeltaThreshY", 100,
                "Clicking", ">y",

		// These two influence pad movement speed.
		"DivisorX", 1,
		"DivisorY", 1,

                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                //"ForcePassThrough", ">y",
                //"SkipPassThrough", ">y",
                "PalmNoAction When Typing", ">y",

                "SmoothInput", ">y",
                "UnsmoothInput", ">y",
                "Thinkpad", ">y",

                "EdgeBottom", 0,
                "FingerZ", 0x3F,
                "MaxTapTime", 100000000,
//		"MomentumScrollThreshY", 16,

		// This is for trackpoint movement speed
                "MouseMultiplierX", 6,
                "MouseMultiplierY", 6,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,

		// This controls the gap between fingers?
		"MultiFingerHorizontalDivisor", 4,
		"MultiFingerVerticalDivisor", 4,

		//
		"ScrollDeltaThreshX", 10,
		"ScrollDeltaThreshY", 10,
		"ScrollResolution", 800,

//		"Resolution", 3200,

		//Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                "TrackpointScrollYMultiplier", 1, 
                "TrackpointScrollXMultiplier", 1, 
            },
        })
    }
}
//EOF
