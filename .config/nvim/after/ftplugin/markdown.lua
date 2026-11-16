-- Indentation (CommonMark / CodeMirror 6 standard: 2 spaces)
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Soft-wrap long paragraphs visually at word boundaries
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

-- IMPORTANT FOR SOLOMD: Do NOT hard-wrap paragraphs.
-- WYSIWYG editors treat single newlines inside paragraphs as hard breaks or awkward splits.
vim.opt_local.textwidth = 0
vim.opt_local.colorcolumn = ""

-- Keep Markdown syntax (**bold**, [[wikilinks]], $math$) visible while editing in Neovim
vim.opt_local.conceallevel = 0

-- Spell checking for prose (ignores code blocks and inline backticks)
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Never auto-wrap text while typing ("t")
vim.opt_local.formatoptions:remove({ "t" })
vim.opt_local.formatoptions:append({ "croqnj" })

-- Move smoothly across soft-wrapped visual lines instead of jumping whole paragraphs
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { buffer = true, expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { buffer = true, expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "0", "g0", { buffer = true, silent = true })
vim.keymap.set({ "n", "x" }, "$", "g$", { buffer = true, silent = true })

-- Auto-reload buffer if SoloMD or its MCP server edits the file on disk
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  buffer = 0,
  command = "checktime",
})

-- Clean up if filetype changes
vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
  .. "\nsetlocal expandtab< tabstop< softtabstop< shiftwidth< wrap< linebreak< breakindent< textwidth< colorcolumn< conceallevel< spell< spelllang< formatoptions<"
