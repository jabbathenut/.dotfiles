return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/which-key.nvim",
	},
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local wk = require("which-key")

			-- ### LOCAL KEY MAPS ###

			vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
			vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })
			vim.keymap.set(
				{ "o", "x" },
				"ih",
				":<C-U>Gitsigns select_hunk<CR>",
				{ buffer = bufnr, desc = "Gitsigns Select Hunk" }
			)
			-- ### WHICH-KEY KEY MAPS ###

			wk.add({
				{ "<leader>h", group = "Gitsigns" },
				{
					"<leader>hb",
					function()
						gs.blame_line({ full = true })
					end,
					desc = "Blame Line",
					mode = "n",
				},
				{ "<leader>hB", gs.toggle_current_line_blame, desc = "Toggle Line Blame", mode = "n" },
				{ "<leader>hd", gs.diffthis, desc = "Diff This", mode = "n" },
				{
					"<leader>hD",
					function()
						gs.diffthis("~")
					end,
					desc = "Diff This ~",
					mode = "n",
				},
				{ "<leader>hp", gs.preview_hunk, desc = "Preview Hunk", mode = "n" },
				{ "<leader>hr", gs.reset_hunk, desc = "Reset Hunk", mode = "n" },
				{
					"<leader>hr",
					function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					desc = "Reset Hunk",
					mode = "v",
				},
				{ "<leader>hs", gs.stage_hunk, desc = "Stage Hunk", mode = "n" },
				{
					"<leader>hs",
					function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					desc = "Stage Hunk",
					mode = "v",
				},
				{ "<leader>hR", gs.reset_buffer, desc = "Reset Buffer", mode = "n" },
				{ "<leader>hS", gs.stage_buffer, desc = "Stage Buffer", mode = "n" },
				{ "<leader>hu", gs.undo_stage_hunk, desc = "Undo Stage Hunk", mode = "n" },
			})
		end,
	},
}
