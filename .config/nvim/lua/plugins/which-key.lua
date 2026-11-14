-- Safely require the plugin once vim.pack makes it available
local ok, wk = pcall(require, "which-key")
if not ok then
	return
end

wk.setup({
	preset = "modern",
	icons = {
		mappings = false,
	},
})
