-- Indentation (Google/LLVM C style: 2 spaces; change to 4 if preferred)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Line length guide (80 chars standard for C)
vim.opt_local.colorcolumn = "80"
vim.opt_local.textwidth = 80

-- Smart C indentation tuning (cindent)
vim.opt_local.cindent = true
-- :0: don't indent "case" labels extra inside "switch" blocks
-- l1: align case body with the case label
-- (0: align arguments inside unclosed parentheses cleanly
vim.opt_local.cinoptions = ":0,l1,(0"

-- Use "//" for line comments (C99+ standard; change to "/* %s */" for strict C89)
vim.opt_local.commentstring = "// %s"

-- Prevent auto-wrapping code while typing, keep comment formatting intact
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< colorcolumn< textwidth< cindent< cinoptions< commentstring< formatoptions<"
