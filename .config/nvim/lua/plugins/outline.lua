-- https://github.com/hedyhli/outline.nvim
-- A sidebar with a tree-like outline of symbols from your code, powered by LSP
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		symbol_folding = {
			-- Unfold entire symbol tree by default with false, otherwise enter a
			-- number starting from 1
			autofold_depth = false,
		},
		outline_window = {
			-- Percentage or integer of columns
			width = 30,
		},
	},
}
