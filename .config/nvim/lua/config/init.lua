-- Global leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load "Pre-Lazy" configurations
-- These are loaded before lazy.nvim, as the
-- plugins loaded by lazy.nvim may depend on them.
require("config.options")

-- Load lazy.nvim
require("config.lazy")

-- Load "Post-Lazy" configurations
-- These are loaded after lazy.nvim, as they
-- depend on plugins loaded by lazy.
require("config.lspconfig")
require("config.keymaps")
