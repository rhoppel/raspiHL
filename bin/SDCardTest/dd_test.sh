#!/bin/bash
sudo dd if=/dev/zero of=/home/pi/test bs=8k count=50k conv=fsync; sudo rm -f /home/pi/test

