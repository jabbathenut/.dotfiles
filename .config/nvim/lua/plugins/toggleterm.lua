-- Safely require the plugin once vim.pack makes it available
local ok, tt = pcall(require, "toggleterm")
if not ok then
	return
end

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminal = true,
	shading_factor = 1,
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	autochdir = true,
})
