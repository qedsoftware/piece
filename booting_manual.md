# PIECE booting manual

## How PIECE works
PIECE is a bootable USB pendrive. It contains a full operating system.

## User credentials
- username: `student`
- password: `student`


## Booting on PC
- Plug PIECE in
- Enter your computer's BIOS. To enter BIOS press `<F2>`, `<F12>`, `<ESC>` or `<DELETE>`
  when the manufacturer's logo shows up, right after power-on.
  Look for text similar to _"Press X to enter setup"_ on the screen
- For modern PCs ensure that Secure Boot option is disabled in BIOS
- For computers with USB3.0 ensure that XHCI setting is enabled.
  Sometimes called XHCI Pre-Boot Mode or XHCI Hand-off
- Open boot order settings and ensure that USB drive option is on the top of the list
- Save and reboot
- Your computer should now boot PIECE correctly


## Booting on Mac
- Plug PIECE in
- Right after the booting chime press and hold the Option key
- Release the Option key when a list of boot options is shown
- Select the USB drive from the list and press enter
- Your computer should now boot PIECE correctly


## Booting in VirtualBox
- Enable virtualization options in the BIOS if necessary
- Install VirtualBox on your computer
- Plug PIECE-VM in (PIECE-VM is a different pendrive setup!)
- Open VirtualBox
- Select _File_ -> _Import Appliance_
- Find the `.ovf` file located on the pendrive
- Open settings of the imported VM and increase _Base Memory_
- Start the VM
- Optionally, make the VM display full-screen
- You now have PIECE running in a VM

## Troubleshooting
- Q: How to boot PIECE on a Chromebook

  A: Chromebooks do not support booting from USB. Use the VirtualBox method

- Q: I have an Nvidia GPU and I can only see a black screen/terminal login after boot

  A: After booting, when a countdown is shown in the upper left corer of the screen press `<ESC>`.
     This opens the GRUB menu. Navigate to the second option called _"Ubuntu Nvidia GTX 8XX, 9XX workaround"_
     and press enter.
