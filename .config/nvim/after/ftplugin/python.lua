-- Indentation (PEP 8 / Ruff standard: 4 spaces)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- Line length visual guide matching Ruff's default (88 chars)
vim.opt_local.colorcolumn = "88"
vim.opt_local.textwidth = 88

-- Prevent automatic hard-wrapping of code as you type,
-- while still wrapping comments nicely with 'gq'
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Clean up buffer-local settings if the filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< formatoptions<"
