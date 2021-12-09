# yocto-assignments-base
Base repository for AESD Yocto assignments

# AESD Final Project - Mukta Darekar
This repository will contain Logitech C270 webcam interfacing with Raspberry-Pi using Yocto for capturing images.
For now, I have decided to go along with Raspberry-Pi, in future I may try to add Jetson-nano server. 

# Project Overview
[Link to Project Overview](https://github.com/cu-ecen-aeld/final-project-vido2373/wiki/Project-Overview)

# Schedule Overview
[Link to Schedule](https://github.com/cu-ecen-aeld/final-project-vido2373/wiki/Final-Project-Assignment-Schedule-Page)

# Source Code Organization
* [Yocto Repository for Server](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar.git) - Target build system related files for Socket Server
* [Buildroot Repository for Client](https://github.com/cu-ecen-aeld/final-project-vido2373.git) - Target build system related files for Socket Client
* [Shared Repository](https://github.com/cu-ecen-aeld/final-project-support-vishnu-mukta.git) - support files for both Server and Client

# Team Members
* Mukta Darekar (mukta.darekar@colorado.edu)
* Vishnu Dodballapur (vishnu.dodballapur@colorado.edu)

# Final Project Demo Overview
* [Server operation - Mukta Darekar](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/wiki/AESD-final-project-Demo)
* [Client Operation - Vishnu Dodballapur](https://github.com/cu-ecen-aeld/final-project-vido2373/wiki/Vishnu's-Final-Project-Video)

# Project Progress

## Future work
* For server trying on Jetson nano by building Yocto image for it with the same code

## Sprint 4
* Modified socket code to combine the two capturing image and transfer using socket communication - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/8)
* Refer [system flow](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/blob/master/system%20flow.png) used for each image capture and transfer
* Added extra features like capturing grayscale image, color image and edge detected image - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/9)

## Sprint 3
* Modified Yocto image to add image capture code and socket server code through meta layers - refer [commit](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/commit/254efb31974cf43cf25be297e130285680224c7f)
* For server code - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/6) - refer [code](https://github.com/cu-ecen-aeld/final-project-support-vishnu-mukta/tree/master/socket_server)
* For image capture code and script for image compression - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/7) - refer [code](https://github.com/cu-ecen-aeld/final-project-support-vishnu-mukta/tree/master/capture_image) 

## Sprint 2
* Added Ethernet, Wifi and SSH supports - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/5)
* Added image viewer and camera related packages - fbi, fbgrab, imagemagick, ffmpeg, gstreamer 
* Learned how to add packages in Yocto image - refer [commit](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/commit/e68af3263fcdad0d580c4ec18337356dad5e786d)

## Sprint 1
* Tried Working on Jetson nano - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/4)
* Switched to Raspberry-Pi 4 for server device
* Built basic Yocto image for the same - refer [issue](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/issues/1) - refer [commit](https://github.com/cu-ecen-aeld/final-project-MuktaDarekar/commit/3a6ef61d323d1b5b83e20ce6c261d1a12d3d55b4)

