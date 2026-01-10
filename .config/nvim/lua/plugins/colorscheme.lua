return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				auto_integrations = true,
			})

			-- Run command to set colorscheme
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
