return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cmake = { "gersemi" },
			cpp = { "clang-format" },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		},
		formatters = {
			["clang-format"] = {
				command = "clang-format",
				args = {
					"--style=file",
				},
			},
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
