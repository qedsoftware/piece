# QED PIECE

PIECE = Portable Integrated Environment for Computing Education
or
PIECE = Portable InExpensive Computing Environment


## Requirements
- VirtualBox
- Ansible
- Packer.io
- sshpass
- Decent internet connection
- 20GB free disk space


## Building the image

    packer build piece.json


## Extracting the drive image

    ./extract_drive_image.sh


## Burning the image to a pendrive
Find the pendrive name:

    $ lsblk
    NAME          MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
    sda             8:0    0 119,2G  0 disk  
    ├─sda1          8:1    0   100M  0 part  
    ├─sda2          8:2    0    35G  0 part  
    ├─sda3          8:3    0     1K  0 part  
    ├─sda5          8:5    0     9G  0 part  
    │ └─swap      254:1    0     9G  0 crypt [SWAP]
    ├─sda6          8:6    0     3G  0 part  
    ├─sda7          8:7    0   200M  0 part  /boot
    └─sda8          8:8    0    72G  0 part  
      └─cryptroot 254:0    0    72G  0 crypt /var
    sdb             8:16   1  14,3G  0 disk  
    └─sdb1          8:17   1  14,3G  0 part  
    
In the example it's `/dev/sdb`

    ./burn_to_drive.sh DRIVE_NAME
    
For the example it would be `./burn_to_drive.sh /dev/sdb`


## Making changes
### Modifying OS installation parameters
See `http/preseed.cfg`.
Consult:

    https://help.ubuntu.com/lts/installation-guide/amd64/apbs02.html

and

    https://help.ubuntu.com/lts/installation-guide/amd64/apbs04.html

