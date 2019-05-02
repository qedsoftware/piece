# PIECE

Portable Integrated Environment for Computing Education

## Requirements
- linux machine
- PIECE disk image
  - [download](https://github.com/qedsoftware/piece/releases/latest) the latest release
  - or [build from source](#building-from-source)
- USB flash drive
  - at least 16GB of space
  - support for USB 3.0 will speed up installation and the system

## Installation
1. Clone this repository

        git clone https://github.com/qedsoftware/piece.git

2. If you downloaded the file from github, unzip it and place it in the `piece` directory

3. Connect the flash drive to the computer

4. Find the flash drive device name. Example using `lsblk`:

        $ lsblk
        NAME          MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
        sda             8:0    0 119,2G  0 disk  
        ├─sda1          8:1    0   100M  0 part  
        ├─sda2          8:2    0   200M  0 part  /boot
        └─sda3          8:3    0 118,9G  0 part  
        sdb             8:16   1  14,3G  0 disk  
        └─sdb1          8:17   1  14,3G  0 part  
    
    In the example it's `/dev/sdb`

5. Burn the image to the pendrive. In the `piece` directory run

        ./burn_to_drive.sh DRIVE_NAME

    For the example it would be `./burn_to_drive.sh /dev/sdb`
    

## Booting PIECE
See [the booting manual](booting_manual.md)

## Building from source
### Requirements
- VirtualBox
- Ansible
- Packer.io
- sshpass
- Decent internet connection
- 30GB of disk space


### Building the image

    packer build piece.json

### Extracting the drive image

    ./extract_drive_image.sh
    
This results in the `piece.img` file

You can now [install PIECE](#installation)

## Development
### Modifying OS installation parameters
See `http/preseed.cfg`

Consult:

    https://help.ubuntu.com/lts/installation-guide/amd64/apbs02.html

and

    https://help.ubuntu.com/lts/installation-guide/amd64/apbs04.html

## Licensing

Copyright (c) 2019 Quantitative Engineering Design (https://qed.ai). All rights reserved.

This software is distributed under The MIT License (MIT), which is included in LICENSE.
