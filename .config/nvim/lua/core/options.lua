local opt = vim.opt

-- Appearance
opt.background = "dark"
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.wrap = false
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.cmdheight = 1
opt.pumheight = 10
opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Tabs and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Mouse and Scrolling
opt.mouse = "a"
opt.scrolloff = 5

-- Search and Completion
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.iskeyword:append("-,_")
opt.completeopt = "menuone,noinsert,noselect"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Backspace Key
opt.backspace = "indent,eol,start"

-- Files and Buffers
opt.modifiable = true
opt.hidden = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.autochdir = false
