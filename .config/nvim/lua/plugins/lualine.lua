return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- local theme = require("lualine.themes.gruvbox")
		local theme = require("plugins.custom-themes.lualine-kanagawa")

		local lazy_status = require("lazy.status") -- to configure pending updates

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
			},
			tabline = {},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"fileformat",
						symbols = {
							unix = "", -- U+E6AE
							dos = "", -- U+E6AE
							mac = "", -- U+E6AE
							-- unix = "", -- U+e712 (changed to U+e711 to show mac symbol)
							-- dos = "", -- U+e70f
							-- mac = "", -- U+e711
						},
					},
				},
				lualine_c = {
					{
						"filename",
						path = 3,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#FFA066" }, -- from kanagawa theme
					},
					"searchcount",
					"encoding",
					"branch",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
