declare -A abk
setopt extendedglob
setopt interactivecomments
abk=(
#   key   # value                  (#d additional doc string)
#A# start
    '...'  '../..'
    '....' '../../..'
    'BG'   '& exit'
    'C'    '| wc -l'
    'G'    '|& grep '${grep_options:+"${grep_options[*]}"}
    'H'    '| head'
    'Hl'   ' --help |& less -r'    #d (Display help in pager)
    'L'    '| less'
    'LL'   '|& less -r'
    'M'    '| most'
    'N'    '&>/dev/null'           #d (No Output)
    'R'    '| tr A-z N-za-m'       #d (ROT13)
    'SL'   '| sort | less'
    'S'    '| sort -u'
    'T'    '| tail'
    'V'    '|& vim -'
#A# end
    'co'   './configure && make && sudo make install'
)

function zleiab () {
    emulate -L zsh
    setopt extendedglob
    local MATCH

    LBUFFER=${LBUFFER%%(#m)[.\-+:|_a-zA-Z0-9]#}
    LBUFFER+=${abk[$MATCH]:-$MATCH}
}

zle -N zleiab
function help-show-abk () {
bind2maps emacs viins       -- -s '^x.' zleiab
    local -A help_zle_keybindings
    help_zle_keybindings['<Ctrl>@']="set MARK"
    help_zle_keybindings['<Ctrl>x<Ctrl>j']="vi-join lines"
    help_zle_keybindings['<Ctrl>x<Ctrl>b']="jump to matching brace"
    help_zle_keybindings['<Ctrl>x<Ctrl>u']="undo"
    help_zle_keybindings['<Ctrl>_']="undo"
    help_zle_keybindings['<Ctrl>x<Ctrl>f<c>']="find <c> in cmdline"
    help_zle_keybindings['<Ctrl>a']="goto beginning of line"
    help_zle_keybindings['<Ctrl>e']="goto end of line"
    help_zle_keybindings['<Ctrl>t']="transpose charaters"
    help_zle_keybindings['<Alt>t']="transpose words"
    help_zle_keybindings['<Alt>s']="spellcheck word"
    help_zle_keybindings['<Ctrl>k']="backward kill buffer"
    help_zle_keybindings['<Ctrl>u']="forward kill buffer"
    help_zle_keybindings['<Ctrl>y']="insert previously killed word/string"
    help_zle_keybindings["<Alt>'"]="quote line"
    help_zle_keybindings['<Alt>"']="quote from mark to cursor"
    help_zle_keybindings['<Alt><arg>']="repeat next cmd/char <arg> times (<Alt>-<Alt>1<Alt>0a -> -10 times 'a')"
    help_zle_keybindings['<Alt>u']="make next word Uppercase"
    help_zle_keybindings['<Alt>l']="make next word lowercase"
    help_zle_keybindings['<Ctrl>xG']="preview expansion under cursor"
    help_zle_keybindings['<Alt>q']="push current CL into background, freeing it. Restore on next CL"
    help_zle_keybindings['<Alt>.']="insert (and interate through) last word from prev CLs"
    help_zle_keybindings['<Alt>,']="complete word from newer history (consecutive hits)"
    help_zle_keybindings['<Alt>m']="repeat last typed word on current CL"
    help_zle_keybindings['<Ctrl>v']="insert next keypress symbol literally (e.g. for bindkey)"
    help_zle_keybindings['!!:n*<Tab>']="insert last n arguments of last command"
    help_zle_keybindings['!!:n-<Tab>']="insert arguments n..N-2 of last command (e.g. mv s s d)"
    help_zle_keybindings['<Alt>h']="show help/manpage for current command"
  zle -M "$(print "Available abbreviations for expansion:"; print -a -C 2 ${(kv)abk})"
}

zle -N help-show-abk

# press "ctrl-x d" to insert the actual date in the form yyyy-mm-dd
function insert-datestamp () { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
zle -N insert-datestamp
function zrcautoload () {
    emulate -L zsh
    setopt extended_glob
    local fdir ffile
    local -i ffound

    ffile=$1
    (( ffound = 0 ))
    for fdir in ${fpath} ; do
        [[ -e ${fdir}/${ffile} ]] && (( ffound = 1 ))
    done

    (( ffound == 0 )) && return 1
    if [[ $ZSH_VERSION == 3.1.<6-> || $ZSH_VERSION == <4->* ]] ; then
        autoload -U ${ffile} || return 1
    else
        autoload ${ffile} || return 1
    fi
    return 0
}


function sudo-command-line () {
    [[ -z $BUFFER ]] && zle up-history
    local cmd="sudo "
    if [[ ${BUFFER} == ${cmd}* ]]; then
        CURSOR=$(( CURSOR-${#cmd} ))
        BUFFER="${BUFFER#$cmd}"
    else
        BUFFER="${cmd}${BUFFER}"
        CURSOR=$(( CURSOR+${#cmd} ))
    fi
    zle reset-prompt
}
zle -N sudo-command-line
function inplaceMkDirs () {
    # Press ctrl-xM to create the directory under the cursor or the selected area.
    # To select an area press ctrl-@ or ctrl-space and use the cursor.
    # Use case: you type "mv abc ~/testa/testb/testc/" and remember that the
    # directory does not exist yet -> press ctrl-XM and problem solved
    local PATHTOMKDIR
    if ((REGION_ACTIVE==1)); then
        local F=$MARK T=$CURSOR
        if [[ $F -gt $T ]]; then
            F=${CURSOR}
            T=${MARK}
        fi
        # get marked area from buffer and eliminate whitespace
        PATHTOMKDIR=${BUFFER[F+1,T]%%[[:space:]]##}
        PATHTOMKDIR=${PATHTOMKDIR##[[:space:]]##}
    else
        local bufwords iword
        bufwords=(${(z)LBUFFER})
        iword=${#bufwords}
        bufwords=(${(z)BUFFER})
        PATHTOMKDIR="${(Q)bufwords[iword]}"
    fi
    [[ -z "${PATHTOMKDIR}" ]] && return 1
    PATHTOMKDIR=${~PATHTOMKDIR}
    if [[ -e "${PATHTOMKDIR}" ]]; then
        zle -M " path already exists, doing nothing"
    else
        zle -M "$(mkdir -p -v "${PATHTOMKDIR}")"
        zle end-of-line
    fi
}

zle -N inplaceMkDirs

function bind2maps () {
    local i sequence widget
    local -a maps

    while [[ "$1" != "--" ]]; do
        maps+=( "$1" )
        shift
    done
    shift

    if [[ "$1" == "-s" ]]; then
        shift
        sequence="$1"
    else
        sequence="${key[$1]}"
    fi
    widget="$2"

    [[ -z "$sequence" ]] && return 1

    for i in "${maps[@]}"; do
        zrcbindkey -M "$i" "$sequence" "$widget"
    done
}

function zrcautozle () {
    emulate -L zsh
    local fnc=$1
    zrcautoload $fnc && zle -N $fnc
}

function zrcgotwidget () {
    (( ${+widgets[$1]} ))
}

function zrcgotkeymap () {
    [[ -n ${(M)keymaps:#$1} ]]
}
function zrcbindkey () {
    if (( ARGC )) && zrcgotwidget ${argv[-1]}; then
        bindkey "$@"
    fi
}
# Guidelines for adding key bindings:
#
#   - Do not add hardcoded escape sequences, to enable non standard key
#     combinations such as Ctrl-Meta-Left-Cursor. They are not easily portable.
#
#   - Adding Ctrl characters, such as '^b' is okay; note that '^b' and '^B' are
#     the same key.
#
#   - All keys from the $key[] mapping are obviously okay.
#
#   - Most terminals send "ESC x" when Meta-x is pressed. Thus, sequences like
#     '\ex' are allowed in here as well.
function insert-last-typed-word () { zle insert-last-word -- 0 -1 };
zle -N insert-last-typed-word;

function grml-zsh-fg () {
  if (( ${#jobstates} )); then
    zle .push-input
    [[ -o hist_ignore_space ]] && BUFFER=' ' || BUFFER=''
    BUFFER="${BUFFER}fg"
    zle .accept-line
  else
    zle -M 'No background jobs. Doing nothing.'
  fi
}
zle -N grml-zsh-fg
fzf-history-widget() {
  local selected
  if selected=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -q "$LBUFFER" +s -e -i --tac --height 10% | sed 's/ *[0-9]* *//' ); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N   fzf-history-widget
bindkey '\ep' fzf-history-widget
#bind2maps emacs viins       -- -s "^n" fze-me
zrcautozle insert-files
zrcautozle edit-command-line
zrcautozle insert-unicode-char
# ---------------- KEYBINDS ---------------- ~
bind2maps emacs             -- Home   beginning-of-somewhere
bind2maps       viins vicmd -- Home   vi-beginning-of-line
bind2maps emacs             -- End    end-of-somewhere
bind2maps       viins vicmd -- End    vi-end-of-line
bind2maps emacs viins       -- Insert overwrite-mode
bind2maps             vicmd -- Insert vi-insert
bind2maps emacs             -- Delete delete-char
bind2maps       viins vicmd -- Delete vi-delete-char
bind2maps emacs viins vicmd -- Up     up-line-or-search
bind2maps emacs viins vicmd -- Down   down-line-or-search
bind2maps emacs             -- Left   backward-char
bind2maps       viins vicmd -- Left   vi-backward-char
bind2maps emacs             -- Right  forward-char
bind2maps       viins vicmd -- Right  vi-forward-char
#k# Perform abbreviation expansion
bind2maps emacs viins       -- -s '^x.' zleiab
#k# Display list of abbreviations that would expand
bind2maps emacs viins       -- -s '^xb' help-show-abk
#k# mkdir -p <dir> from string under cursor or marked area
bind2maps emacs viins       -- -s '^xM' inplaceMkDirs
#k# display help for keybindings and ZLE
#bind2maps emacs viins       -- -s '^xz' help-zle
#k# Insert files and test globbing
bind2maps emacs viins       -- -s "^xf" insert-files
#k# Edit the current line in \kbd{\$EDITOR}
bind2maps emacs viins       -- -s '\ee' edit-command-line
#k# search history backward for entry beginning with typed text
bind2maps emacs viins       -- -s '^xp' history-beginning-search-backward-end
#k# search history forward for entry beginning with typed text
bind2maps emacs viins       -- -s '^xP' history-beginning-search-forward-end
#k# search history backward for entry beginning with typed text
bind2maps emacs viins       -- PageUp history-beginning-search-backward-end
#k# search history forward for entry beginning with typed text
bind2maps emacs viins       -- PageDown history-beginning-search-forward-end
bind2maps emacs viins       -- -s "^x^h" commit-to-history

#k# Kill left-side word or everything up to next slash
bind2maps emacs viins       -- -s '\ev' slash-backward-kill-word
#k# Kill left-side word or everything up to next slash
bind2maps emacs viins       -- -s '\e^h' slash-backward-kill-word
#k# Kill left-side word or everything up to next slash
bind2maps emacs viins       -- -s '\e^?' slash-backward-kill-word
# Do history expansion on space:
bind2maps emacs viins       -- -s ' ' magic-space
#k# Trigger menu-complete
bind2maps emacs viins       -- -s '\ei' menu-complete  # menu completion via esc-i
#k# Insert a timestamp on the command line (yyyy-mm-dd)
bind2maps emacs viins       -- -s '^xd' insert-datestamp
#k# Insert last typed word
bind2maps emacs viins       -- -s "\em" insert-last-typed-word
#k# A smart shortcut for \kbd{fg<enter>}
bind2maps emacs viins       -- -s '^z' grml-zsh-fg
#k# prepend the current command with "sudo"
bind2maps emacs viins       -- -s "^xp" sudo-command-line
#k# jump to after first word (for adding options)
bind2maps emacs viins       -- -s '^x1' jump_after_first_word
#k# complete word from history with menu
bind2maps emacs viins       -- -s "^x^x" hist-complete

# insert unicode character
# usage example: 'ctrl-x i' 00A7 'ctrl-x i' will give you an §
# See for example http://unicode.org/charts/ for unicode characters code
#k# Insert Unicode character
bind2maps emacs viins       -- -s '^xi' insert-unicode-char

# use the new *-pattern-* widgets for incremental history search
 cmd_to_clip () { clc <<< $BUFFER }
 zle -N cmd_to_clip
 bindkey '^b' cmd_to_clip
if zrcgotwidget history-incremental-pattern-search-backward; then
    for seq wid in '^r' history-incremental-pattern-search-backward \
                   '^s' history-incremental-pattern-search-forward
    do
        bind2maps emacs viins vicmd -- -s $seq $wid
    done
    builtin unset -v seq wid
fi

if zrcgotkeymap menuselect; then
    #m# k Shift-tab Perform backwards menu completion
    bind2maps menuselect -- BackTab reverse-menu-complete

    #k# menu selection: pick item but stay in the menu
    bind2maps menuselect -- -s '\e^M' accept-and-menu-complete
    # also use + and INSERT since it's easier to press repeatedly
    bind2maps menuselect -- -s '+' accept-and-menu-complete
    bind2maps menuselect -- Insert accept-and-menu-complete

    # accept a completion and try to complete again by using menu
    # completion; very useful with completing directories
    # by using 'undo' one's got a simple file browser
    bind2maps menuselect -- -s '^o' accept-and-infer-next-history
fi

# Finally, here are still a few hardcoded escape sequences; Special sequences
# like Ctrl-<Cursor-key> etc do suck a fair bit, because they are not
# standardised and most of the time are not available in a terminals terminfo
# entry.
#
# While we do not encourage adding bindings like these, we will keep these for
# backward compatibility.

## use Ctrl-left-arrow and Ctrl-right-arrow for jumping to word-beginnings on
## the command line.
# URxvt sequences:
bind2maps emacs viins vicmd -- -s '\eOc' forward-word
bind2maps emacs viins vicmd -- -s '\eOd' backward-word
# These are for xterm:
bind2maps emacs viins vicmd -- -s '\e[1;5C' forward-word
bind2maps emacs viins vicmd -- -s '\e[1;5D' backward-word
## the same for alt-left-arrow and alt-right-arrow
# URxvt again:
bind2maps emacs viins vicmd -- -s '\e\e[C' forward-word
bind2maps emacs viins vicmd -- -s '\e\e[D' backward-word
# Xterm again:
bind2maps emacs viins vicmd -- -s '^[[1;3C' forward-word
bind2maps emacs viins vicmd -- -s '^[[1;3D' backward-word
# Also try ESC Left/Right:
bind2maps emacs viins vicmd -- -s '\e'${key[Right]} forward-word
bind2maps emacs viins vicmd -- -s '\e'${key[Left]}  backward-word

# autoloading

zrcautoload zmv
zrcautoload zed
# creates an alias and precedes the command with
# sudo if $EUID is not zero.
function salias () {
    emulate -L zsh
    local only=0 ; local multi=0
    local key val
    while getopts ":hao" opt; do
        case $opt in
            o) only=1 ;;
            a) multi=1 ;;
            h)
                printf 'usage: salias [-hoa] <alias-expression>\n'
                printf '  -h      shows this help text.\n'
                printf '  -a      replace '\'' ; '\'' sequences with '\'' ; sudo '\''.\n'
                printf '          be careful using this option.\n'
                printf '  -o      only sets an alias if a preceding sudo would be needed.\n'
                return 0
                ;;
            *) salias -h >&2; return 1 ;;
        esac
    done
    shift "$((OPTIND-1))"

    if (( ${#argv} > 1 )) ; then
        printf 'Too many arguments %s\n' "${#argv}"
        return 1
    fi

    key="${1%%\=*}" ;  val="${1#*\=}"
    if (( EUID == 0 )) && (( only == 0 )); then
        alias -- "${key}=${val}"
    elif (( EUID > 0 )) ; then
        (( multi > 0 )) && val="${val// ; / ; sudo }"
        alias -- "${key}=sudo ${val}"
    fi

    return 0
}

# Check if we can read given files and source those we can.
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

# Check if we can read a given file and 'cat(1)' it.
function xcat () {
    emulate -L zsh
    if (( ${#argv} != 1 )) ; then
        printf 'usage: xcat FILE\n' >&2
        return 1
    fi

    [[ -r $1 ]] && cat $1
    return 0
}


function is4 () {
    [[ $ZSH_VERSION == <4->* ]] && return 0
    return 1
}
#f1# List symlinks in detail (more detailed version of 'readlink -f', 'whence -s' and 'namei -l')
function sll () {
    if [[ -z ${1} ]] ; then
        printf 'Usage: %s <symlink(s)>\n' "${0}"
        return 1
    fi

    local file jumpd curdir
    local -i 10 RTN LINODE i
    local -a    SEENINODES
    curdir="${PWD}"
    RTN=0

    for file in "${@}" ; do
        SEENINODES=()
        ls -l "${file:a}"   || RTN=1

        while [[ -h "$file" ]] ; do
            if is4 ; then
                LINODE=$(zstat -L +inode "${file}")
                for i in ${SEENINODES} ; do
                    if (( ${i} == ${LINODE} )) ; then
                        builtin cd -q "${curdir}"
                        print 'link loop detected, aborting!'
                        return 2
                    fi
                done
                SEENINODES+=${LINODE}
            fi
            jumpd="${file:h}"
            file="${file:t}"

            if [[ -d ${jumpd} ]] ; then
                builtin cd -q "${jumpd}"  || RTN=1
            fi
            file=$(readlink "$file")

            jumpd="${file:h}"
            file="${file:t}"

            if [[ -d ${jumpd} ]] ; then
                builtin cd -q "${jumpd}"  || RTN=1
            fi

            ls -l "${PWD}/${file}"     || RTN=1
        done
        shift 1
        if (( ${#} >= 1 )) ; then
            print ""
        fi
        builtin cd -q "${curdir}"
    done
    return ${RTN}
}

if zrcautoload history-search-end; then
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end  history-search-end
fi
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
# history

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#v#
HISTFILE=${HISTFILE:-${ZDOTDIR:-${HOME}}/.zsh_history}
HISTSIZE=10500  || HISTSIZE=105000
SAVEHIST=10000 || SAVEHIST=10000 # useful for setopt append_history
function gt() {

# https://github.com/mgechev/dotfiles/blob/a92d09fd70e65137d9756b743ec60a4fbea6025f/.functions#L316-L319
  git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative

}

#
function jump_after_first_word () {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}
zle -N jump_after_first_word
