-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/bullets.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/bullets.lua
--
-- This plugin automatically adds bulletpoints on the next line respecting
-- indentation
-- In markdown or a text file start a bulleted list using - or *. Press return
-- to go to the next line, a new list item will be created.
--
-- When in insert mode, you can increase indentation with ctrl+t and decrease it
-- with ctrl+d
--
-- By default its enabled on filetypes 'markdown', 'text', 'gitcommit', 'scratch'
-- https://github.com/bullets-vim/bullets.vim

return {
	"bullets-vim/bullets.vim",
	config = function()
		-- Indicate which file types this plugin will work on.
		vim.g.bullets_enabled_file_types = { "markdown", "text" }

		-- Enable/disable deleting the last empty bullet when hitting <cr> (insert mode) or o (normal mode).
		vim.g.bullets_delete_last_bullet_if_empty = 1

		-- Default key mappings:
		-- Insert new bullet in INSERT mode: <cr> (Return key)
		-- Same as in case you want to unmap in INSERT mode (compatibility depends on your terminal emulator): <C-cr>
		-- Insert new bullet in NORMAL mode: o
		-- Renumber current visual selection: gN
		-- Renumber entire bullet list containing the cursor in NORMAL mode: gN
		-- Toggle a checkbox in NORMAL mode: <leader>x
		-- Demote a bullet (indent it, decrease bullet level, and make it a child of the previous bullet):
		-- NORMAL mode: >>
		-- INSERT mode: <C-t>
		-- VISUAL mode: >
		-- Promote a bullet (unindent it and increase the bullet level):
		-- NORMAL mode: <<
		-- INSERT mode: <C-d>
		-- VISUAL mode: >
	end,
}
