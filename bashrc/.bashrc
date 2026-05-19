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
# alias fzf='nvim $(fzf --preview="cat {}")'
alias fzf='fzf --preview="cat {}"'
# alias that lists by date modified
alias lst='ls -s modified'

# On Hyprland (unlike GNOME), VS Code doesn't automatically detect gnome-keyring properly, so it tries multiple password stores before timing out and eventually finding gnome-keyring.
alias code='code --password-store=gnome-libsecret --ozone-platform=x11'

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

export SYSTEMD_EDITOR=nvim
export ANTHROPIC_BASE_URL="http://litellm.factory.vpn/anthropic"

# Load local secrets — not tracked by git, create ~/.bashrc.secrets for tokens/keys
[ -f "$HOME/.bashrc.secrets" ] && source "$HOME/.bashrc.secrets"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# BEGIN SNIPPET: Pimcore Cloud CLI configuration
HOME=${HOME:-'/home/nikola'}
export PATH="$HOME/"'.pimcore-cli/bin':"$PATH"
if [ -f "$HOME/"'.pimcore-cli/shell-config.rc' ]; then . "$HOME/"'.pimcore-cli/shell-config.rc'; fi # END SNIPPET


# Deduplicate and normalize $PATH (remove empty and repeated entries).
export PATH=$(printf "%s" "$PATH" | tr ':' '\n' | awk 'NF && !x[$0]++' | paste -sd:)
export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.local/share/../bin/env"
