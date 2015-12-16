#!/bin/bash

dir=~/.touch

if [[ ! -d $dir ]]; then
	mkdir ~/.touch
	touch touch.conf
	echo "Device:none" >> ~/.touch/touch.conf
	echo "Rotation:normal" >> ~/.touch/touch.conf
	echo "Matrix:1 0 0 0 1 0 0 0 1" >> ~/.touch/touch.conf
fi

case $1 in
	"--device" )
	case $2 in
		"" )
			echo "please specify the device! Type 'xinput' and find your touch device then try again with $0 $1 [device name]"
			exit 1
			;;
		*)
			sed -i "/Device/d" ~/.touch/touch.conf
			echo "Device:$2" >> ~/.touch/touch.conf
			exit 0
			;;
			
	esac
		;;
esac
	

device=$(cat ~/.touch/touch.conf | grep Device | cut -f 2 -d :)

case $device in
	"none" )
		echo "please specify the device! Type xinput and find your touch device then try again with $0 $1 [device name]"
		exit 1
		;;
esac

rotation=$(cat ~/.touch/touch.conf | grep Rotation | cut -f 2 -d :)


matrix=$(cat ~/.touch/touch.conf | grep Matrix | cut -f 2 -d :)

devId=$(xinput | grep $device | cut -f 2 | cut -f 2 -d =)


case $1 in
"" )
	xrandr -o $rotation
	xinput set-prop $devId 'Coordinate Transformation Matrix' $matrix
	exit 0 
	;;
"right" )
	xrandr -o right
	sed -i "/Rotation/d" ~/.touch/touch.conf
	echo "Rotation:right" >> ~/.touch/touch.conf
	xinput set-prop $devId 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
	sed -i "/Matrix/d" ~/.touch/touch.conf
	echo "Matrix:0 1 0 -1 0 1 0 0 1" >> ~/.touch/touch.conf
	exit 0 
	;;
"left" )
	xrandr -o left
	sed -i "/Rotation/d" ~/.touch/touch.conf
	echo "Rotation:left" >> ~/.touch/touch.conf
	xinput set-prop $devId 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
	sed -i "/Matrix/d" ~/.touch/touch.conf
	echo "Matrix:0 -1 1 1 0 0 0 0 1" >> ~/.touch/touch.conf
	exit 0 
	;;
"normal" )
	xrandr -o normal
	sed -i "/Rotation/d" ~/.touch/touch.conf
	echo "Rotation:normal" >> ~/.touch/touch.conf
	xinput set-prop $devId 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
	sed -i "/Matrix/d" ~/.touch/touch.conf
	echo "Matrix:1 0 0 0 1 0 0 0 1" >> ~/.touch/touch.conf
	exit 0 
	;;
* )
	echo "invalid option! Usage $0 [ right | left | normal | reverse | --device [device name]]"
	exit 1
	;;
esac
