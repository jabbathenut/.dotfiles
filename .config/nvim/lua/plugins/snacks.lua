return {
	"folke/snacks.nvim",
	priority = 1000,
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		image = { enabled = true },
		indent = {
			enabled = true,
			char = "┊",
		},
		input = {
			enabled = true,
			relative = "editor",
			row = 2,
			-- relative = "cursor"
			-- row = -3,
			-- column = 0,
		},
		toggle = { enabled = true },
		lazygit = { enabled = true },
	},
}
