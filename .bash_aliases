# enable color support of ls and also add handy aliases
# some more ls aliases
#alias ll='ls -l'
alias h=history
alias hcc='cat /dev/null > ~/.bash_history'
alias hc='tail -n 50 ~/.bash_history > ~/.bash_history; history'
alias df='df -h' 
alias vi='vim'
alias va='vim ~/.bash_aliases'
alias vb='vim ~/.bashrc'
alias vh='vim ~/www/index.html'
alias sa='source ~/.bash_aliases'
alias sb='source ~/.bashrc'
alias perms='namei -om'
alias vR='vim ./README.md'
#
# log file
alias log_mon='sudo tail -F /var/log/syslog'
#
# network configuration
#
alias net_conf='sudo vim /etc/network/interfaces'
alias net_ports='netstat -lnt'
alias net_wlan0_set='sudo ifconfig wlan0 192.168.222.1/24'
#
#  mount(umount) file systesm
#
alias nmD='mount_Dev.sh'
alias nuD='mount_Dev.sh -u'
alias nmH='mount_HS2_Backup.sh'
alias nuH='mount_HS2_Backup.sh -u'
alias nmSD='mount_SD_Backup.sh'
alias nmD='mount_Dev.sh'

#
# mount drive commands
#
alias  mWeb="sudo mount -t cifs //HS2/Websites ~/Websites"
alias  mDev="sudo mount -t cifs //HS2/Development ~/Development"
alias  uDev="sudo umount ~/Development"
alias uwork="sudo umount ~/workspace"
#
#  ssh commands
#
alias sbb='ssh debian@bb'
alias s2a='ssh root@raspi2a'
alias s2b='ssh pi@raspi2b'
alias s3a='ssh pi@raspi3a'
alias s3aw='ssh pi@raspi3a-w'
alias s3b='ssh pi@raspi3b'
alias s3bw='ssh pi@raspi3b-w'
alias sk9='ssh rhoppel@k9 -p 2222'
alias sssh='sudo service ssh start'
alias sb='ssh rhoppel@bluelaptop'
#
# "motion" package commands
#
alias motion_conf='vim ~/config/motion.conf'
alias motion_enable='sudo vim /etc/default/motion'
alias motion_start_nodetect='motion -m'
alias motion_kill='kill -9 $(cat /tmp/motion.pid)'
alias motion_conf_copy='sudo cp ~/config/motion.conf /etc/motion'
alias motion_conf_remove='sudo rm /etc/motion/motion.conf'
alias motion_start_nodetect='motion -m'
alias motion_start='sudo systemctl start motion'
alias motion_stop='sudo systemctl stop motion'
alias motion_reload='sudo systemctl reload motion'
alias motion_restart='sudo systemctl restart motion'
alias motion_status='sudo systemctl status motion'
alias motion_lib='ls -la /var/lib/motion'
alias motion_log='tail /tmp/motion.log'
alias motion_log2='view /tmp/motion.log'
#
# dnsmasq configuration
#
alias dnsmasq_conf='sudo vim /etc/dnsmasq.d/dnsmasq.conf'
alias dnsmasq_enable='sudo vim /etc/default/dnsmasq'
alias dnsmasq_boot_enable='sudo systemctl enable  dnsmasq'
alias dnsmasq_boot_disable='sudo systemctl disable dnsmasq'
alias dnsmasq_enable='sudo systemctl enable  dnsmasq'
alias dnsmasq_disable='sudo systemctl disable dnsmasq'
alias dnsmasq_start='sudo systemctl start   dnsmasq'
alias dnsmasq_stop='sudo systemctl stop    dnsmasq'
alias dnsmasq_status='sudo systemctl status  dnsmasq'
#
# AP configuration
#
alias hostapd_conf='sudo vim /etc/hostapd/hostapd.conf'
alias hostapd_enable='sudo vim /etc/default/hostapd'
alias hostapd_start='sudo /usr/sbin/hostapd -B /etc/hostapd/hostapd.conf'
alias hostapd_start_nodaemon='sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf'
#alias hostapd_start='sudo systemctl start hostapd'
alias hostapd_stop='sudo systemctl stop hostapd'
alias hostapd_status='sudo systemctl status hostapd'
alias hostapd_reload='sudo systemctl reload hostapd'
alias hostapd_restart='sudo systemctl restart hostapd'
alias hostapd_doc='view /usr/share/doc/hostapd/README.Debian'
alias hostapd_boot_enable='sudo update-rc.d hostapd enable'
alias hostapd_boot_disable='sudo update-rc.d hostapd disable'
#
# mqtt configuration
#
alias mqtt_conf='sudo vim /etc/mosquitto/mosquitto.conf'
alias mqtt_conf2='sudo vim /etc/mosquitto/conf.d/mqtt_raspi.conf'
alias mqtt_local_conf='sudo vim /etc/mosquitto/conf.d/mqtt_raspi.conf'
alias mqtt_doc='view /usr/share/doc/mosquitto/examples/mosquitto.conf.example'
alias mqtt_start='sudo systemctl start mosquitto'
alias mqtt_stop='sudo systemctl stop mosquitto'
alias mqtt_status='sudo systemctl status mosquitto'
alias mqtt_reload='sudo systemctl reload mosquitto'
alias mqtt_restart='sudo systemctl restart mosquitto'
alias mqtt_test_sub='mosquitto_sub -h localhost -v -t "\$SYS/#"'
alias mqtt_test_pub='mosquitto_pub -h localhost -t test/topic -m "My first hello world for Mosquitto"'

alias rc='sudo rpi-clone sda'
#
# node-red update
#
alias nrupdate='sudo npm --force cache clean ; sudo npm install -g --unsafe-perm node-red; cd ~/.node-red; npm outdated'
# beaglebone only
alias nr_log='sudo journalctl -f -u node-red -o cat'

alias term='lxterminal --tabs=mc,htop,ncdu,node-red --geometry=120x64 --command=mc'

#
HOST=$(hostname)
B_DEST=~/workspace/Backup/$HOST
alias b_bash='pushd ~; echo "Destination: $B_DEST " ;nmD; cp -r .smbcredentials .ssh .bashrc .bash_aliases .profile .vim .vimrc  $B_DEST ;ll -a $B_DEST; popd'

alias rc='sudo -A rc_gui'
alias rp='sudo -A rp_prefapps'
alias dx='export DISPLAY=:0.0'
alias dxr='export DISPLAY=:10.0'
alias startx='startx'

DATETIME=$(date +%Y-%h-%d-%H:%M)
FNAME=/home/pi_$DATETIME
alias b_pi='node-red-stop; sudo zip -r $FNAME /home/pi; sudo chown pi:pi $FNAME.zip'
alias b_pi_move='nmD;mv /home/pi_*.zip /home/pi/workspace/Backup/$HOST'

if [ -e ~/.homeassistant ]; then
  pushd ~/.homeassistant >> /dev/null
  if [ -f ./.bash_aliases ]; then
#    echo "loading aliases for home assistant"
    . ./.bash_aliases
  fi
  cd
  popd >> /dev/null
fi
