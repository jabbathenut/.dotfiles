-- Set global variables
vim.g.mapleader = " "

-- Require modules
require("core.options")
require("core.lazy")
require("core.keymaps")

-- Set winbar
vim.o.winbar = "%{%v:lua.require('core.winbar-config').set_winbar()%}"
