-- return {}
return {
	"MeanderingProgrammer/render-markdown.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		local render_md = require("render-markdown")

		local theme = require("plugins.custom-themes.rmd-kanagawa").wave

		-- Set heading text colors
		vim.cmd(
			string.format([[highlight RenderMarkdownH1Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H1Bg.fg)
		)
		vim.cmd(
			string.format([[highlight RenderMarkdownH2Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H2Bg.fg)
		)
		vim.cmd(
			string.format([[highlight RenderMarkdownH3Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H3Bg.fg)
		)
		vim.cmd(
			string.format([[highlight RenderMarkdownH4Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H4Bg.fg)
		)
		vim.cmd(
			string.format([[highlight RenderMarkdownH5Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H5Bg.fg)
		)
		vim.cmd(
			string.format([[highlight RenderMarkdownH6Bg cterm=bold gui=bold guibg=none guifg=%s]], theme.rmd_H6Bg.fg)
		)

		-- Set heading gutter and icon colors
		vim.cmd(string.format([[highlight RenderMarkdownH1 cterm=bold gui=bold guifg=%s]], theme.rmd_H1.fg))
		vim.cmd(string.format([[highlight RenderMarkdownH2 cterm=bold gui=bold guifg=%s]], theme.rmd_H2.fg))
		vim.cmd(string.format([[highlight RenderMarkdownH3 cterm=bold gui=bold guifg=%s]], theme.rmd_H3.fg))
		vim.cmd(string.format([[highlight RenderMarkdownH4 cterm=bold gui=bold guifg=%s]], theme.rmd_H4.fg))
		vim.cmd(string.format([[highlight RenderMarkdownH5 cterm=bold gui=bold guifg=%s]], theme.rmd_H5.fg))
		vim.cmd(string.format([[highlight RenderMarkdownH6 cterm=bold gui=bold guifg=%s]], theme.rmd_H6.fg))

		render_md.setup({
			sign = {
				enabled = false,
			},
			heading = {
				icons = { "󰎥 ", "󰎨 ", "󰎫 ", "󰎲 ", "󰎯 ", "󰎴 " },
				position = "inline",
			},
			indent = {
				enabled = true,
				per_level = 2,
				skip_level = 1,
				skip_heading = true,
			},
			checkbox = {
				unchecked = {
					icon = "󰄱 ",
				},
				checked = {
					icon = "󰄵 ",
				},
			},
			bullet = {
				icons = { "●", "○", "◆", "◇", "■", "□" },
			},
		})
	end,
}
