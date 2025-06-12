return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		local mkdownlint = require("lint").linters["markdownlint-cli2"]

		lint.linters_by_ft = {
			markdown = { "markdownlint-cli2" },
		}

		mkdownlint.args = {
			"--stdin",
			"--config",
			os.getenv("HOME") .. "/.markdownlint.jsonc",
			"--",
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger Linting" })
	end,
}
