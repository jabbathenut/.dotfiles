## Neovim C/C++ Development Environment Setup (MacOS)

### Install Core Items

#### Homebrew

Install Homebrew:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Execute the following cli commands:

```zsh
echo >> /Users/jabba/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jabba/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### CMake

Install CMake with Homebrew:

```zsh
brew install cmake
```

#### Git

Install Git with Homebrew:

```zsh
brew install git
git config --global user.name "jabbathenut"
git config --global user.email grimesje@protonmail.com
git config --global core.editor nvim
git config --global init.defaultBranch main
```

#### Ninja

Install Ninja with Homebrew:

```zsh
brew install ninja
```

#### GNU Stow

Install GNU Stow with Homebrew:

```zsh
brew install stow
```

### Install Dotfiles

#### Dotfiles

Install Dotfiles from repository:

```text
Note: copy from repository location to home directory
```

Symlink Dotfiles using Stow:

```zsh
cd ~/.dotfiles
stow .
```

### Install Terminal Items

##### Nerd Font

Install Nerd Font with Homebrew:

```zsh
brew install --cask font-jetbrains-mono-nerd-font
```

##### Starship

Install Starship with Homebrew:

```zsh
brew install starship
```

Add the following to .zshrc:

```zsh
# Starship (custom terminal prompt)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
```

##### Ghostty

Install Ghostty with Homebrew:

```zsh
brew install --cask ghostty
```

##### Eza

Install Eza with Homebrew:

```zsh
brew install eza
```

Add the following to .zshrc:

```zsh
# Eza (better ls)
alias ls="eza --icons=always"
```

##### Zoxide

Install Zoxide with Homebrew:

```zsh
brew install zoxide
```

Add the following to .zshrc:

```zsh
# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"
```

##### FZF

Install FZF with Homebrew:

```zsh
brew install fzf
```

##### Yazi (Terminal File Manager)

Install Yazi and it's dependencies with Homebrew:

```zsh
brew install yazi
brew install brew install --cask font-jetbrains-mono-nerd-font
brew install ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick
```

Add the following to .zshrc:

```zsh
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
```

### Install Neovim and Related Items

#### Neovim and it's dependencies

Install Neovim with Homebrew:

```zsh
brew install neovim
```

Install Neovim Configuration Dependencies with Homebrew:

```zsh
brew install node
brew install ripgrep
brew install tree-sitter-cli
brew install universal-ctags
brew install lazygit
brew install cmake-language-server
```

Note: The cmake-language-server is installed via Homebrew, as their is an incompatibility conflict with the version
Mason installs.

### Neovim Configuration Description

#### LSPs

The LSP configurations are stored in the ~/.config/nvim/lsp directory. Configurations located this directory are loaded
automatically by Neovim. This feature was implemented in Neovim 0.11. These loaded configurations are then enabled and
enhanced in the ~/.config/nvim/lua/config/lspconfig.lua file.

- clangd
- cmake-language-server (aka cmake)
- lua-language-server (aka luals)
- marksman

#### Formatters/Linters

- clang-format
- cmakelang (includes cmake-format)
- markdownlint-cli2
- prettierd
- stylua

#### Debuggers

- codelldb (C/C++)

#### LSP-Related Plugins

- mason.nvim
- mason-tool-installer.nvim
- blink.cmp (completion)
- conform.nvim (formatting)
- nvim-lint (linting)
- nvim-dap (debugging)

#### Quality of Life Plugins

There are several QOL plugins that are not listed here, as they will likely change frequently. They can, however, be
easily identified in the ~/.config/nvim/lua/plugins directory.
