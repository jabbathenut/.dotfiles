return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			-- Formatters and linters to install
			ensure_installed = {
				-- LSPs
				-- "clangd", -- do not install clangd on macos, as apple clang is used instead
				"neocmakelsp",
				"lua-language-server",
				"marksman",
				"basedpyright", -- (type checking and autocompletion) paired with ruff
				-- Formatters and Linters
				"clang-format",
				"gersemi",
				"ruff", -- (linting and formatting) paired with basedpyright
				-- "cmakelang",
				"markdownlint-cli2",
				"prettierd",
				"stylua",
				-- Debuggers
				"codelldb",
			},
		},
	},
}
