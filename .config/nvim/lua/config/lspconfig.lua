--******************************
-- # Enhance LSP Capabilities
--******************************
-- Add capabilities to Neovim's with blink.cmp.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

-- Set a common configuration for all LSPs
vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

--******************************
-- # Enable LSPs
--******************************
-- These LSPs are defined in the lsp directory
vim.lsp.enable({
	"basedpyright",
	"clangd",
	"cmake",
	"luals",
	"marksman",
	"ruff",
})

--******************************
-- # Auto Commands
--******************************
-- LSPAttach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLSPAttach", {}),
	callback = function(args)
		-- Get the client
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- KEYMAPS
		local mini_extra = require("mini.extra")
		local wk = require("which-key")

		wk.add({
			{ "<leader>l", group = "+LSP" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "x", "n" } },
			{
				"<leader>ld",
				function()
					mini_extra.pickers.lsp({ scope = "definition" })
				end,
				desc = "Go to Definition",
			},
			{ "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
			{ "<leader>lf", vim.lsp.buf.format, desc = "Format" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover Documentation" },
			{
				"<leader>li",
				function()
					mini_extra.pickers.lsp({ scope = "implementation" })
				end,
				desc = "Go to Implementation",
			},
			{
				"<leader>lO",
				function()
					mini_extra.pickers.lsp({ scope = "document_symbol" })
				end,
				desc = "Document Symbols",
			},
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{
				"<leader>lR",
				function()
					mini_extra.pickers.lsp({ scope = "references" })
				end,
				desc = "Go to References",
			},
			{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{
				"<leader>lt",
				function()
					mini_extra.pickers.lsp({ scope = "type_definition" })
				end,
				desc = "Go to Type Definition",
			},
			{
				"<leader>lW",
				function()
					mini_extra.pickers.lsp({ scope = "workspace_symbol" })
				end,
				desc = "Workspace Symbols",
			},
		})

		-- Setup Ruff to work with BasedPyright
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end

		-- Disable inlay hints for LSPs that support it.
		-- Inlay hints can be toggled by a keymap, as desired.
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
		end

		-- Manage reference highlighting.
		-- Create auto commands to:
		-- 1) Highlight references of the word under the cursor when the cursor rests for a little while.
		--    See ":h CursorHold" for info on when this is executed.
		-- 2) Remove reference highlights when the cursor is moved.
		-- 3) Remove reference highlights when the LSP is detached.
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("UserLSPHighlight", { clear = false })

			-- Command for 1)
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = highlight_augroup,
				buffer = args.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			-- Command for 2)
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = highlight_augroup,
				buffer = args.buf,
				callback = vim.lsp.buf.clear_references,
			})

			-- Command for 3)
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("UserLSPDetach", { clear = true }),
				callback = function(args2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "UserLSPHighlight", buffer = args2.buf })
				end,
			})
		end
	end,
})

-- Vim.Pack Updates
vim.api.nvim_create_autocmd("User", {
	pattern = "PackChanged",
	callback = function(ev)
		-- Trigger :TSUpdate if this the treesitter plugin was just updated
		if ev.data and ev.data.name == "nvim-treesitter" and ev.data.kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})

--******************************
-- # Miscellaneous
--******************************
-- Enable diagnostics virtual text
vim.diagnostic.config({ virtual_text = true })
