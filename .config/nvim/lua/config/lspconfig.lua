--******************************
-- # Enhance LSP Capabilities
--******************************
-- LSP servers and clients are able to communicate to each other what features they support.
-- By default, Neovim doesn't support everything that is in the LSP specification.
-- Additional capabilities can be added to Neovim's using blink.cmp, mini.completion, nvim-cmp, etc.
--
-- For reference:
-- Neovim's default capabilities are listed here:
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/protocol.lua
-- The LSP capabilities specification is listed here:
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/
--
-- Here, we are adding capabilities to Neovim's with blink.cmp.
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
	"clangd",
	"cmake",
	"luals",
	"marksman",
})

--******************************
-- # LspAttach Auto Command
--******************************
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLSPAttach", {}),
	callback = function(event)
		-- Get the client
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

		-- Set keymaps
		local builtin = require("telescope.builtin")
		local wk = require("which-key")

		wk.add({
			{ "<leader>l", group = "+LSP" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "x", "n" } },
			{ "<leader>ld", builtin.lsp_definitions, desc = "Go to Definition" },
			{ "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
			{ "<leader>lf", vim.lsp.buf.format, desc = "Format" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover Documentation" },
			{ "<leader>li", builtin.lsp_implementations, desc = "Go to Implementation" },
			{ "<leader>lO", builtin.lsp_document_symbols, desc = "Document Symbols" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>lR", builtin.lsp_references, desc = "Go to References" },
			{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "<leader>lt", builtin.lsp_type_definitions, desc = "Go to Type Definition" },
			{ "<leader>lW", builtin.lsp_workspace_symbols, desc = "Workspace Symbols" },
		})

		-- Manage reference highlighting.
		-- Create auto commands to:
		-- 1) Highlight references of the word under the cursor when the cursor rests for a little while.
		--    See ":h CursorHold" for info on when this is executed.
		-- 2) Remove reference highlights when the cursor is moved.
		-- 3) Remove reference highlights when the LSP is detached.
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("UserLSPHighlight", { clear = false })

			-- Command for 1)
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = highlight_augroup,
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			-- Command for 2)
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = highlight_augroup,
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})

			-- Command for 3)
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("UserLSPDetach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "UserLSPHighlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

--******************************
-- # Miscellaneous
--******************************
-- Enable diagnostics virtual text (disabled by default in version 0.11)
vim.diagnostic.config({ virtual_text = true })
