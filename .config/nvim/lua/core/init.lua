vim.g.mapleader = " "

require("core.options")
require("core.lazy")
require("core.keymaps")

vim.o.winbar = "%{%v:lua.require('core.winbar-config').set_winbar()%}"
