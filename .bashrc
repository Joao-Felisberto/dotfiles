alias dots='/usr/bin/git --git-dir=/home/me/.dotfiles/ --work-tree=/home/me'

alias a4b='antlr4-build'
alias a4-jar-run='antlr4-jar-run'
alias a4-javac='antlr4-javac'
alias a4m='antlr4-main'
alias a4t='antlr4-test'
alias a4c='antlr4-clean'
alias a4cc='antlr4-clean && rm *.java'
alias a4j='antlr4-java'
alias a4l='antlr4-listener'
alias a4r='antlr4-run'
alias a4v='antlr4-visitor'

alias a4rr='antlr4-build && antlr4-run'

a4v-all() {
	#echo "antlr4-visitor $1 $2"
	antlr4-visitor $1 $2
	antlr4-main  -v "$1.java"
	antlr4-build
}

dpic ()
{
	sudo ldpic32 "out/98003_${1::-2}.hex" && sudo pterm
}

hist ()
{
	history | awk '{$1=""; gsub(/^ /, "", $0); print $0}'| grep $1 | head -n-1
}
#alias h="cat /home/$USER/.bash_history | grep"
alias h='hist'
alias ls='ls --color=auto'
alias free='free -h'

alias less='less -R'

alias hotp='htop'

alias nb='notebook'

alias py='python3'
alias python='python3'

alias com='git commit -S -m'

alias yt='yt-dlp'

alias got='git'
alias çs='ls'

alias ploudos='sudo wg-quick up wg0'

#alias term='echo "cd $(pwd)" | ($TERM & disown) > /dev/null'
alias ssh='TERM=xterm-256color ssh'

alias theme='python3 $HOME/.config/colors/test.py'

alias z='zathura -c /dev/null'

alias sus='su'
alias :wq='exit'
alias :q='exit'

term ()
{
	echo "$# $@ $1"
	if [ -v $1 ]
	then
		echo "cd $1" | ($TERM & disown) > /dev/null
	else
		echo "cd $(pwd)" | ($TERM & disown) > /dev/null
	fi
}

aula ()
{
	cd "$HOME/uni/51/${1^^}/apontamentos/"
}
alias a='aula'

nbedit ()
{
	#vim $1
	nvim .
	pandoc --toc "$1" -o "pdf/${1::-3}.pdf"
}

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
#export PS1='\n\[\033[36m\]\W \$>\[\033[00m\] '

a="\[\033[1;34m\] ❯"
if [ $(whoami) == 'root' ]; then
	a="\[\033[1;31m\] ❯"
fi

export PS1="\n\[\033[36m\]\W$a\[\033[00m\] " # ❯❱➤

export PATH="/home/me/scripts:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/me/Documents/uni/Ano2-Sem2/AC2/software/pic32mx/bin/"

#export ANTLR4_PATH="/usr/local/lib"
# export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:"

# alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
# alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

alias sonar='/home/me/uni/41/AEV/projetos/sonar-scanner-4.7.0.2747-linux/bin/sonar-scanner'

#alias sonar='/home/me/uni/41/AEV/projetos/sonar-scanner-4.7.0.2747-linux/bin/sonar-scanner \
#  -Dsonar.projectKey=pump.io \
#    -Dsonar.sources=. \
#	  -Dsonar.host.url=http://localhost:9000 \
#	    -Dsonar.login=sqp_2777bb40fbcfc8536d37f16ce63e03ba9d7bf624'

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
# export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:.:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:"
# export ANTLR4_PATH="/usr/local/lib"

export QT_QPA_PLATFORMTHEME=gtk2
#export QT_QPA_PLATFORMTHEME=qt6gtk2

export GPG_TTY=$(tty)
# export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:.:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:.:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:"
# export ANTLR4_PATH="/usr/local/lib"

export PATH="$PATH:/home/me/.flutter/flutter/bin"
. "$HOME/.cargo/env"
source $HOME/.nix-profile/etc/profile.d/nix.sh
