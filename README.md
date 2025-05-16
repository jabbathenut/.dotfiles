# Jabba's Dotfiles (MacOS)

This is my personal repository of configuration files for a Neovim C/C++
development environment. While it works well for me and my workflow, it may not
be what you expect or prefer. Please use this configuration with that in mind.

Download to your home folder (i.e. ~/.dotfiles). Then install with GNU Stow:

```zsh
cd ~/.dotfiles
stow .
```

## Notable Components

### Neovim C/C++ Development Environment

This configuration requires Neovim >= 0.11.

#### Dependencies

Installation uses Homebrew, unless otherwise indicated:

- Neovim

  ```zsh
  brew install neovim
  ```

- JetBrains Mono Nerd Font

  ```zsh
  brew install --cask font-jetbrains-mono-nerd-font
  ```

- CMake

  ```zsh
  brew install cmake
  ```

- Git

  ```zsh
  brew install git
  ```

- Node.js and NPM

  ```zsh
  brew install node
  ```

- Ripgrep

  ```zsh
  brew install ripgrep
  ```

- Universal Ctags

  ```zsh
  brew install universal-ctags
  ```

- Lazygit

  ```zsh
  brew install jesseduffield/lazygit/lazygit
  ```

- ImageMagick

  ```zsh
  brew install imagemagick
  ```

- pylatexenc (LaTeX Parser)

  ```zsh
  pip install pylatexenc
  ```

- fd

  ```zsh
  brew install fd
  ```

#### LSPs

The LSP configurations are stored in the ~/.config/nvim/lsp directory.
Configurations located this directory are loaded automatically by Neovim. This
feature was implemented in Neovim 0.11. These loaded configurations are then
enabled and enhanced in the ~/.config/nvim/lua/config/lspconfig.lua file.

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

#### LSP-Related Plugins

- mason.nvim
- mason-tool-installer.nvim
- blink.cmp (completion)
- conform.nvim (formatting)
- nvim-lint (linting)

#### Quality of Life Plugins

There are several QOL plugins that are not listed here, as they will likely
change frequently. They can, however, be easily identified in the
~/.config/nvim/lua/plugins directory.

### Shell Prompt

#### Starship

- Install Starship using Homebrew:

  ```zsh
  brew install starship
  ```

### Terminal

#### Kitty

- Install Kitty using Homebrew:

  ```zsh
  brew install --cask kitty
  ```

#### Eza

- Install Eza using Homebrew:

  ```zsh
  brew install eza
  ```

#### Tmux

- Install Tmux using Homebrew:

  ```zsh
  brew install tmux
  ```

  Note: When tmux is first launched, it will automatically install the Tmux
  Package Manager (TPM) to a ~/.tmux directory, which is not part of this
  repository. This is done to keep the package manager (and associated plugins)
  outside of source control. After TPM is installed, and while Tmux is open,
  execute the following key combination to install the Tmux plugins: prefix + I
  (capital I for install).

### Terminal File Manager

#### Yazi

Installation uses Homebrew, unless otherwise indicated:

- Install Yazi

  ```zsh
  brew install yazi
  ```

- Install Dependencies

  - Nerd-Font (JetBrains Mono Nerd Font)

    ```zsh
    brew install --cask font-jetbrains-mono-nerd-font
    ```

  - FFmpeg (for video thumbnails)

    ```zsh
    brew install ffmpeg
    ```

  - 7-Zip (for archive extraction and preview)

    ```zsh
    brew install sevenzip
    ```

  - jq (for JSON preview)

    ```zsh
    brew install jq
    ```

  - poppler (for PDF preview)

    ```zsh
    brew install poppler
    ```

  - fd (for file searching)

    ```zsh
    brew install fd
    ```

  - ripgrep (for file content searching)

    ```zsh
    brew install ripgrep
    ```

  - fzf (for quick file subtree navigation, >= 0.53.0)

    ```zsh
    brew install fzf
    ```

    -zoxide (for historical directories navigation, requires fzf)

    ```zsh
    brew install zoxide
    ```

  - resvg (for SVG preview)

    ```zsh
    brew install resvg
    ```

  - ImageMagick (for Font, HEIC, and JPEG XL preview)

    ```zsh
    brew install imagemagick
    ```
