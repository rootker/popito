alias disks='echo "╓───── m o u n t . p o i n t s"; \
			 echo "╙────────────────────────────────────── ─ ─ "; \
			 lsblk -a; echo ""; \
			 echo "╓───── d i s k . u s a g e";\
			 echo "╙────────────────────────────────────── ─ ─ "; \
			 df -h;'
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename
alias rclone-google="mkdir /tmp/google-dko && rclone mount --daemon google-z: /tmp/google-dko || echo 'something wrong '"
alias rclone-dropbox="mkdir ~/Dropbox && rclone mount --daemon Dropbox: ~/Dropbox || echo 'something wrong '"
alias fuck='sudo $(fc -ln -1)'
alias -s {pdf,PDF}='mupdf'
alias -s {jpg,JPG,png,PNG}='sxiv'
alias -s {ods,ODS,odt,ODT,odp,ODP,doc,DOC,docx,DOCX,xls,XLS,xlsx,XLSX,xlsm,XLSM,ppt,PPT,pptx,PPTX,csv,CSV}='libreoffice'
alias -s {html,HTML}='google-chrome-stable'
alias -s {mp4,MP4,mov,MOV,mkv,MKV}='mpv'
alias -s {zip,ZIP,war,WAR}="unzip -l"
alias -s {jar,JAR}="java -jar"
alias -s gz="tar -tf"
alias -s {tgz,TGZ}="tar -tf"
# ---------------SYSTEM-D---------------- # 
alias blame-plot='systemd-analyze plot >plot.svg'
alias blame='systemd-analyze blame'
# ------------------------------- #
alias -g scldr='systemctl daemon-reload'
alias -g jou='sudo journalctl -b -n 200 -f'
alias -g pcclean='pacman -Rsn $(pacman -Qqdt)'
alias dkclean='docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi'
alias dkrp8='docker run --rm -p 8080:8080'
alias dkrp9='docker run --rm -p 9080:9080'
# ------------------- LS ---------------------- #
alias dir="command ls -lSrah"
##a2# Only show dot-directories
alias lad='command ls -d .*(/)'
##a2# Only show dot-files
alias lsa='command ls -a .*(.)'
##a2# Only files with setgid/setuid/sticky flag
alias lss='command ls -l *(s,S,t)'
##a2# Only show symlinks
alias lsl='command ls -l *(@)'
##a2# Display only executables
alias lsx='command ls -l *(*)'
##a2# Display world-{readable,writable,executable} files
alias lsw='command ls -ld *(R,W,X.^ND/)'
##a2# Display the ten biggest files
alias lsbig="command ls -flh *(.OL[1,10])"
##a2# Only show directories
alias lsd='command ls --color=auto -d *(/)'
alias lsd.='command ls --color=auto -d .*(/)'
##a2# Only show empty directories
alias lse='command ls -d *(/^F)'
##a2# Display the ten newest files
alias lsnew="command ls -rtlh *(D.om[1,10])"
##a2# Display the ten oldest files
alias lsold="command ls -rtlh *(D.Om[1,10])"
##a2# Display the ten smallest files
alias lssmall="command ls -Srl *(.oL[1,10])"
##a2# Display the ten newest directories and ten newest .directories
alias lsnewdir="command ls -rthdl *(/om[1,10]) .*(D/om[1,10])"
##a2# Display the ten oldest directories and ten oldest .directories
alias lsolddir="command ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])"
#
alias clearlogs="find ~ -name '*.log' -print0 | xargs -0 rm -f"
function slog() {
journalctl --user -u $1 -b 0 --no-pager
}
##a2# Remove current empty directory. Execute \kbd{cd ..; rmdir \$OLDCWD}
alias rmcdir='cd ..; rm -rf $OLDPWD || cd $OLDPWD'
#
##a2# ssh with StrictHostKeyChecking=no \\&\quad and UserKnownHostsFile unset
alias insecssh='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'
##a2# scp with StrictHostKeyChecking=no \\&\quad and UserKnownHostsFile unset
alias insecscp='scp -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'
#
#alias mwin="mount -t cifs -o username=snake //192.168.1.13/Users /mnt/myshare" 
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias rsync="rsync -arAX --delete "
alias quotes='curl -s "https://api.quotable.io/random?maxLength=20|funny" | jq '.content' | cut -d "\"" -f 2'
alias vbash="vim ~/.bashrc"
alias ree="redshift -P -O 8500"
alias vpol="vim ~/.config/polybar/config.ini"
#alias ranger="python ~/compile/ranger/ranger.py"
alias vi3="vim ~/.config/i3/config"
#alias psize="expac -S -H M '%k\t%n' "
alias upshut="pacman -Syu --noconfirm && shutdown now"
alias ports="netstat -tulanp"
alias mountc="mount |column -t"
alias pi="curl icanhazip.com"
alias v="vim"
#alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
#alias la='ls -a' 
#alias grep='grep --color=auto'
#alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias da='date "+%A, %B %d, %Y [%T]"'
#alias du1='du --max-depth=1'
alias ytdl="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' --prefer-free-formats"
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'
alias screenkey="screenkey -f 'DejaVu Sans Mono Book 22' -p bottom --bg-color '#2f343f' --font-color '#f3f4f5'"
alias whats="apropos"
alias S="sudo systemctl start"
alias S_="sudo systemctl status"
alias S-="sudo systemctl stop"
alias S@="sudo systemctl restart "
alias S+="sudo systemctl enable"
alias s="systemctl start --user"
alias s_="systemctl status --user"
alias s-="systemctl stop --user"
alias s@="systemctl restart --user"
alias s+="systemctl enable --user"
alias sn='netstat -tanpu'
alias rl="source ~/.bashrc"
#alias co="ifconfig tun0 | awk 'NR==2 {print \$2}' | xclip -selection c"
#alias p5='php56 -S 127.0.0.1:8010 2>/home/marmathe/.marmathe_php_logs & disown'
#alias xc='xclip -selection clipboard -in'          # cut to clipboard
#alias vo='xclip -selection clipboard -out'         # paste from clipboard
alias arserv='aria2c --enable-rpc --rpc-listen-all'
alias fake1g='fallocate -l 1G test.img'
#alias whats='apropos'
alias dig='drill'
alias listaur="pacman -Qm"
#alias cc='xclip -selection clipboard -in -filter'  # copy clipboard
#alias userlist="cut -d: -f1 /etc/passwd"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
#alias ls='ls --classify --tabsize=0 --group-directories-first --literal --color=auto --show-control-chars --human-readable'
alias lswifi="iwctl station wlan0 get-networks"
#alias 'tmuxhide'='tmux -f ~/.tmux_hidden.conf'
alias gc="git clone $1"
alias gs='git status'
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
#alias go='git push -u origin $1'
#alias 'm'='mpv -- "$(pwd)/"'
#alias pick="gpick -osp"
#alias 'bat'='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
alias srm="sudo rm $@"
alias 'update'='sudo pacman -Syu'
alias add='sudo pacman -S'
alias del='sudo pacman -Rcns'
alias sx='netstat -tulpn '
alias ser='pacman -Ss'
#alias tree='tree -dA'
alias lanip='ip route get 1 | head -1 | cut -d " " -f7'
## Get the default gateway's (router's) IP address.  See <https://serverfault.com/q/31170>.
#alias fixwifi="sudo modprobe -r iwlmvm; sudo modprobe iwlmvm"
alias mv='mv -i'
alias cp='cp -i'
alias reload="source ~/.zshrc"
alias pg='pwgen -cnBy 15'
alias rr='_c="$(tail -2 $HISTFILE | head -1)" && echo "$_c" && sudo sh -ec "$_c"'
alias serv='sudo systemctl start httpd mysql'
