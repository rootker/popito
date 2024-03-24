#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓ conf_author ▓ Pro0x3st mohamed@cock.li
# ░▓ code        ▓ http://code.xero.nu/dotfiles
# ░▓ mirror      ▓ not yet
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#     
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.node_modules/bin/:/home/$USER/.local/share/gem/ruby/3.0.0/bin:$PATH
#export CDPATH='~:/var/log:/etc'
export VISUAL=vim
export EDITOR=vim
export TERMINAL=termite
export READER=zathura
#export LANG=utf8
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export RTV_BROWSER=w3m
export BROWSER=$([ '$(pidof firefox)' = "" ] && export BROWSER=google-chrome-stable || export BROWSER=firefox)
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_CONFIG_HOME=$HOME
#export XDG_RUNTIME_DIR=~
#export XDG_DATA_DIRS=~
#export XDG_CONFIG_DIRS=~
export XDG_CONFIG_HOME="$HOME/.config"
#export MSF_DATABASE_CONFIG="$HOME/.msf4/database.yml"
export RUBYOPT="rubygems"
export npm_config_prefix=$HOME/.node_modules
export CFLAGS="-O3 -pipe -march=native"
export CXXFLAGS="-O3 -pipe -march=native"
export MAKEFLAGS="-j4"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export WGETRC="$HOME/.config/wget/wgetrc"
export HSTR_CONFIG=hicolor       # get more colors
export MYHISTFILE=~/.bash_myhistory
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000
export HISTFILESIZE=50000
shopt -s histappend              # append new history items to .bash_history
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export 'FZF_DEFAULT_COMMAND'="find . -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
#export SUDO_ASKPASS="rofi-askpass"
export FFF_COL1=1
export FFF_OPENER="opn"
export FFF_W3M_XOFFSET=30
export FFF_W3M_YOFFSET=10
export FFF_FAV1=~/Downloads
export FFF_FAV2=~/Documents
export FFF_FAV3=~/Pictures
export FFF_FAV4=~/Programs
export FFF_FAV5=~/Videos
export FFF_FAV6=/mnt/
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[0;34;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;31m'
# https://consoledonottrack.com/
export DO_NOT_TRACK=1
export ADBLOCK="true"

stty -ixon
shopt -s autocd         # automatically cd's to path entered at the prompt
shopt -s cdspell      # corrects minor spelling errors in when using cd
shopt -s checkwinsize      # as the name says - after each bash command
shopt -s cmdhist      # attempts to save multiple line commands in the history
shopt -s dotglob      # includes <.dot> files in file name expansion if poss
shopt -s expand_aliases      # aliases are expanded
shopt -s extglob      # the extended pattern matching enabled
shopt -s histappend      # history from exited shell kept for next open shel
shopt -s hostcomplete      # host name completion when @ is in the word
shopt -s nocaseglob      # case-insensitive when performing filename expansion

timed_commands() {
    [ "$1" = off ] && exec bash
    PS1='$ '  # Put something simple here
    while IFS= read -erp "$PS1" line;do
        eval "time $line"
    done
}
set -o vi # vim mode
bind -m vi-insert "\C-l":clear-screen # ctrl+l for clear 
# Better TAB completion.
bind 'TAB:menu-complete'
bind 'set colored-stats on'
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
complete -W "+%H:%M +%d.%m.%y_%H:%M" date
bind 'set completion-map-case on'
bind 'set page-completions off'
#bind 'set menu-complete-display-prefix on'
bind 'set completion-query-items 0'

#-----------------------------------------
# history completion using the arrow keys:
#-----------------------------------------

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#cat /home/marmathe/.cache/wal/sequences
#source ~/.git-prompt.sh
#GIT_PS1_DESCRIBE_STYLE=branch

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion ]] && \
    . /usr/local/share/bash-completion/bash_completion 

#export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

#function __prompt_command() {
#	local EXIT="$?"             # This needs to be first
#	PS1=""
#
#    # see ~/bin/colortest:
#	local RCol='\[\e[0m\]'
#	local Red='\[\e[0;31m\]'
#	local Gre='\[\e[0;32m\]'
#	local BYel='\[\e[1;33m\]'
#	local BBlu='\[\e[0;34m\]'
#	local Pur='\[\e[0;35m\]'
#	local Turq='\[\e[0;36m\]'
#	local bluebg='\[\e[0;44m\]'
#	local redbg='\[\e[0;41m\]'
#
#    parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#	if [ "$color_prompt" = yes ]; then
#
#		if [ -z $DISPLAY ]; then # not in X
#
#            if [ $EXIT != 0 ]; then
#              PS1+="${Red}err:${EXIT}${RCol} "
#            else
#                PS1+="${Gre}ok${RCol} "
#            fi
#
#            # display hostname for remote clients:
#            if [ "x$SSH_TTY" = "x" ]; then
#                PS1+="\u${BBlu}\w${RCol} ${Gre}\$ ${RCol}"
#            else
#                # ssh:
#                PS1+="\u${BBlu}@\h${RCol} ${BBlu}\w${RCol} ${Gre}\$ ${RCol}"
#            fi
#
#		else
#
#            if [ $EXIT != 0 ]; then
#                PS1+="${Red} ($EXIT)${RCol} "
#            else
#                PS1+="${Gre} ${RCol} "
#            fi
#            # 🚀 🌈🌈
#			#PS1+="root@\h ${BBlu}\W${RCol} ${Red}\! ${Gren}\T $(parse_git_branch)${Pur}👾 - ${RCol}"
#			PS1+="\u ${BBlu}\W${RCol} ${Gre}\! $(parse_git_branch)${Pur}- ${RCol}"
#
#		fi
#
#	else
#		PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#	fi
#}
#
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#eval "$(starship init bash)"
#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"
#PS1='\[\e[0;91m\]\W\[\e[m\] \[\e0'
__git_ps1() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
#  PS1='\[\e[30m\]\u\[\e[1;32m\] \[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'

#export PS1="\[\e[0;32m\]\u\[\e[0;37m\]@\[\e[0;34m\]\h\[\e[0;37m\]: [\[\e[0;31m\]\w\[\e[0;37m\]] > \[\e[0m\]"
#PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS2='➘ '
export PS3='\ '
export PS4='| '
#export PS1='➜ '
#export PS1='\[\e[32m\]\u \[\e[90m\]\w \[\e[31m\]>\[\e[0m\] '
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#PS1='\[\e[0;31m\]────── \[\e[0;32m\]\W\[\e[0m\] $(__git_ps1 "\[\e[0;33m\]at\[\e[0m\] \[\e[0;34m\]%s\[\e[0m\]")\[\e[0;31m\] # \[\e[0;37m\]'
#PS1='\[\e[0;31m\]┌─\e[0m\e[34m[\[\e[0m\e[0;32m\] \w\[\e[0m\] \e[34m]\e[0m $(__git_ps1 "\[\e[0;35m\]@\[\e[0m\]\[\e[0;36m\]\[\e[5m \]%s\[\e[25m\]\[\e[0m\]")\n└─>\[\e[0m\] '
#PS1='\[\e[0;31m\]$ \[\e[0;32m\]\W\[\e[0m\] $(__git_ps1 "\[\e[1;37m\]@\[\e[0m\] \[\e[0;36m\]%s\[\e[0m\]") '
#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

#PS1="\[\e[1;34m\]\u\[\e[0m\] » [\[\e[1;32m\]\W\[\e[0m\]]\[\e[1;37m\]:\[\e[0m\] "
# Sensai

blue=$(tput setaf 4) # \e[36m
greenbg=$(tput setab 2)
reset=$(tput sgr0)   # \e[0m
alias pu="ps -fu seo --forest"
export PS1="\[$(tput setaf 4)\]\u\[$(tput sgr0)\] 🥀 (\W) \[$(tput setaf 2)\]⦁ \[$(tput sgr0)\]"
#PS1="\[$greenbg\] \w \[$reset\]\[$blue\] * \[$reset\]"
gatewayip() {
   ip route | awk '/^def/{print $3}'
}
show_exit() {
    if [ "$1" -eq "0" ]; then
        return
    fi
    echo -e "\007exit $1"
}
_exit() {
    end_history
    echo -e  "${BRed}Hasta la vista, baby!"
    echo -en "\033[m"
}
log_history() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD ($1) $(history 1)" >> $MYHISTFILE
}

prompt_cmd() {
    local s=$?
    show_exit $s;
    log_history $s;
}

end_history() {
    log_history $?;
    echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD (end)" >> $MYHISTFILE
}
#f5# Create temporary directory and \kbd{cd} to it
function cdt () {
    builtin cd "$(mktemp -d)"
    builtin pwd
}
function wall() {
    lastdir="/home/$USER/.cache/Wall/"
    ca="$lastdir/.lastpath"
    default="/home/$USER/gits/wallpapers/MW"
    animewl="$HOME/Pictures/anime"
    #touch $ca
    if [ "$1" == "-l" ];then
        if ! -d $lastdir;then
            mkdir $lastdir
        else
            echo "Cannot Create Dir $?"
        fi
        read -p "ENTER PATH _> " path
        if ! -d $path;then
           echo "Dir Not Exits"
           exit
       else
           echo $path > $cachefile
        fi
    fi
   if [ "$1" == "-r" ];then
    if [ "$2" == "del" ];then
        cat $ca | head -1 | xargs -o rm -vi 
        return 1
    fi 
	if [ "$2" == "anime" ];then
        imagename=$(/bin/ls -Rt -d -1 $animewl/{*,.*} | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1)
        nitrogen --set-zoom-fill $imagename --save 2>/dev/null|| echo "somthing wrong" 
        echo "[+] Wallpaper Have Been Set Succefull..."
        echo "[!] Wallpaper Path : $imagename" 
        echo $imagename >> $ca
        return 0
	fi
    if [ -d "$defualt" ];then
        echo "Directory Not Found"
        return 1
    fi
        #/bin/ls -Rt -d -1 $default/{*,.*} | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shufb81f369cccadd5ab17f81a8ab3daeb44de6 | head -1|xargs nitrogen --set-tiled 2>/dev/null
        imagename=$(/bin/ls -Rt -d -1 $default/{*,.*} | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1)
        nitrogen --set-zoom-fill $imagename --save 2>/dev/null|| echo "somthing wrong" 
        echo "[+] Wallpaper Have Been Set Succefull..."
        echo "[!] Wallpaper Path : $imagename"
        echo $imagename > $ca
        return 0
       if [ $# != 0 ];then
            echo "There Unkown Error $#"
   fi
    fi
    if [ ! -z $1 ];then
        dir=$(pwd)
        find $1 -type f |  egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1 > $ca 
        cat $ca | xargs nitrogen --set-zoom-fill --save 
        echo "[!] wallpaper is $(cat $ca)" 
    return 0
    fi
  read -p "Enter Directory Name : " dir
    if [ "${dir:-$default}" == "" ];then
        echo "U have to Enter Dir"
    elif [ $# != 0 ];then
        echo "There Unkown Error"
    else
      /bin/ls -Rt -d -1 ${dir:-$default}/{*,.*} | egrep '.jpg$|\.png$|\.jpeg$|.webmp' | shuf | head -1|xargs nitrogen --set-zoom-fill --save
    return 0
    fi
}
    alias xl="cat $ca | head -1 | xargs -o rm -vi" 
    alias xm="cat $ca | head -1 | xargs -o mv -v ~/Pictures/favs/"
#if [[ -f ~/.alias ]];then
#    . ~/.alias
#fi
#if [[ -f ~/.prompt ]];then
#    . ~/.prompt
#fi
dropbox_() {
hush="yes"
if [ -z $(pgrep -x dropbox) ];then
    if [ $hush == "yes" ];then
        return 1
    fi
    echo "Dropbox not running"
else
    echo "Dropbox is running"
fi
}
dropbox_
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\?\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi
        local proxy=$1
        export http_proxy="$proxy" \
               https_proxy=$proxy \
               ftp_proxy=$proxy \
               rsync_proxy=$proxy
        echo "Proxy environment variable set."
        return 0
    fi

    echo -n "username: "; read username
    if [[ $username != "" ]]; then
        echo -n "password: "
        read -es password
        local pre="$username:$password@"
    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    local proxy=$pre$server:$port
    export http_proxy="$proxy" \
           https_proxy=$proxy \
           ftp_proxy=$proxy \
           rsync_proxy=$proxy \
           HTTP_PROXY=$proxy \
           HTTPS_PROXY=$proxy \
           FTP_PROXY=$proxy \
           RSYNC_PROXY=$proxy
}

function proxy_off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}
function wifi_passwords(){
     sudo grep -r '^psk=' /etc/NetworkManager/system-connections/
}

function news(){
#alias news="curl getnews.tech"
if [ "$1" == "-c" ]; then
    curl $2.getnews.tech
else
    curl getnews.tech
fi
}
export LS_COLORS='ow=01;33:no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export LS_COLORS
#complete -cf mousepad nano bash sudo pacman
#source "$HOME/.cache/wal/colors.sh"
# HSTR configuration - add this to ~/.bashrc
#alias sydrop="encfs ~/Dropbox/ ~/Private;rsync -azP ~/.config/i3"
alias mwin="mount -t cifs -o username=snake //192.168.1.13/Users /mnt/myshare" 
alias ker="cd ~/gits/rootker/"
alias s='sudo '
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias rsync="rsync -arAX --delete "
#alias sudo='sudo -p "$(printf "\033[1;31mPassword: \033[0;0m" )"'
alias rel="kill -USR1 -x $1"
alias bak="mv $2 -vi $2.bak "
alias quotes='curl -s "https://api.quotable.io/random?maxLength=20|funny" | jq '.content' | cut -d "\"" -f 2'
alias vbash="vim ~/.bashrc"
alias ree="redshift -P -O 8500"
alias load="pgrep -x $1 2>/dev/null | xargs kill -USR1"
alias vpol="vim ~/.config/polybar/config.ini"
alias ranger="python ~/compile/ranger/ranger.py"
alias ..="cd ../../"
alias ...="cd ../../../../".
alias ...="cd ../../../".
alias 2="cd ../../"
alias 3="cd ../../../"
alias 4="cd ../../../../"
alias 5="cd ../../../../../"
alias 6="cd ../../../../../../ "
alias Mem="free -mh | awk '/^Mem/ {print $3}'"
alias vi3="vim ~/.config/i3/config"
alias vpolybar="vim ~/.config/polybar"
alias rep="pgrep polybar|xargs kill -USR1"
alias psize="expac -S -H M '%k\t%n' "
alias upshut="pacman -Syu --noconfirm && shutdown now"
alias ports="netstat -tulanp"
alias mountc="mount |column -t"
alias lsd="ls -ld -- */"
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias pi="curl icanhazip.com"
alias v="vim"
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -a' 
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias nightly="firefox-nightly"
alias sf='cls;screenfetch;~/scripts/colors-hex'
alias cls=' echo -ne "\033c"'
alias ll="ls -la"
alias ytdl="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' --prefer-free-formats"
alias ytmp3='youtube-dl --extract-audio --audio-format mp3'
alias screenkey="screenkey -f 'DejaVu Sans Mono Book 22' -p bottom --bg-color '#2f343f' --font-color '#f3f4f5'"
alias whats="apropos"
alias S="sudo systemctl start"
alias S_="sudo systemctl status"
alias S-="sudo systemctl stop"
alias S@="sudo systemctl restart "
alias S+="sudo systemctl enable"
alias sx="systemctl start --user"
alias s_="systemctl status --user"
alias s-="systemctl stop --user"
alias s@="systemctl restart --user"
alias s+="systemctl enable --user"
alias sn='netstat -tanpu'
alias rl="source ~/.bashrc"
alias co="ifconfig tun0 | awk 'NR==2 {print \$2}' | xclip -selection c"
alias p5='php56 -S 127.0.0.1:8010 2>/home/marmathe/.marmathe_php_logs & disown'
alias xc='xclip -selection clipboard -in'          # cut to clipboard
alias vo='xclip -selection clipboard -out'         # paste from clipboard
alias riwd='sudo systemctl restart iwd'
alias arserv='aria2c --enable-rpc --rpc-listen-all'
alias random_wall='ls -d "$PWD/work/wallpapers/MW"/*|uniq|sort -R|head -1|xargs nitrogen --set-zoom-fill|xargs tee ~/wall'
alias fake1g='fallocate -l 1G test.img'
alias whats='apropos'
alias dig='drill'
alias listaur="pacman -Qm"
alias cc='xclip -selection clipboard -in -filter'  # copy clipboard
alias userlist="cut -d: -f1 /etc/passwd"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'     # excuses
alias freechess='telnet fics.freechess.org 5000'                  # connects to a telnet server for free internet chess
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias busy='for i in `seq 0 100`;do timeout 6 dialog --gauge "Install..." 6 40 "$i";done' # pretend to be busy in office to enjoy a cup of coffee
alias busy2='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias busy3='cat /dev/urandom | hexdump -C | highlight ca fe 3d 42 e1 b3 ae f8 | perl -MTime::HiRes -pnE "Time::HiRes::usleep(rand()*1000000)"'
#alias 'tmux'='wmux -f ~/.dotfiles/tmux/tm.conf'
alias ls='ls --classify --tabsize=0 --group-directories-first --literal --color=auto --show-control-chars --human-readable'
#alias 'ls'='exa -a --icons'
alias 'irssi'='irssi --config ~/.irssi/config --home ~/.irssi/'
alias 'lswifi'="iwctl station wlan0 get-networks"
alias 'tmuxhide'='tmux -f ~/.tmux_hidden.conf'
alias 'wpa_cli'='wpa_cli -iwlan0'
alias gc="git clone $1"
alias 'gs'='git status'
alias 'ga'='git add'
alias 'gm'='git commit -m'
alias 'gp'='git push'
alias go='git push -u origin $1'
alias 'm'='mpv -- "$(pwd)/"'
alias pick="gpick -osp"
alias 'b'='light -S'
alias 'bat'='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
alias 'update'='sudo pacman -Syu'
alias 'add'='sudo pacman -S'
alias 'del'='sudo pacman -Rcns'
alias ser='pacman -Ss'
alias sb='vim ~/.bashrc'
alias sf='vim ~/.func'
alias si3='vim ~/.config/i3/config'
alias tree='tree -dA'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias lanip='ip route get 1 | head -1 | cut -d " " -f7'
# Get the default gateway's (router's) IP address.  See <https://serverfault.com/q/31170>.
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"
alias neofetch="clear; neofetch"
alias refugees="pacman -Qm"
alias fixwifi="sudo modprobe -r iwlmvm; sudo modprobe iwlmvm"
alias yeah="yes"
alias 'mv'='mv -i'
alias 'cp'='cp -i'
m-sound() { arecord -L && arecord -l && cat /proc/asound/pcm ;}
mkcd() { mkdir -p -- "$1"; cd "$_" ;}

secrets() {
    if [ ! -f ~/.secrets ]; then touch ~/.secrets; fi
    case $@ in
        "-e") cat ~/.secrets|xxd -r -p|base64 -d > ~/secrets.open; rm -f ~/.secrets
              vim ~/secrets.open
              cat ~/secrets.open|base64|xxd -p -c 16 > ~/.secrets; rm -f ~/secrets.open;;
           *) cat ~/.secrets|xxd -r -p|base64 -d|less;;
    esac
}

shred() {
    BYTES=`wc -c < "$@"`
    for i in `seq 1 7`; do
        dd if=/dev/urandom of="$@" bs=$BYTES count=1 conv=notrunc status=none
    done
    rm -f "$@"
}

adbcurrent() {
  adb shell "dumpsys activity activities | grep mResumedActivity" | perl -pe 's/.+(com.+?)\/.*/$1/'
}

detectcam() {
    for d in /dev/video*; do
        v=`v4l2-ctl --device=$d -D --list-formats`
        if [[ $v == *"LifeCam Cinema"* ]]; then
            echo $d
        fi
    done
}

run_bg() {
    nohup $@ > /dev/null 2>&1 &
}

+x() {
if [ -z "$1" ];then
    echo "Usage : +x filename"
    return 0
else
    chmod +x $1 2>/dev/null && echo -e "u can now run \e[1;31m$1\e[0m" || echo -e "\e[1;31m[!]\e[0m File \e[1;31m$1\e[0m Does't exits"
    return 0
fi
}
function think() {
dropthink="$HOME/Dropbox/linux/Thinkpad"
if [ ! -d $dropthink ];then
    echo "Directory not exits"
    return 1
#    if [ -z $1 ];then
#        ls $dropthink
#    else 
#        ls $dropthink | find $dropthink -name *$1* -type f | xargs -o vim
#    fi
fi
case $1 in
        -edit | -e ) ls $dropthink | find $dropthink -name *$2* -type f | xargs -o vim ;;
        -delete | -d ) find $dropthink -name *$2* -type f -exec rm -vi {} \; && echo "files donededede" || echo "somthing wrong" ;;
        -dir ) find $dropthink -name *$2* -type d -exec rm -rvi {} \; ;; 
        -list | -l ) ls $dropthink ;;
        -mkdir | -m ) mkdir $dropthink/$2 && echo "$2 directory created" || echo "somthing wrong";;
        -file | -f ) touch $2 $dropthink ;;
        -go | -g ) cd $dropthink ;;
        * ) ls $dropthink ;;
esac
}
function lalias(){
source="/home/$USER/.bashrc"
command=$()
if [ -z "$1" ];then
    cat $source | grep ^alias | sed 's,alias,,g'| sed 's,=, |-> ,g'
else
    cat $source | grep ^alias | sed 's,alias,,g'| sed 's,=, > ,g'| grep $1
fi
}

function cpstat()
{
    local pid="${1:-$(pgrep -xn cp)}" src dst
    [[ "$pid" ]] || return
    while [[ -f "/proc/$pid/fd/3" ]]; do
        read src dst < <(stat -L --printf '%s ' "/proc/$pid/fd/"{3,4})
        (( src )) || break
        printf 'cp %d%%\r' $((dst*100/src))
        sleep 1
    done
    echo
}
#export socks_proxy=''

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
alias reload="source ~/.bashrc"
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=erasedups:ignoreboth   # leading space hides commands from history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
#if [[ $- =~ .*i.* ]]; then bind '"\C-r": "hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
#if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "hstr -k \C-j"'; fi
#eval "$(pandoc --bash-completion)"

#source "$HOME/.cargo/env"
source /usr/share/bash-completion/bash_completion
#eval "$(fasd --init auto)"

# https://github.com/gsamokovarov/jump
#eval "$(jump shell)"
