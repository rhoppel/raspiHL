#
# basic settings
#
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -hCF'
alias la='ls -hA'
alias ll='ls -halF'
alias ls='ls -h --color=auto'
alias h='history'
alias s='source' 

alias sa='source ~/.bash_aliases' 
alias sb='source ~/.bashrc' 
alias va='vim ~/.bash_aliases'
alias vb='vim ~/.bashrc'
#
# VScode editor
#
alias code='"Code - Insiders.exe" $1'
#
# ssh commands
#
alias s3b='ssh pi@raspi3b'
alias s3bw='ssh pi@raspi3b-w'
alias s3a='ssh pi@raspi3a'
alias s3aw='ssh pi@raspi3a-w'
alias s2b='ssh pi@raspi2b'
alias s2a='ssh pi@raspi2a'
alias sk9='ssh rhoppel@k9 -p 2222'
alias sssh='sudo service ssh start'
#
# mount drive commands
#
alias mdz='mount -t drvfs Z: /mnt/z'`
alias mdy='mount -t drvfs Z: /mnt/y'`
alias mdW='sudo mount -t drvfs "\\HS2\Websites" /mnt/Websites'
alias mDev='~/mount_Development'
alias uDev='umount /mnt/Development'
alias mWeb='~/mount_Websites'
alias uWeb='umount /mnt/Websites'
alias mmDev='sudo mount -t drvfs "\\hs2\\Development" /mnt/Development'
alias mDoc='~/mount_Documents'
alias uDoc='umount /mnt/Documents'
#alias mDoc='sudo mount -t drvfs \\\\hs2\\Folder Redirection\\rick\\Documents" /mnt/Documents'
alias uDev='sudo umount /mnt/Development'
#
# grav commands
#
WEBS=/mnt/Websites/grav
alias gwebs='pushd $WEBS'

alias gb='bin/grav backup'
alias gc='bin/grav clear-cache'
alias gi='bin/gpm index'
alias gii='bin/gpm index -I'
alias gl='bin/gpm list'
alias gs='sudo bin/plugin git-sync sync'
alias gsu='bin/gpm selfupdate'
alias gu='bin/gpm update'
#
# grav multiple site commands
#
# list backups for all sites
alias glb='pushd $WEBS ; ls -l g_*/backup/*.zip; popd'
# list directories
alias gg='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; ls;  done; popd'
# backup 
alias ggb='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; bin/grav backup; done; popd'
# clearcache 
alias ggc='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; bin/grav clearcache; done; popd'
# list plugins 
alias ggi='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; bin/gpm index -I; done; popd'
# self-update; update
alias ggu='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; bin/gpm selfupdate ; bin/gpm update; done; popd'
# git-sync 
alias ggs='pushd $WEBS; for f in g_*; do echo "\"$f\""; cd $f; sudo bin/plugin git-sync sync:; done; popd'
#
# backup bash varialble to Development/wsl
#
HOST=$(hostname)
WSL=/mnt/Development/wsl/$HOST
alias bwsl='pushd ~;mDev; cp -r .ssh .bashrc .bash_aliases .vim .vimrc mount_* $WSL ; popd'
