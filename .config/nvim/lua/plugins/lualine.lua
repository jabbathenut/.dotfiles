-- Safely require the plugin once vim.pack makes it available
local ok, ll = pcall(require, "lualine")
if not ok then
	return
end

local os_uname = vim.uv.os_uname().sysname
local function get_unix_symbol()
	if os_uname == "Darwin" then
		return "" -- (U+e711)
	else
		return "" -- (U+e712)
	end
end

local function maximize_status()
	return vim.t.maximized and "" or ""
end

ll.setup({
	options = {
		theme = "catppuccin-nvim",
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
				maximize_status,
				color = { fg = "#FFA066" },
			},
			{
				"filename",
				path = 3,
			},
		},
		lualine_x = {
			"searchcount",
			"encoding",
			"branch",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
