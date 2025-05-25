# Add architecture selection aliases
alias x86="$env /usr/bin/arch -x86_64 /bin/zsh"
alias arm="$env /usr/bin/arch -arm64 /bin/zsh"

# Notify of running architecture
if [[ $(uname -m) == "x86_64" ]]
then
	echo "Running in x86_64 mode."
else
	echo "Running in arm64 mode."
fi

# Starship (custom terminal prompt)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Eza (better ls)
alias ls="eza --icons=always"

# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# Add python and pip aliases
alias python=python3
alias pip=pip3

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

# Qt (required for a specific project)
export PATH=/Users/jabba/Qt5.6.1/bin:$PATH
