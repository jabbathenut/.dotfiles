return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Configure diagnostic symbols for the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Set LSP capabilities
		local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

		-- Use LspAttach autocommand to map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function()
				local wk = require("which-key")

				wk.register({
					["<leader>ld"] = { "<cmd>lua vim.lsp.buf.definition<CR>", "Definition" },
					["<leader>lD"] = { "<cmd>lua vim.lsp.buf.declaration<CR>", "Declaration" },
					["<leader>lR"] = { "<cmd>lua vim.lsp.buf.references<CR>", "References" },
					["<leader>li"] = { "<cmd>lua vim.lsp.buf.implementation<CR>", "implementations" },
					["<leader>lt"] = { "<cmd>lua vim.lsp.buf.type_definition<CR>", "Type Definition" },
					["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help<CR>", "Signature Help" },
					["<leader>lh"] = { "<cmd>lua vim.lsp.buf.hover<CR>", "Hover Documentation" },
					["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action<CR>", "Code Action" },
					["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
					["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next<CR>", "Next Diagnostic" },
					["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev<CR>", "Prev Diagnostic" },
					["<leader>lF"] = { "<cmd>lua vim.diagnostic.open_float<CR>", "Float Diagnostic" },
					["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename<CR>", "Rename" },
				})
			end,
		})

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
					-- make the language server recognize "vim" global
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
}
