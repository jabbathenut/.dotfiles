-- Indentation (Neovim / Stylua community standard: 2 spaces)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Line length guide matching Stylua defaults (100 or 120 chars)
vim.opt_local.colorcolumn = "120"
vim.opt_local.textwidth = 120

-- Prevent auto-wrapping code while typing, keep comment wrapping intact
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< formatoptions<"
