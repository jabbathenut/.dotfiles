return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		-- vim.keymap.set({ "n", "v" }, "<leader>F", function()
		-- 	conform.format({
		-- 		lsp_fallback = true,
		-- 		async = false,
		-- 		timeout_ms = 500,
		-- 	})
		-- end, { desc = "Conform Format" })
	end,
}
