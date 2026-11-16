-- Indentation (Google/LLVM standard: 2 spaces; change to 4 if preferred)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Line length guide (80 chars; change to "100" or "120" for modern C++ styles)
vim.opt_local.colorcolumn = "100"
vim.opt_local.textwidth = 100

-- Smart C/C++ indentation tuning (cindent)
vim.opt_local.cindent = true
-- g0: don't indent "public:"/"private:" labels extra inside classes
-- :0: don't indent "case" labels extra inside "switch" blocks
-- l1: align case body with the case label
-- (0: align arguments inside unclosed parentheses cleanly
vim.opt_local.cinoptions = "g0,:0,l1,(0"

-- Use "//" for line comments when pressing "gcc" (Neovim 0.10+ built-in commenting)
vim.opt_local.commentstring = "// %s"

-- Prevent auto-wrapping code while typing, keep comment formatting intact
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< cindent< cinoptions< commentstring< formatoptions<"
