-- This file came from:
-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/lualine/themes/kanagawa.lua

-- Get theme from the kanagawa colorscheme
-- Theme colors can be reviewed at the following location:
-- https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua
local theme = require("kanagawa.colors").setup().theme

local kanagawa = {}

kanagawa.normal = {
	a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
	b = { bg = theme.diff.change, fg = theme.syn.fun },
	c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

kanagawa.insert = {
	a = { bg = theme.diag.ok, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

kanagawa.command = {
	a = { bg = theme.syn.operator, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

kanagawa.visual = {
	a = { bg = theme.syn.keyword, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

kanagawa.replace = {
	a = { bg = theme.syn.constant, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

kanagawa.inactive = {
	a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
	c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
}

if vim.g.kanagawa_lualine_bold then
	for _, mode in pairs(kanagawa) do
		mode.a.gui = "bold"
	end
end

return kanagawa
