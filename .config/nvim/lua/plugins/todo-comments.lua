return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local todo = require("todo-comments")
		local keymap = vim.keymap

		keymap.set("n", "]t", function()
			todo.jump_next()
		end, { desc = "Next TODO Comment" })

		keymap.set("n", "[t", function()
			todo.jump_prev()
		end, { desc = "Previous TODO Comment" })

		todo.setup()
	end,
}
