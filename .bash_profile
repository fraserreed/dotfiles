export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

export PATH=$PATH:~/.composer/vendor/bin:.

export TEST_MODE=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background
alias ls='ls -laghFG'
alias ll='ls -laghFG'
alias l='ls -laghFG'
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias cd..='cd ..'

# Commom Mac programs
alias reload='source ~/.bash_profile'
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias pwdfailed='syslog -k Time ge -24h | egrep -e "sshd|ftpd|afp|vnc"'

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Git
export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrl input
git config --global core.fileMode true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias push='git pull origin master && git push origin master'
alias pull='git pull origin master'
alias clone='git clone $1'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Docker
if [ -f ~/.docker-export.bash ]; then
  . ~/.docker-export.bash
fi

# PHP development convenience
alias lint='vendor/bin/phpcs -n --colors --standard=PSR2 app'
alias artisan='php artisan'
alias dca='docker-compose run artisan'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Finder: show hidden files
defaults write com.apple.finder AppleShowAllFiles FALSE
# killall Finder

# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
    /usr/bin/which -s fab || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --shortlist)
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

complete -F _fab_completion fab
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

. ~/.dotfiles/z.sh
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
