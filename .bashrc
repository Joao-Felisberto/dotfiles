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

alias h='history | grep'
alias ls='ls --color=auto'
alias free='free -h'

alias hotp='htop'

alias nb='notebook'

alias py='python3'
alias python='python3'

alias term='echo "cd $(pwd)" | ($TERM & disown) > /dev/null'
alias theme='python3 $HOME/.config/colors/test.py'

alias sus='su'

aula ()
{
	cd "$HOME/Documents/uni/Ano2-Sem2/${1^^}/apontamentos/"
}
alias a='aula'

nbedit ()
{
	vim $1
	pandoc --toc "$1" -so "pdf/${1::-3}.pdf"
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
#export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:"

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
            *.Z)
                echo "missing uncompress";;
            *.7z)
                echo "missing 7z";;
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
export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:.:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/ST-4.3.1.jar:"
export ANTLR4_PATH="/usr/local/lib"
