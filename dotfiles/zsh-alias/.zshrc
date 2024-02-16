
# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


export PATH=$PATH:/usr/lib/jvm/java-17-openjdk/bin


alias l='lvim'
alias c='clear'
alias d='sudo docker'
alias k='sudo lvim /etc/keyd/default.conf'
# alias k='cd /etc/keyd/ && VISUAL=nvim sudoedit default.conf'
alias ips='ip -c -br a'
alias upd='sudo pacman -Syu && sudo pacman -S'
alias ports='sudo netstat -tulanp'
alias nd='mkdir -pv'
alias ls='exa --icons'
alias la='ls -a'
alias aliases='cd && nvim ~/.zshrc'
alias mysql='sudo docker exec -it mysql-docker bash'
alias start-docker='sudo systemctl start docker'
alias obsidian-sync='/home/evan/Obsidian && git push'
alias gc='git add . && git commit -m'
alias gp='git push -u origin main'
alias gs='git status'
alias nconf='cd && cd ~/.config/nvim && nvim'
alias n='nvim'
alias lvimconf='cd && cd ~/.config/lvim'
alias projects='cd && cd projetos/ && ls'
alias home='cd && ls'
alias di='sudo docker image ls'
alias dc='sudo docker container ls'
#alias back='cd /home/evan/projetos/LabTech-EngII/src/back-end'
alias back='cd /home/evan/Machine-Learnig-App/back-end'
alias front='cd /home/evan/Machine-Learnig-App/front-end/'
alias t='tmux a -t'
alias tn='tmux new-session -s'
alias d='dolphin .'
alias ncode='tmux new-session -s code'
alias code='tmux a -t code'

