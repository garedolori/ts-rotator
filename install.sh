#!/bin/bash

case $USER in
	"root" )
		chmod +x source/touch.sh
		mv source/touch.sh /usr/bin/ts-rotate
		mv entries/* /usr/share/applications/
		mv icons/* /usr/share/pixmaps/
		rm -r source entries icons
		echo -e "You successfuly instaled ts-rotate.\n Please execute 'mv rotate.desktop ~/.config/autostart/' as a normal user to make program runs on system statrup. Or you can do it later \n"
		echo -e "Please specify touch screen device with 'ts-rotate --device [device name]"
		echo "You can see your device using 'xinput' or 'touchscreen_calibrator --list'"
		rm install.sh
		exit 0
		;;
	*)
		echo "Error! You don't have permissions to execute this. Try again with sudo or just type 'sudo !!' "
	;;
esac