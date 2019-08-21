/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-RMCF.aml, Sun Aug  4 12:17:57 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000028F (655)
 *     Revision         0x02
 *     Checksum         0x5C
 *     OEM ID           "hack"
 *     OEM Table ID     "RMCF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "RMCF", 0x00000000)
{
    Device (RMCF)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (HELP, 0, NotSerialized)
        {
            Store ("VIDE laptop display card type. 0: (HD4600-) and low; 1: (HD5200-) and high; 2: (HD5300+)", Debug)
            Store ("IGPI overrides ig-platform-id or snb-platform-id", Debug)
            Store ("AUDL indicates audio layout-id for patched AppleHDA. Ones: no injection", Debug)
            Store ("BKLT indicates the type of backlight control. 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store ("LMAX indicates max for IGPU PWM backlight. Ones: Use default, other values must match framebuffer", Debug)
            Store ("MODE ThinkPad model", Debug)
            Store ("XPEE enables XHC.PMEE fix. 1: set XHC.PMEE to zero in _PTS when Arg0==5", Debug)
            Store ("XKEY Select the keyboard driver", Debug)
        }

        Name (VIDE, 0x02)
        Name (IGPI, Zero)
        Name (AUDL, Ones)
        Name (BKLT, One)
        Name (LMAX, Ones)
        Name (MODE, 0x70)
        Name (XPEE, One)
        Name (XKEY, Zero)
    }
}

