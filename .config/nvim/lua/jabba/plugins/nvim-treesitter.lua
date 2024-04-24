return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
				"markdown",
				"markdown_inline",
				"json",
				"lua",
				"vim",
				"vimdoc",
				"query",
			},
			indent = { enable = true },
			autotag = { enable = true },
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
