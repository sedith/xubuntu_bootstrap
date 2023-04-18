#!/bin/bash

# drivers
echo "check recommended nvidia driver version:"
ubuntu-drivers devices

sudo apt-get install nvidia-driver-525

# prime selector
sudo apt-get install nvidia-prime
sudo prime-select nvidia

# gpu monitoring
sudo add-apt-repository ppa:flexiondotorg/nvtop
sudo apt install nvtop
