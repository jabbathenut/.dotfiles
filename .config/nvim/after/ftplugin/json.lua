-- Indentation (Prettier / web standard: 2 spaces)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Disable line length limits so long JSON strings aren't broken
vim.opt_local.colorcolumn = ""
vim.opt_local.textwidth = 0

-- Keep JSON quotes visible instead of concealing them
vim.opt_local.conceallevel = 0

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< conceallevel<"
