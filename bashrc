# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# prompt
FMT_BOLD="\e[1m"
FMT_RESET="\e[0m"
FMT_UNBOLD="\e[21m"
FG_BLACK="\e[30m"
FG_BLUE="\e[34m"
FG_CYAN="\e[36m"
FG_GREEN="\e[32m"
FG_MAGENTA="\e[35m"
FG_RED="\e[31m"
FG_WHITE="\e[97m"
BG_BLUE="\e[44m"
BG_GREEN="\e[42m"
BG_MAGENTA="\e[45m"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

export PS1=\
"\n\[${BG_GREEN}\] \[${FG_BLACK}\]\u \[${FG_GREEN}${BG_BLUE}\] "\
"\[${FG_BLACK}\]\w \[${FMT_RESET}${FG_BLUE}\]"\
"${FMT_RESET}${FG_CYAN}"\
"\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"\[${FG_BLUE}${BG_MAGENTA}\] ${FG_BLACK}🔀 BRANCH ${FMT_RESET}${FG_MAGENTA}\")"\
"\n \[${FG_GREEN}\]└─ \[${FG_CYAN}\]\$ \[${FMT_RESET}\]"

alias ll='ls -lAh'
alias cp='cp -dr'
alias rm='rm -dr'
alias mv='mv -dr'
alias l.='ls -dlAh .* --color=auto'
alias gitc='git commit -am'
alias gull='git pull'
alias gush='git push'
alias gupdate='gull && gush'
alias gupdatef='gull && gush -f'
alias update='sudo dnf update --all'

unset rc
