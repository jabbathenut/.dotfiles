-- Indentation (YAML standard: strictly 2 spaces, never tabs)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Line length guide matching yamllint defaults (80 or 120 chars)
vim.opt_local.colorcolumn = "80"
vim.opt_local.textwidth = 0

-- Disable auto-wrapping while typing so long YAML values or URLs don't split across lines
vim.opt_local.formatoptions:remove({ "tc" })
vim.opt_local.formatoptions:append({ "roqnj" })

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< formatoptions<"
