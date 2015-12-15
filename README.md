# ts-rotator

Author: GaredOlori

This project is a simple bash script that makes touch screen rotation works normally.
It contains script itself and few desctop entries for easy access and on boot startup.

Install: download and unpack archive and execute install.sh file as root in terminal.

By reason of devices not offen has "touch screen" in its name (espacialy for chineese), You need to setup script

Setup script: after successfull instalation move file rotate.desktop to ~/.config/autostart to make script startup on user login. You must specify the touch device. Execute ' ts-rotate --device [device name]' in teminal. You can see list of Your devices using xinput or 'xinput_calibrator --list' (need xinput-calibrator to be installed).

After insall and setup You can find 3 new desktop entries in Your applications menu (in graphics and system folders). They will help You rotate your screen without terminal =) 

If You have any comments or suggestions, please, contact me at garedolori@gmail.com
