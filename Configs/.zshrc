# Add user configurations here
# For HyDE not to touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#####   Plugins  ##### 

# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#####   Aliases  ##### 
#####  Add aliases here ##### 

alias cat=bat

#VPN
alias vpn-con="openvpn3 session-start --config WB"
alias vpn-recon="openvpn3 session-manage --config WB --restart"
alias vpn-list="openvpn3 sessions-list"
alias vpn-discon="openvpn3 session-manage --config WB --disconnect"

# fix non-working script
if [[ -x "$(which eza)" ]]; then
alias ls='eza' \
    l='eza -lh --icons=auto' \
    ll='eza -lha --icons=auto --sort=name --group-directories-first' \
    ld='eza -lhD --icons=auto' \
    lt='eza --icons=auto --tree'
fi

# Define your proxy
PROXY_URL="http://localhost:12334"

# Function to check if the proxy is active
is_proxy_active() {
    curl -s --proxy "$PROXY_URL" --head https://aur.archlinux.org/ | grep -q "200 Connection established"
}

# Function to run yay with proxy if available
yay() {
    if is_proxy_active; then
        HTTPS_PROXY="$PROXY_URL" command yay "$@"
    else
        command yay "$@"
    fi
}

#  This is your file 
##### Add your configurations here #####

# ZOXIDE

eval "$(zoxide init zsh)"

# TMUX

if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
    tmux new-session -c $PWD
fi

# FZF

eval "$(fzf --zsh)"

alias fzf="fzf | xargs -o nvim"


fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}

