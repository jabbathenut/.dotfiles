# Starship (custom terminal prompt)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Eza (better ls)
alias ls="eza --icons=always"

# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

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

# pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv" >> ~/.zshrc
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" >> ~/.zshrc
eval "$(pyenv init -)" >> ~/.zshrc
eval "$(pyenv virtualenv-init -)" >> ~/.zshrc

# Maya environment variables
export MAYA_LOCATION=/Applications/Autodesk/maya2027/Maya.app/Contents
export DYLD_LIBRARY_PATH=$MAYA_LOCATION/MacOS
export DYLD_FRAMEWORK_PATH=$MAYA_LOCATION/Frameworks
export DEVKIT_LOCATION=$HOME/Developer/Plug-ins/Maya/DevKit/2027

