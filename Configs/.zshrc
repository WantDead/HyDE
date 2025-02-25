# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#####   Plugins  ##### 

# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#####   Aliases  ##### 
#####  Add aliases here ##### 

alias cat=bat

if [[ -x "$(which eza)" ]]; then
alias ls='eza' \
    l='eza -lh --icons=auto' \
    ll='eza -lha --icons=auto --sort=name --group-directories-first' \
    ld='eza -lhD --icons=auto' \
    lt='eza --icons=auto --tree'
fi

#  This is your file 
##### Add your configurations here #####

# ZOXIDE

eval "$(zoxide init zsh)"

# TMUX

if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
    tmux new-session -c $PWD
fi
