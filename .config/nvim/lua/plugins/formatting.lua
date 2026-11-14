-- Safely require the plugin once vim.pack makes it available
local ok, cform = pcall(require, "conform")
if not ok then
	return
end

cform.setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cmake = { "cmake_format" },
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
})
