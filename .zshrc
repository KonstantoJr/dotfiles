# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/konstantinos/.zshrc'
PS1='%n:%B%F{240}%1~%f%b%# '
autoload -Uz compinit
compinit
# End of lines added by compinstall
alias ls='ls -lhNF --color=auto --group-directories-first'
alias vim='nvim'
set -o vi
###############################################################
#Custom alias for scripts
#Config alias for git that stores my dots files
alias config='/usr/bin/git --git-dir=/home/konstantinos/.cfg/ --work-tree=/home/konstantinos'
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'
alias upvpn='sudo openvpn --config /etc/openvpn/UPatras.ovpn --daemon'
alias killvpn='sudo kill $(pidof openvpn)'
# zsh extensions below
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh 2>/dev/null
# SSH AGENT
eval `keychain --eval id_rsa github`
# NVM setup
source /usr/share/nvm/init-nvm.sh
