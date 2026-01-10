--**************************************************
-- => OPTION SETTINGS
--**************************************************

--******************************
-- # Appearance
--******************************
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

--******************************
-- # Tabs & Indentation
--******************************
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

--******************************
-- # Mouse & Scrolling
--******************************
vim.opt.mouse = "a"
vim.opt.scrolloff = 5

--******************************
-- # Search & Completion
--******************************
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.iskeyword:append("-,_")
vim.opt.completeopt = "menuone,noinsert,noselect"

--******************************
-- # Windows
--******************************
vim.opt.splitright = true
vim.opt.splitbelow = true

--******************************
-- # Clipboard
--******************************
vim.opt.clipboard = "unnamedplus"

--******************************
-- # Keys
--******************************
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.backspace = "indent,eol,start"

--******************************
-- # Files & Buffers
--******************************
vim.opt.modifiable = true
vim.opt.hidden = true
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autochdir = false

--******************************
-- # Miscellaneous
--******************************
vim.opt.confirm = true
