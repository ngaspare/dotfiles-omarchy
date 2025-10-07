# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# My custom aliases
alias t='tmux attach-session || tmux new-session'
alias vim='nvim'

# Kill all docker containers
alias dka='docker ps -q | xargs docker stop'

# Run /bin/bash inside of a docker container by service name, not container name
dcc() {
    docker-compose exec "$1" /bin/bash
}

# Rebuild pimcore classes
alias pdepl='bin/console pimcore:deployment:classes-rebuil -c'

# Starship
# eval "$(starship init bash)"
