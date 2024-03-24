function bk () { # bk to file it will add date to end file 
    emulate -L zsh
    local current_date=$(date -u "+%Y%m%dT%H%M%SZ")
    local clean keep move verbose result all to_bk
    setopt extended_glob
    keep=1
    while getopts ":hacmrv" opt; do
        case $opt in
            a) (( all++ ));;
            c) unset move clean && (( ++keep ));;
            m) unset keep clean && (( ++move ));;
            r) unset move keep && (( ++clean ));;
            v) verbose="-v";;
            \?) bk -h >&2; return 1;;
        esac
    done
    shift "$((OPTIND-1))"
    if (( keep > 0 )); then
            for to_bk in "$@"; do
                cp $verbose -pR "${to_bk%/}" "${to_bk%/}_$current_date"
                (( result += $? ))
            done
        fi
    if (( move > 0 )); then
        while (( $# > 0 )); do
            mv $verbose "${1%/}" "${1%/}_$current_date"
            (( result += $? ))
            shift
        done
    elif (( clean > 0 )); then
        if (( $# > 0 )); then
            for to_bk in "$@"; do
                rm $verbose -rf "${to_bk%/}"_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
                (( result += $? ))
            done
        else
            if (( all > 0 )); then
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z(D)
            else
                rm $verbose -rf *_[0-9](#c8)T([0-1][0-9]|2[0-3])([0-5][0-9])(#c2)Z
            fi
            (( result += $? ))
        fi
    fi
    return $result
}

function cl () { # cd and ls
    emulate -L zsh
    cd $1 && ls -a
}
function cd () { # better cd if you do cd /etc/gruba.conf it /etc
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}

#f5# Create Directory and \kbd{cd} to it
function mkcd () {
    if (( ARGC != 1 )); then
        printf 'usage: mkcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf '`%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

function track () {
	if ! command -v entr >/dev/null;then
		echo "You need entr"
	fi
	type=$(file $1 | awk '{print $2}')
	if [ -f $1 ] && [ ${1/*.} = "py" ];then 
		echo ${1} | entr ${2:-\-c} python3 ${1}
	else if [ -f $1 ] && [ ${1/*.} = "sh" ] || [ $type = "Bourne-Again" ];then
		echo $1 | entr ${2:-\-c} bash $1
	else if [ -f $1 ] && [ ${1/*.} = "cpp" ] || [ $type = "C++" ];then
		#mak=$(g++ $1 -o ${1/.*} | ./${1/.*})
		#echo $1 | entr $mak
		echo $1 | entr ${2:-\-c} sh ${2:-\-c} "echo ;make ${1/.*};./${1/.*}"
	fi
	fi
	fi
}
#f5# Create temporary directory and \kbd{cd} to it
function cdt () {
    builtin cd "$(mktemp -d)"
    builtin pwd
}

#f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
function accessed () {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

#f5# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
function changed () {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
function modified () {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

#f2# Find history events by search pattern and list them by date.
function whatwhen () {
    emulate -L zsh
    local usage help ident format_l format_s first_char remain first last
    usage='USAGE: whatwhen [options] <searchstring> <search range>'
    help='Use `whatwhen -h'\'' for further explanations.'
    ident=${(l,${#${:-Usage: }},, ,)}
    format_l="${ident}%s\t\t\t%s\n"
    format_s="${format_l//(\\t)##/\\t}"
    # Make the first char of the word to search for case
    # insensitive; e.g. [aA]
    first_char=[${(L)1[1]}${(U)1[1]}]
    remain=${1[2,-1]}
    # Default search range is `-100'.
    first=${2:-\-100}
    # Optional, just used for `<first> <last>' given.
    last=$3
    case $1 in
        ("")
            printf '%s\n\n' 'ERROR: No search string specified. Aborting.'
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (-h)
            printf '%s\n\n' ${usage}
            print 'OPTIONS:'
            printf $format_l '-h' 'show help text'
            print '\f'
            print 'SEARCH RANGE:'
            printf $format_l "'0'" 'the whole history,'
            printf $format_l '-<n>' 'offset to the current history number; (default: -100)'
            printf $format_s '<[-]first> [<last>]' 'just searching within a give range'
            printf '\n%s\n' 'EXAMPLES:'
            printf ${format_l/(\\t)/} 'whatwhen grml' '# Range is set to -100 by default.'
            printf $format_l 'whatwhen zsh -250'
            printf $format_l 'whatwhen foo 1 99'
        ;;
        (\?)
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (*)
            # -l list results on stout rather than invoking $EDITOR.
            # -i Print dates as in YYYY-MM-DD.
            # -m Search for a - quoted - pattern within the history.
            fc -li -m "*${first_char}${remain}*" $first $last
        ;;
    esac
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
adbcurrent() {
  adb shell "dumpsys activity activities | grep mResumedActivity" | perl -pe 's/.+(com.+?)\/.*/$1/'
}

shredd() {
    BYTES=`wc -c < "$@"`
    for i in `seq 1 7`; do
        dd if=/dev/urandom of="$@" bs=$BYTES count=1 conv=notrunc status=none
    done
    rm -f "$@"
}

log_history() {
	MYHISTFILE="~/.zsh_history"
    	echo "$(date '+%Y-%m-%d %H:%M:%S') $HOSTNAME:$$ $PWD ($1) $(history 1)" >> $MYHISTFILE
}
fe() {
	_file=$(find /usr/share/doc/arch-wiki/html/en/ -iname "$@*" -type f | fzf --delimiter / --with-nth -1) 
	if [[ -z $_file ]];then
		echo "NONE SELECTED"
		return 1
	else
     	google-chrome-stable $_file
	fi
}
