-- Safely require the plugin once vim.pack makes it available
local ok, cat = pcall(require, "catppuccin")
if not ok then
	return
end

cat.setup({
	flavour = "mocha",
	transparent_background = true,
	auto_integrations = true,
})

-- Run command to set colorscheme
vim.cmd("colorscheme catppuccin")
