# cme_uf_5

Midi keyboard CME UF6, UF5, UF8, UF7 ,UF50, UF60, UF70 driver fix.
Checked with windows 7 x64
( you can modify same way for windows 10.. i think...)
in folder "\10\ESIMidiport_v1.50_setup.exe" you need to run, and before
installing catch file in windows %TEMP% folder...than change vid-pid

(For windows 7..win10 not checked)
First variant:

Unpack folder to specific place
Run force_install.cmd , it will install patched driver.


Second variant:

1. Unpack folder to specific place
2. Install original driver of ESIMidiport_v1.30_setup.exe 
Catch drivers in %TEMP% folder, replace in inf 
file string ( in archive its already fixed ):

;;;;This is default string for 49 keyboard mini by cme-esi
PNPID_DEVICE_18			="USB\VID_2702&PID_2702"

;;;;This is CME UF-5
PNPID_DEVICE_18			="USB\VID_7104&PID_2202"


Give then driver to unknown midi =)
have fun
if any:write me ccldance@gmail.com
