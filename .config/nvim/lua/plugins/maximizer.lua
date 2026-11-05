-- Safely require the plugin once vim.pack makes it available
local ok, max = pcall(require, "maximize")
if not ok then
	return
end

require("maximize").setup()
