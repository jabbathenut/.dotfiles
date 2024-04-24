return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				-- Language servers to be installed
				ensure_installed = {
					"clangd", -- cpp language server
					"cmake", -- cmake language server
					"lua_ls", -- lua language server
				},
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				-- Formatters and linters to be installed
				ensure_installed = {
					"clang-format", -- cpp formatter
					"cmakelang", -- cmake formatter
					"cmakelint", -- cmake linter
					"stylua", -- lua formatter
				},
			})
		end,
	},
}
