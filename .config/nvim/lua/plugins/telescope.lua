return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = true,
					hidden = true,
				},
				live_grep = {
					theme = "dropdown",
					previewer = true,
				},
				buffers = {
					theme = "dropdown",
					previewer = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				["fzf"] = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
	end,
}
