-- Indentation (CMake standard: 2 spaces)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Line length guide matching cmake-format defaults (80 chars)
vim.opt_local.colorcolumn = "80"
vim.opt_local.textwidth = 80

-- Prevent automatic hard-wrapping of code while typing,
-- but allow "gq" to wrap comments cleanly
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< formatoptions<"
