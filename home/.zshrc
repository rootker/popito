#┏━┓┓━┓┳ ┳  ┏━┓┏━┓┏┓┓┳━┓o┏━┓
#┏━┛┗━┓┃━┫  ┃  ┃ ┃┃┃┃┣━ ┃┃ ┳
#┗━┛━━┛┇ ┻  ┗━┛┛━┛┇┗┛┇  ┇┇━┛

zmodload zsh/zprof
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$HOME/.local/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.node_modules/bin/:/home/$USER/.local/share/gem/ruby/3.0.0/bin:$PATH
#export BROWSER=$([ "$(pidof firefox)" = "" ] && export BROWSER=google-chrome-stable || export BROWSER=firefox)
umask 022
export BROWSER=google-chrome-stable
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_CONFIG_HOME=$HOME
export GPG_TTY=$(tty)
export CDPATH=$HOME/personal/git:~/.local:~:$HOME/.config:/etc:$HOME/Dropbox # cd with name in those directories
#source /usr/share/fzf/key-bindings.zsh
#export LIBGL_ALWAYS_SOFTWARE=true
#export XDG_RUNTIME_DIR=~
#export XDG_DATA_DIRS=~
#export XDG_CONFIG_DIRS=~
export EDITOR=${EDITOR:-vim}
export FZF_DEFAULT_COMMAND='find .'
export FZF_CTRL_T_COMMAND='find .'
export XDG_CONFIG_HOME="$HOME/.config"
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
export DO_NOT_TRACK=1 # https://consoledonottrack.com/
export ADBLOCK="true"
export LS_COLORS=$(vivid generate dracula) #using vivid to geneate colors
#export LS_COLORS='ow=01;33:no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
# open anyfile end in one of those in vim
setopt auto_cd  # command is the name of a directory, perform the cd command to that directory.
##############################################################
#  History options
###############################################################
HISTORY_IGNORE='(clear|c|pwd|exit|* —help|[bf]g *|less *|cd ..|cd -)'

autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic
setopt AUTO_RESUME          # Treat single word simple commands without redirection as candidates for resumption of an existing job.
setopt INTERACTIVE_COMMENTS # Allow comments starting with `#` even in interactive shells.
setopt NO_FLOW_CONTROL      # disable start (C-s) and stop (C-q) characters
setopt CORRECT              # Suggest command corrections
setopt LONG_LIST_JOBS       # List jobs in the long format by default.
setopt NOTIFY               # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
#*** setopt nonomatch
setopt NO_BG_NICE           # Prevent runing all background jobs at a lower priority.
setopt NO_CHECK_JOBS        # Prevent reporting the status of background and suspended jobs before exiting a shell with job control. NO_CHECK_JOBS is best used only in combination with NO_HUP, else such jobs will be killed automatically.
setopt NO_HUP               # Prevent sending the HUP signal to running jobs when the shell exits.
setopt NO_BEEP              # Don't beep on erros (overrides /etc/zshrc in Catalina)

setopt interactivecomments       # pound sign in interactive prompt
setopt BANG_HIST                 # Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from each command line being added to the history list.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob             # display PID when suspending processes as well
setopt longlistjobs              # report the status of backgrounds jobs immediately
setopt notify                    # whenever a command completion is attempted, make sure the entire command path
setopt hash_list_all             # is hashed first.
setopt completeinword            # not just at the end
setopt noglobdots                # * shouldn't match dotfiles. ever.
setopt noshwordsplit             # use zsh style word splitting
setopt unset                     # don't error out when unset parameters are used
setopt EXTENDED_GLOB             # Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc. (An initial unquoted ‘~’ always produces named directory expansion.)
setopt MULTIOS                   # Perform implicit tees or cats when multiple redirections are attempted.
setopt NO_CLOBBER                # Disallow ‘>’ redirection to overwrite existing files. ‘>|’ or ‘>!’ must be used to overwrite a file.

setopt AUTO_PUSHD        # Make cd push the old directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS # Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME     # Have pushd with no arguments act like ‘pushd ${HOME}’.
setopt AUTOPARAMSLASH    # tab completing directory appends a slash
#bindkey ' ' magic-space

REPORTTIME=5                     # if process last more then 5 print usage
#plugins=(web-search sudo .abbr_pwd)
#function source_plugins() {
#plug_dir="$HOME/.zsh/plugins/"
#for i in ${plugins[@]};do
#        pa="$plug_dir$i.plugin.zsh"
#        pa+="$plug_dir$i.zsh"
#        pax="$plug_dir$i"
#        if [[ -f $pa ]];then
#        source $pa
#        fi
#        if [[ -f $pax ]];then
#        source $pax
#        fi
#done
#}
#source_plugins
#IFS=$'\n'
names=(keybinds alias functions)
for i in ${names[@]};do
	source ~/.zsh/configs/$i.zsh
done
source /home/smoke/.zsh/plugins/.abbr_pwd
#source /home/seo/.zsh/plugins/alias-tips.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting.zsh # if file exits then source it
source ~/.zsh/plugins/zsh-lazyload/zsh-lazyload.zsh
# command.
PS2='\`%_> '                     # secondary prompt, printed when the shell needs more information to complete a
PS3='?# '                        # selection prompt used within a select loop.
PS4='+%N:%i:%_> '                # the execution trace prompt (setopt xtrace). default: '+%N:%i>'

preexec() {
    preexec_called=1
}
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' - (%F{blue}'$branch'%f)'
  fi
}

precmd() {
    if [ "$?" != 0 ] && [ "$preexec_called" = 1 ]; then
        unset preexec_called
#        export PS1="%F{blue}%n%f 🥀 (%/) %F{red}⦁%f "
        #export PS1="%F{blue}%n%f 🥀 ($(felix_pwd_abbr)) %F{red}⦁%f "
        #export PS1="%F{blue}%n%f ($(felix_pwd_abbr)) %F{red}⦁%f "
        export PS1="%F{243}%n%f:%F{197}$(felix_pwd_abbr)%f$(git_branch_name)%F{red} ⦁%f "
        #RPROMPT='%F{red}%(?..[%?] )✘%f'
        RPROMPT='%F{red}✘%f'
    else

        #export PS1="%F{blue}%n%f 🥀 ($(felix_pwd_abbr)) %F{green}⦁%f "
	export PS1="%F{243}%n%f%F{211}@%F{123}%m:%F{197}$(felix_pwd_abbr)%f$(git_branch_name)%F{green} ⦁%f "
#        PROMPT='%B%F{blue}%1~%f%b%F{blue} > %F{black}'
        RPROMPT=''
    fi
}
watch=(notme root) # watch for everyone but me and root

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
autoload -U compinit; compinit # auto complete zsh


# setting some default values
typeset -ga ls_options
typeset -ga grep_options

# Colors on GNU ls(1)
if ls --color=auto / >/dev/null 2>&1; then
    ls_options+=( -hF --color=auto )
    alias lo='ls -alo'
# Colors on FreeBSD and OSX ls(1)
elif ls -G / >/dev/null 2>&1; then
    ls_options+=( -G )
fi
function xcat () {
    emulate -L zsh
    if (( ${#argv} != 1 )) ; then
        printf 'usage: xcat FILE\n' >&2
        return 1
    fi

    [[ -r $1 ]] && cat $1
    return 0
}
# functions
function xsource () {
    if (( ${#argv} < 1 )) ; then
        printf 'usage: xsource FILE(s)...\n' >&2
        return 1
    fi

    while (( ${#argv} > 0 )) ; do
        [[ -r "$1" ]] && source "$1"
        shift
    done
    return 0
}
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' special-dirs ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
/usr/local/bin  \
/usr/sbin       \
/usr/bin        \
/sbin           \
/bin            \
/usr/X11R6/bin

    # complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'
# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
# provide verbose completion information
zstyle ':completion:*'                 verbose true
# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false
# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'
# describe options in full
zstyle ':completion:*:options'         description 'yes'
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'
# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'
# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes
# activate menu
zstyle ':completion:*:history-words'   menu yes
# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true
# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
# command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'
zstyle ':completion:*' use-cache  yes
zstyle ':completion:*:complete:*' cache-path "~/.cache/Wall/"
function is42 () {
    [[ $ZSH_VERSION == 4.<2->* || $ZSH_VERSION == <5->* ]] && return 0
    return 1
}
if is42 ; then
        [[ -r ~/.ssh/config ]] && _ssh_config_hosts=(${${(s: :)${(ps:\t:)${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#Host *}#Host }}}:#*[*?]*}) || _ssh_config_hosts=()
        [[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
        [[ -r /etc/hosts ]] && [[ "$NOETCHOSTS" -eq 0 ]] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(grep -v '^0.0.0.0\|^127\.0\.0\.1\^::1 ' /etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
    else
        _ssh_config_hosts=()
        _ssh_hosts=()
        _etc_hosts=()
fi

#local localname
localname="$(uname -n)"
hosts=(
        "${localname}"
        "$_ssh_config_hosts[@]"
        "$_ssh_hosts[@]"
        "$_etc_hosts[@]"
        localhost
    )

# use generic completion system for programs not yet defined; (_gnu_generic works
# with commands that provide a --help option with "standard" gnu-like output.)
for compcom in cp deborphan df feh fetchipac gpasswd head hnb ipacsum mv \
            pal stow uname ; do
        [[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
done; unset compcom

# see upgrade function in this file
compdef _hosts upgrade

# Use emacs-like key bindings by default:
bindkey -e
# Custom widgets:

## beginning-of-line OR beginning-of-buffer OR beginning of history
## by: Bart Schaefer <schaefer@brasslantern.com>, Bernhard Tittelbach
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}
function beginning-or-end-of-somewhere () {
    local hno=$HISTNO
    if [[ ( "${LBUFFER[-1]}" == $'\n' && "${WIDGET}" == beginning-of* ) || \
      ( "${RBUFFER[1]}" == $'\n' && "${WIDGET}" == end-of* ) ]]; then
        zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
    else
        zle .${WIDGET:s/somewhere/line-hist/} "$@"
        if (( HISTNO != hno )); then
            zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
        fi
    fi
}
zle -N beginning-of-somewhere beginning-or-end-of-somewhere
zle -N end-of-somewhere beginning-or-end-of-somewhere
function commit-to-history () {
    print -rs ${(z)BUFFER}
    zle send-break
}
zle -N commit-to-history
function slash-backward-kill-word () {
    local WORDCHARS="${WORDCHARS:s@/@}"
    # zle backward-word
    zle backward-kill-word
}
zle -N slash-backward-kill-word

# press esc-m for inserting last typed word again (thanks to caphuso!)
function insert-last-typed-word () { zle insert-last-word -- 0 -1 };
zle -N insert-last-typed-word;

# run command line as user root via sudo:
### jump behind the first word on the cmdline.
### useful to add options.

if [[ "$TERM" != dumb ]]; then
    #a1# List files with colors (\kbd{ls \ldots})
    alias ls="command ls ${ls_options:+${ls_options[*]}}"
    #a1# List all files, with colors (\kbd{ls -la \ldots})
    alias la="command ls -la ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, without dotfiles (\kbd{ls -l \ldots})
    alias ll="command ls -l ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, human readable sizes (\kbd{ls -hAl \ldots})
    alias lh="command ls -hAl ${ls_options:+${ls_options[*]}}"
    #a1# List files with long colored list, append qualifier to filenames (\kbd{ls -l \ldots})\\&\quad(\kbd{/} for directories, \kbd{@} for symlinks ...)
    alias l="command ls -l ${ls_options:+${ls_options[*]}}"
else
    alias la='command ls -la'
    alias ll='command ls -l'
    alias lh='command ls -hAl'
    alias l='command ls -l'
fi

# 'hash' some often used directories
#d# start
hash -d think=~/Dropbox/linux/Thinkpad
hash -d dt=~/gits/dots/
hash -d wall=~/stenai/walls
hash -d etc=/etc
hash -d pac=/var/lib/pacman/
hash -d linux=/lib/modules/$(command uname -r)
hash -d log=/var/log
hash -d slog=/var/log/syslog
hash -d src=/usr/src
hash -d www=/serv/www
#d# end

# use ip from iproute2 with color support
if ip -color=auto addr show dev lo >/dev/null 2>&1; then
    alias ip='command ip -color=auto'
fi

if [[ -r /proc/mdstat ]]; then
    alias mdstat='cat /proc/mdstat'
fi

# creates an alias and precedes the command with
# sudo if $EUID is not zero.
# use /var/log/syslog iff present, fallback to journalctl otherwise
if [ -e /var/log/syslog ] ; then
  #a1# Take a look at the syslog: \kbd{\$PAGER /var/log/syslog || journalctl}
  salias llog="$PAGER /var/log/syslog"     # take a look at the syslog
  #a1# Take a look at the syslog: \kbd{tail -f /var/log/syslog || journalctl}
  salias tlog="tail -f /var/log/syslog"    # follow the syslog
elif command -v journalctl >/dev/null; then
  salias llog="journalctl"
  salias tlog="journalctl -f"
fi

#f1# Reload an autoloadable function
function freload () { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
compdef _functions freload

function edalias () {
    [[ -z "$1" ]] && { echo "Usage: edalias <alias_to_edit>" ; return 1 } || vared aliases'[$1]' ;
}
compdef _aliases edalias

function edfunc () {
    [[ -z "$1" ]] && { echo "Usage: edfunc <function_to_edit>" ; return 1 } || zed -f "$1" ;
}
compdef _functions edfunc

#f1# Provides useful information on globbing
function H-Glob () {
    echo -e "
    /      directories
    .      plain files
    @      symbolic links
    =      sockets
    p      named pipes (FIFOs)
    *      executable plain files (0100)
    %      device files (character or block special)
    %b     block special files
    %c     character special files
    r      owner-readable files (0400)
    w      owner-writable files (0200)
    x      owner-executable files (0100)
    A      group-readable files (0040)
    I      group-writable files (0020)
    E      group-executable files (0010)
    R      world-readable files (0004)
    W      world-writable files (0002)
    X      world-executable files (0001)
    s      setuid files (04000)
    S      setgid files (02000)
    t      files with the sticky bit (01000)

  print *(m-1)          # Files modified up to a day ago
  print *(a1)           # Files accessed a day ago
  print *(@)            # Just symlinks
  print *(Lk+50)        # Files bigger than 50 kilobytes
  print *(Lk-50)        # Files smaller than 50 kilobytes
  print **/*.c          # All *.c files recursively starting in \$PWD
  print **/*.c~file.c   # Same as above, but excluding 'file.c'
  print (foo|bar).*     # Files starting with 'foo' or 'bar'
  print *~*.*           # All Files that do not contain a dot
  chmod 644 *(.^x)      # make all plain non-executable files publically readable
  print -l *(.c|.h)     # Lists *.c and *.h
  print **/*(g:users:)  # Recursively match all files that are owned by group 'users'
  echo /proc/*/cwd(:h:t:s/self//) # Analogous to >ps ax | awk '{print $1}'<"
}
alias help-zshglob=H-Glob

# grep for running process, like: 'any vim'
function any () {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <keyword>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}

ssl_hashes=(aes-256-cbc aria-128-cbc )

for sh in ${ssl_hashes}; do
    eval 'enc-'${sh}'() {
        emulate -L zsh
        if [[ -z $1 ]] ; then
            printf '\''usage: %s <file>\n'\'' "ssh-cert-'${sh}'"
            return 1
        fi
        openssl enc -'${sh}' -in $1 -out $1.enc
    }'
done; unset sh


# smart cd function, allows switching to /etc when running 'cd /etc/fstab'

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

rbg() {
    nohup $@ > /tmp/$@ 2>&1 &
}

+x() {
if [ -z "$1" ];then
    echo "Usage : +x filename"
    return 0
else
    chmod u+x $1 2>/dev/null && echo -e "u can now run \e[1;31m$1\e[0m" || echo -e "\e[1;31m[!]\e[0m File \e[1;31m$1\e[0m Does't exits"
    return 0
fi
}


insert_pacman() { zle beginning-of-line; zle -U "pacman " }
replace_rm()  { zle beginning-of-line; zle delete-word; zle -U "rm" }
autoload -U insert_pacman
zle -N insert_pacman 
#zle -N insert-doas insert_doas
autoload -U replace_rm
zle -N replace-rm replace_rm

bindkey '^p'    insert_pacman 
bindkey '\er'    replace-rm
#eval "$(jump shell zsh)"
fpath=(
  /home/smoke/.zsh/completion/
  /home/smoke/.zsh/function
  $fpath
)
autoload -U ~/.zsh/function/**/*(N:t)

#source <(carapace chmod zsh)
#compinit _wa
function vo(){
	dir="~/.local/bin/"
	vim $dir$@
}
zstyle ':completion:*' menu select
autoload zcalc
bindkey "^\e " _expand_alias
alias ps3='ps fo user,ppid,pid,pgid,sid,tty,stat,args'
alias ps4='ps axfo user,ppid,pid,pgid,sid,tty,stat,args'
alias t='type -a'
alias lerr="journalctl -b -u $@ --no-page -p err"
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
alias p="shred -u $@"
alias pd="shred -r -u $@"
alias wipe1="wipe -f -v -z $@"
alias d="gdb -q"
bindkey "\e[f" end-of-word
bindkey '^Y' paste-last-arg
bindkey "\e[b" beginning-of-line
alias op='netstat -tanl | grep LISTEN | sort'
alias opp='lsof -P -n -i tcp -s TCP:LISTEN'
alias p5='php56 -S 127.0.0.1:8080'
alias p7='php7 -S 127.0.0.1:8080'
alias on="google-chrome-stable http://localhost/"$@
alias v="vim $@"
alias syn="sudo pacman -Syy"
# comment
# be in here
