--**************************************************
-- => NEOVIM KEYMAPS
--**************************************************

-- Keymapping convenience function
function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

--******************************
-- # Split Window Navigation
--******************************
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

--**************************************************
-- => ALIASES
--**************************************************
local conform = require("conform")
local dap = require("dap")
local mini_extra = require("mini.extra")
local mini_pick = require("mini.pick")
local wk = require("which-key")

--**************************************************
-- => KEYMAP FUNCTIONS
--**************************************************
-- Toggle Floating Terminal Function
local terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = terminal:new({
		direction = "float",
	})
	return float:toggle()
end

-- Toggle Diagnostics
local toggle_diagnostics = function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

-- Toggle Inlay Hints
local toggle_inlay_hints = function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end

--**************************************************
-- => WHICH-KEY KEYMAPS
--**************************************************
wk.add({
	-- Buffer
	{ "<leader>b", group = "Buffer" },
	{ "<leader>ba", "<cmd>%bdelete<CR>", desc = "Delete All Buffers" },
	{ "<leader>bc", "<cmd>bdelete<CR>", desc = "Delete Current Buffer" },
	{ "<leader>bo", "<cmd>%bdelete|edit #|bdelete#<CR>", desc = "Delete Other Buffers" },

	-- Code
	{ "<leader>c", group = "Code" },
	{
		"<leader>cf",
		function()
			conform.format({ lsp_format = "fallback" })
		end,
		desc = "Format Code",
	},
	{ "<leader>co", "<cmd>Outline<CR>", desc = "Toggle Outline" },

	-- Debugging
	{ "<leader>d", group = "Debug" },
	{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
	{ "<leader>dc", dap.continue, desc = "Continue" },
	{ "<leader>dd", dap.disconnect, desc = "Disconnect" },
	{ "<leader>di", dap.step_into, desc = "Step Into" },
	{ "<leader>dl", dap.list_breakpoints, desc = "List Breakpoints" },
	{ "<leader>do", dap.step_out, desc = "Step Out" },
	{ "<leader>dp", dap.run_last, desc = "Run Last" },
	{ "<leader>dr", dap.repl.open, desc = "REPL Open" },
	{ "<leader>ds", dap.step_over, desc = "Step Over (Skip)" },
	{ "<leader>dt", dap.terminate, desc = "Terminate Session" },
	{ "<leader>du", dap.toggle, desc = "Toggle UI" },
	{ "<leader>dx", dap.clear_breakpoints, desc = "Clear Breakpoints" },

	-- Find
	{ "<leader>f", group = "Find" },
	{ "<leader>fb", mini_pick.builtin.buffers, desc = "Buffers" },
	{ "<leader>ff", mini_pick.builtin.files, desc = "Files" },
	{
		"<leader>fn",
		function()
			mini_pick.builtin.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Neovim Files",
	},
	{ "<leader>fr", mini_extra.pickers.oldfiles, desc = "Recent Files" },

	-- Markdown
	{ "<leader>m", group = "Markdown" },
	{ "<leader>mp", "<cmd>MdRender float<CR>", desc = "Markdown Preview (Float)" },
	{ "<leader>mr", "<cmd>MdRender toggle<CR>", desc = "Toggle Render In-Place" },
	{ "<leader>ms", "<cmd>MdRender split<CR>", desc = "Markdown Preview (Split)" },
	{ "<leader>mt", "<cmd>MdRender tab<CR>", desc = "Markdown Preview (Tab)" },

	-- Search
	{ "<leader>s", group = "Search" },
	{ "<leader>sb", mini_extra.pickers.buf_lines, desc = "Current Buffer" },
	{ "<leader>sd", mini_extra.pickers.diagnostic, desc = "Diagnostics" },
	{ "<leader>sg", mini_pick.builtin.grep_live, desc = "Live Grep" },
	{ "<leader>sh", mini_pick.builtin.help, desc = "Help" },
	{
		"<leader>sq",
		function()
			mini_extra.pickers.list({ scope = "quickfix" })
		end,
		desc = "QuickFix List",
	},
	{ "<leader>sr", mini_pick.builtin.resume, desc = "Resume Last Search" },
	{
		"<leader>sw",
		function()
			mini_pick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
		end,
		desc = "Word Under Cursor",
	},

	-- Window
	{ "<leader>w", group = "Window" },
	{ "<leader>we", "<C-w>=", desc = "Equalize Splits" },
	{ "<leader>wh", "<C-w>s", desc = "Horizontal Split" },
	{ "<leader>wm", "<cmd>Maximize<CR>", desc = "Maximize" },
	{ "<leader>wt", toggle_float, desc = "Toggle Terminal" },
	{ "<leader>wv", "<C-w>v", desc = "Vertical Split" },
	{ "<leader>wx", "<cmd>close<CR>", desc = "Close Split" },
	--
	-- Utilities
	{ "<leader>u", group = "Utils" },
	{ "<leader>ud", toggle_diagnostics, desc = "Toggle Diagnostics" },
	{ "<leader>uh", toggle_inlay_hints, desc = "Toggle Inlay Hints" },
	{ "<leader>ul", "<cmd>LazyGit<CR>", desc = "Lazygit" },
})

--******************************
-- # Highlight Yanked Text
--******************************
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	group = vim.api.nvim_create_augroup("Visual", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 300 })
	end,
})
