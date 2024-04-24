vim.g.mapleader = " "

require("Jabba.core.lazy")
require("jabba.core.options")
require("jabba.core.keymaps")

vim.o.winbar = "%{%v:lua.require('jabba.core.winbar-config').set_winbar()%}"
