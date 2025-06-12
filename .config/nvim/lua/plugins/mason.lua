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
				"cmake-language-server",
				"lua-language-server",
				"marksman",
				-- Formatters and Linters
				"clang-format",
				"cmakelang",
				"markdownlint-cli2",
				"prettierd",
				"stylua",
			},
		},
	},
}
