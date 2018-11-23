## Synopsis

Create a Raspberry Pi/PI USER Template for use by all RaspberryPi modules at the HoppelLodge.  Support includes full support for Node-RED.

## Code Example

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Motivation

I would like a well thought out PI user account to ease maitenance of multiple RaspberryPi modules. It is desireable to have a system which can be cloned to support any application

## Installation

RESPOSITORY: Bitbucket

## Features
- Debian/Raspian base
- Node-red
- extensive tool in .bash_aliases
  - ssh tools
  - backup tools
- bin [bash shell commands]
  - assign_hostname.sh [assigns hostname based on  DHCP supplied IP addresses]
  - mount **workspace**
- Camera support [cam2ip]FFFFFFFFFFFFFFFFFFFFFFFF

## Structure
├── bin [shell commands]
│   └── Archive [ old commands]
├── dbs [sqlite dbs]
├── Desktop
├── Downloads
├── habridge [Home Assistant Bridge]
│   └── data
├── log2ram [move log files to RAM]
├── resources [various file to support GUI]
├── script [scargill "the script"]
├── thinclient_drives [ created by xrdp]
├── wiringPi [library]
├── workspace [mount point to Network Drive]
    the following is on //HS2/Development/RaspberryPi
│   ├── Backup
│   ├── bash
│   ├── Blynk
│   ├── MQTT
│   ├── python_games
│   ├── raspberrypi
│   ├── raspiproj
│   └── sketchbook
└── www [HTML files are linked here form /var/www/html]
    ├── phpliteadmin
    ├── phpsysinfo
    └── resources

## Git Support

## Tests

- assign_hostname.sh [ contains testing features inside script]


## License

A short snippet describing the license (MIT, Apache, etc.)

