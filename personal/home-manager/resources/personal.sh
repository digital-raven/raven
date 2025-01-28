set -o vi

alias cls='clear;clear'

# Source bash auto-complete
complete_dir="$HOME/.venv/etc/bash_completion.d"
if [ -d "$complete_dir" ]
then
    cd $complete_dir
    for i in `ls`
    do
        source $i
    done
    cd - > /dev/null
fi

export EDITOR=vim
export VISUAL=vim

alias gla='git log --graph --oneline --date-order --decorate=short --all'

function ytdl {
    if [ $# -ne 2 ]; then
        echo "Download a YouTube video as a specific format"
        echo "usage: ytdl <url> <dest.format>"
        echo ""
        echo "eg. ytdl https://www.youtube.com/watch?v=sVx1mJDeUjY after-dark.mp3"
        return 1
    fi

    local url=$1
    local dest=$2

    local tmpout=$(mktemp)
    yt-dlp -o "$tmpout" "$url"
    if [ $? != 0 ]
    then
        echo "ERROR: yt-dlp could not download the video." >&2
        rm "$tmpout"
        return 1
    fi

    ffmpeg -i "$tmpout.webm" "$dest"
    rm "$tmpout.webm"
}

# Unlimited and global bash history
export HISTSIZE=-1
export HISTCONTROL="erasedups $HISTCONTROL"
export HISTFILE=$HOME/.bash_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# append to the history file, don't overwrite it
shopt -s histappend

# cd to the first item reported by find.
function findcd {
    cd $(find $@ -print -quit | head -n 1)
}

# Push the current git branch to origin, with force
function git-force-push {
    git push origin $(git branch --show-current) --force
}

# Switch to a git test branch.
function git-test-switch {
    if [ $(git branch --show-current) == testbranch ]
    then
        echo "Already on testbranch" >&2
        return 1
    fi

    git branch -D testbranch
    git checkout -b testbranch

    return 0
}

# Prints your public IP address.
function ifconfig-public {
    wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1
}

# Set gnome-terminal title.
function set-title {
    if [[ -z "$ORIG" ]]; then
        ORIG=$PS1
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
}

# Rename all files in a dir to the date-time of their creation.
function date-rename() {
    read -p "Rename all files in $pwd to their creation dates? (y/N) " -n 1 -r
    echo
    read -p "Are you sure? (y/N) " -n 1 -r
    echo

    proceed="${REPLY:-N}"

    if [ "$REPLY" != "y" ]
    then
        return 1
    fi

    for i in `ls`
    do
        filename=$(basename -- "$i")
        extension="${filename##*.}"
        filename="${filename%.*}"
    
        mv $i "$(date -r $i +"%Y-%m-%d_%H-%M-%S").$extension"
    done
}

# Double ended fork-bomb. Do not type. Ravens carry guns.
# alias emacs=":(){ :|:& };:" 
