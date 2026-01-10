# Starship (custom terminal prompt)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Eza (better ls)
alias ls="eza --icons=always"

# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# Add python and pip aliases
alias python=python3.14
alias pip=pip3.14

### YAZI START ###
# Set Yazi default editor
export EDITOR="nvim"

# Shell wrapper function that provides the ability to change the
# current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
### YAZI END ###
