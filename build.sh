#!/bin/bash
# Script to build image for qemu.
# Author: Siddhant Jajoo.
# Modified by: Mukta Darekar
# Reference for Wifi: https://raspberrypi.stackexchange.com/questions/48351/configure-wlan-for-raspberrypi3-using-image-created-with-yocto
# https://medium.com/swlh/build-and-use-gstreamer-with-yocto-project-and-beaglebone-black-217d6822476d

git submodule init
git submodule sync
git submodule update

# local.conf won't exist until this step on first execution
source poky/oe-init-build-env

CONFLINE="MACHINE = \"raspberrypi4\""

cat conf/local.conf | grep "${CONFLINE}" > /dev/null
local_conf_info=$?

if [ $local_conf_info -ne 0 ];then
	echo "Append ${CONFLINE} in the local.conf file"
	echo ${CONFLINE} >> conf/local.conf
	
else
	echo "${CONFLINE} already exists in the local.conf file"
fi

#Create image of the type rpi-sdimg
IMAGE="IMAGE_FSTYPES = \"wic.bz2\""

cat conf/local.conf | grep "${IMAGE}" > /dev/null
local_image_info=$?

if [ $local_image_info -ne 0 ];then 
    echo "Append ${IMAGE} in the local.conf file"
	echo ${IMAGE} >> conf/local.conf
else
	echo "${IMAGE} already exists in the local.conf file"
fi

#Set GPU memory as minimum
MEMORY="GPU_MEM = \"16\""

cat conf/local.conf | grep "${MEMORY}" > /dev/null
local_memory_info=$?

if [ $local_memory_info -ne 0 ];then
    echo "Append ${MEMORY} in the local.conf file"
	echo ${MEMORY} >> conf/local.conf
else
	echo "${MEMORY} already exists in the local.conf file"
fi

#Add wifi support
DISTRO_F="DISTRO_FEATURES:append = \" wifi\""

cat conf/local.conf | grep "${DISTRO_F}" > /dev/null
local_distro_info=$?

if [ $local_distro_info -ne 0 ];then
    echo "Append ${DISTRO_F} in the local.conf file"
	echo ${DISTRO_F} >> conf/local.conf
else
	echo "${DISTRO_F} already exists in the local.conf file"
fi

#add firmware support and wifi details, add camera related package support
IMAGE_ADD="IMAGE_INSTALL:append = \"linux-firmware-rpidistro-bcm43430 
							  v4l-utils python3 ntp wpa-supplicant 
							  fbida fbgrab ffmpeg imagemagick gstreamer1.0 
            				  gstreamer1.0-plugins-good gstreamer1.0-plugins-base  
            				  gstreamer1.0-plugins-ugly gstreamer1.0-libav gst-player
            				  gstreamer1.0-meta-base gst-examples gstreamer1.0-rtsp-server\""

cat conf/local.conf | grep "${IMAGE_ADD}" > /dev/null
local_imgadd_info=$?

if [ $local_imgadd_info -ne 0 ];then
    echo "Append ${IMAGE_ADD} in the local.conf file"
	echo ${IMAGE_ADD} >> conf/local.conf
else
	echo "${IMAGE_ADD} already exists in the local.conf file"
fi

#Licence
LICENCE="LICENSE_FLAGS_WHITELIST = \"commercial\""
#this is required so that gstreamer1.0-plugins-ugly can be added to the image
LICENSE:append = " commercial_gstreamer1.0-plugins-ugly commercial_mpg123"

cat conf/local.conf | grep "${LICENCE}" > /dev/null
local_licn_info=$?

if [ $local_licn_info -ne 0 ];then
    echo "Append ${LICENCE} in the local.conf file"
	echo ${LICENCE} >> conf/local.conf
else
	echo "${LICENCE} already exists in the local.conf file"
fi

#SSH
IMAGE_F="IMAGE_FEATURES += \"ssh-server-openssh tools-sdk tools-debug\""

cat conf/local.conf | grep "${IMAGE_F}" > /dev/null
local_imgf_info=$?

if [ $local_imgf_info -ne 0 ];then
    echo "Append ${IMAGE_F} in the local.conf file"
	echo ${IMAGE_F} >> conf/local.conf
else
	echo "${IMAGE_F} already exists in the local.conf file"
fi

#Add any packages needed here
ADD_PACK="CORE_IMAGE_EXTRA_INSTALL += \"capture server\""

cat conf/local.conf | grep "${ADD_PACK}" > /dev/null
local_pack_info=$?

if [ $local_pack_info -ne 0 ];then
    echo "Append ${ADD_PACK} in the local.conf file"
	echo ${ADD_PACK} >> conf/local.conf
else
	echo "${ADD_PACK} already exists in the local.conf file"
fi


bitbake-layers show-layers | grep "meta-oe" > /dev/null
layer_oe_info=$?

if [ $layer_oe_info -ne 0 ];then
	echo "Adding meta-oe layer"
	bitbake-layers add-layer ../meta-openembedded/meta-oe
else
	echo "meta-oe layer already exists"
fi


bitbake-layers show-layers | grep "meta-python" > /dev/null
layer_python_info=$?

if [ $layer_python_info -ne 0 ];then
	echo "Adding meta-python layer"
	bitbake-layers add-layer ../meta-openembedded/meta-python
else
	echo "meta-python layer already exists"
fi


bitbake-layers show-layers | grep "meta-networking" > /dev/null
layer_networking_info=$?

if [ $layer_networking_info -ne 0 ];then
	echo "Adding meta-networking layer"
	bitbake-layers add-layer ../meta-openembedded/meta-networking
else
	echo "meta-networking layer already exists"
fi


bitbake-layers show-layers | grep "meta-raspberrypi" > /dev/null
layer_info=$?

if [ $layer_info -ne 0 ];then
	echo "Adding meta-raspberrypi layer"
	bitbake-layers add-layer ../meta-raspberrypi
else
	echo "meta-raspberrypi layer already exists"
fi


bitbake-layers show-layers | grep "meta-capture" > /dev/null
layer_capture_info=$?

if [ $layer_capture_info -ne 0 ];then
	echo "Adding meta-capture layer"
	bitbake-layers add-layer ../meta-capture
else
	echo "meta-capture layer already exists"
fi


bitbake-layers show-layers | grep "meta-server" > /dev/null
layer_server_info=$?

if [ $layer_server_info -ne 0 ];then
	echo "Adding meta-server layer"
	bitbake-layers add-layer ../meta-server
else
	echo "meta-server layer already exists"
fi

set -e
bitbake core-image-base
