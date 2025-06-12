-- Create a function to set the background for floating windows (i.e., floating terminal)
local function set_normal_float_highlight()
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

-- Create an autocommand to set the background of floating windows (i.e., floating terminal)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_normal_float_highlight,
})

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				theme = "wave", -- options include: wave, dragon and lotus
				background = {
					dark = "wave",
					light = "lotus",
				},
			})

			-- Run command to set colorscheme
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
