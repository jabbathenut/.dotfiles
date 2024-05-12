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

# Starship
eval "$(starship init zsh)"

# Qt
export PATH=/Users/jabba/Qt5.6.1/5.6/bin:$PATH
