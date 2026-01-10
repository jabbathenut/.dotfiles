return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Get the current Lazy status
		local lazy_status = require("lazy.status") -- to configure pending updates

		-- Get the file symbol for unix based systems.
		-- The fileformat symbols setting doesn't seem to recognize
		-- a MacOS system as "mac". It recognizes it as "unix".
		-- This function will provide a MacOS symbol for the "unix" symbol
		-- setting when on a mac. Otherwise, it will provide a Linux symbol.
		local os_uname = vim.uv.os_uname().sysname
		local function get_unix_symbol()
			if os_uname == "Darwin" then
				return "" -- (U+e711)
			else
				return "" -- (U+e712)
			end
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
			},
			tabline = {},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"fileformat",
						symbols = {
							unix = get_unix_symbol(),
							dos = "", -- (U+e70f)
							mac = "", -- (U+e711)
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
						color = { fg = "#FFA066" }, -- kanagawa theme color
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
