-- Safely require the plugin once vim.pack makes it available
local ok, ol = pcall(require, "outline")
if not ok then
	return
end

ol.setup({
	outline_window = {
		position = "right",
		width = 30,
		auto_close = false,
	},

	symbols = {
		-- 1. Tell outline.nvim to use nvim-web-devicons automatically
		icon_source = "nvim-web-devicons",

		-- 2. Define whether you want to use the default web-devicon colors (true)
		--    or match your active syntax theme's colors (false)
		icon_use_language_style = true,

		-- 3. Optional fallbacks: You only need to define icons here if they
		--    are missing from devicons or if you want to override a specific one.
		icons = {},
	},
})
