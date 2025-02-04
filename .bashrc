# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias dots='/usr/bin/git --git-dir=/home/me/.dotfiles/ --work-tree=/home/me'

hist ()
{
	history | awk '{$1=""; gsub(/^ /, "", $0); print $0}'| grep $1 | head -n-1
}

alias h='hist'
alias ls='ls --color=auto'
alias free='free -h'

alias less='less -R'

alias hotp='htop'

alias py='python3'

alias com='git commit -S -m'

alias yt='yt-dlp'

alias got='git'
alias çs='ls'

alias ssh='TERM=xterm-256color ssh'

alias theme='python3 $HOME/.config/colors/test.py'

alias z='zathura -c /dev/null'

alias sus='su'
alias :wq='exit'
alias :q='exit'

venv ()
{
	if [ -d venv ]; then
		prompt="\n(venv) ${PS1:2}"
		source venv/bin/activate
	elif [ -d .venv ]; then
		prompt="\n(.venv) ${PS1:2}"
		source .venv/bin/activate
	else
		read -p "No virtual environment detected. Make a new one? [Y|n]: " yn
		echo Decision: $yn
		if [ "$yn" != "n" ]; then
			python3 -m venv .venv
			prompt="\n(.venv) ${PS1:2}"
			source .venv/bin/activate
			[ -f requirements.txt ] &&
				pip3 install -r requirements.txt ||
			 	echo "No requirements.txt, skipping installing dependencies"
		fi
	fi

	export PS1=$prompt
}

export HISTCONTROL="ignoredups"

a="\[\033[1;34m\] ❯"
if [ $(whoami) == 'root' ]; then
	a="\[\033[1;31m\] ❯"
fi

export PS1="\n\[\033[36m\]\W$a\[\033[00m\] " # ❯❱➤

# From the Arco Linux .bashrc
decomp () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)
                tar xjf $1;;
            *.tar.gz)
                tar xzf $1;;
            *.bz2)
				echo "missing bunzip2";;
            *.rar)
                unrar x $1;;
            *.gz)
                echo "missing gunzip";;
            *.tar)
                tar xf $1;;
            *.tbz2)
                tar xjf $1;;
            *.tgz)
                tar xzf $1;;
            *.zip)
                unzip $1;;
            *.txz)
                xz -d $1;;
            *.Z)
                echo "missing uncompress";;
            *.7z)
				7z x $1;;
                # echo "missing p7zip";;
            *.deb)
                echo "missing ar";;
            *.tar.xz)
                tar xf $1;;
            *.tar.zst)
                echo "missing unzstd";;
            *)
                echo "'$1' cannot be extracted via decomp()";;
        esac;
    else
        echo "'$1' is not a valid file";
    fi
}

export QT_QPA_PLATFORMTHEME=gtk2
export GPG_TTY=$(tty)
export PATH="$PATH:$HOME/.local/bin/"
