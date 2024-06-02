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
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- Language servers to install
			ensure_installed = {
				"clangd",
				"cmake",
				"lua_ls",
			},
			automatic_installation = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			-- Formatters and linters to install
			ensure_installed = {
				"clang-format",
				"cmakelang",
				"cmakelint",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Configure diagnostic symbols for the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- ### SET KEYMAPS TO ATTACH TO LSPs ###

			-- Use LspAttach autocommand to map the following keys after
			-- the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function()
					local wk = require("which-key")

					local leadermaps = {
						l = {
							name = "+LSP",
							d = { vim.lsp.buf.definition, "Definition" },
							D = { vim.lsp.buf.declaration, "Declaration" },
							R = { vim.lsp.buf.references, "References" },
							i = { vim.lsp.buf.implementation, "Implementations" },
							t = { vim.lsp.buf.type_definition, "Type Definition" },
							s = { vim.lsp.buf.signature_help, "Signature Help" },
							h = { vim.lsp.buf.hover, "Hover Documentation" },
							a = { vim.lsp.buf.code_action, "Code Action" },
							f = { vim.lsp.buf.format, "Format" },
							j = { vim.diagnostic.goto_next, "Next Diagnostic" },
							k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
							F = { vim.diagnostic.open_float, "Float Diagnostic" },
							r = { vim.lsp.buf.rename, "Rename" },
						},
					}

					wk.register(leadermaps, { prefix = "<leader>" })
				end,
			})

			-- ### CONFIGURE LSPs ###

			-- Set LSP capabilities
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP Setup: clangd
			lspconfig.clangd.setup({
				capabilities = lsp_capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--all-scopes-completion",
					"--completion-style=detailed",
					"--header-insertion-decorators",
					"--header-insertion=iwyu",
					"--fallback-style=google",
					"--pch-storage=memory",
					"--offset-encoding=utf-16",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			})

			-- LSP Setup: cmake
			lspconfig.cmake.setup({
				capabilities = lsp_capabilities,
			})

			-- LSP Setup: lua_ls
			lspconfig.lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
		end,
	},
}
