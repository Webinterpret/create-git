## Installation

### SHC (Required)   
1. For Debian family [Debian, Ubuntu, Xubuntu, Lubuntu, etc.]


    sudo add-apt-repository -y ppa:neurobin/ppa
    sudo apt-get update
    sudo apt-get install shc

2. For ArchLinux family [ArchLinux, Manjaro, etc.]

   
    pacman -S shc

Alternative by `yay` or alias for yay `ya`:
    
    yay -S shc
    ya -S shc


3. CentOS & Fedora family [CentOS, Fedora, etc.] 

   
    yum install -y epel-release shc

X. From source:

Download the latest version of shc
Open a terminal and changeg directory to your downloads directory, or wherever the tar file is.
Extract it:
    
    $ tar xvfz shc-4.0.3.tar.gz  # depending on version

Then do the installation:
    
    $ ./configure
    ...
    $ make
    ...
    $ sudo make install
    ...

### [Back to README](../README.md)