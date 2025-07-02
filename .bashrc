#echo " ฅ(•- •マ"
echo " (•_•)"
setxkbmap -option caps:escape

#PS1='\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\H\[\e[0m\]:\[\e[1;33m\]\W\[\e[0m\]>'
PS1=':\[\e[1;33m\]\W\[\e[0m\]>'
#PS1=':\[\e[1;31m\]\W\[\e[0m\]>'
#PS1='\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;31m\]\H\[\e[0m\]:\[\e[1;33m\]\W\[\e[0m\]>'

alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias l='ls -CF'
alias tr='tree -L 1'
alias cl='clear'
alias vim='nvim'
alias cat='bat --color=always --style=numbers'
bind '"\C-o": "clear && cdfzf\n"'
bind '"\C-v": "clear && vfzf\n"'
#bind '"\t": menu-complete'

cdfzf(){
	cd "$(fd -H . $HOME -t d | fzf --preview="tree -L 2 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && tree -L 1
}

vfzf(){
	local file=$(fd -H . $HOME -t f | fzf --preview="batcat --color=always --style=numbers {}" --bind="space:toggle-preview" --preview-window=:hidden)
    if [[ -z "$file" ]]; then
        clear && return
    else
        vim "$file"
    fi
}
