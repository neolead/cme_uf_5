# CME UF MIDI Keyboard Driver - Windows 11

## Supported Devices
- CME UF5, UF6, UF7, UF8, UF50, UF60, UF70
- USB VID: 7104 / PID: 2202

## Files
- `esimidiport.inf` - Driver INF (Windows 11 x64)
- `ESIMidiport.sys` - WDM kernel-mode MIDI driver
- `amd64wdm.cat` - Driver catalog (signature)
- `install.cmd` - Automated installer (run as Admin)

## Installation

### Method 1: Automated (Recommended)
1. Connect your CME UF keyboard via USB
2. Right-click `install.cmd` → "Run as administrator"
3. Wait for "SUCCESS" message
4. Reconnect keyboard if needed

### Method 2: Manual via Device Manager
1. Connect CME keyboard (will show as unknown device)
2. Open Device Manager (Win+X → Device Manager)
3. Find unknown device under "Other devices" or "Sound, video and game controllers"
4. Right-click → Update driver → Browse my computer
5. Point to this folder
6. Click Next and accept unsigned driver warning

### Method 3: Command Line
```cmd
pnputil /add-driver esimidiport.inf /install
```

## Notes
- **Windows 11 requires test signing mode** for unsigned drivers:
  ```cmd
  bcdedit /set testsigning on
  ```
  Then reboot. After driver is working, you can turn it off:
  ```cmd
  bcdedit /set testsigning off
  ```
- The driver exposes 8 MIDI ports (CME UF MIDI 1-8)
- Based on ESI Midiport WDM driver v1.3 with VID/PID patched for CME

## Troubleshooting
- If driver won't load: Enable test signing mode (see above)
- If device not recognized: Check USB cable, try different port
- If no MIDI in DAW: Ensure "CME UF MIDI 1" appears in Windows MIDI settings
