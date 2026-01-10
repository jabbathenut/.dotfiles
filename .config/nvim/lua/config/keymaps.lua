--**************************************************
-- => NEOVIM KEYMAPS
--**************************************************

-- Keymapping convenience function
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

--******************************
-- # Split Window Navigation
--******************************
Map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
Map("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
Map("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
Map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

--**************************************************
-- => ALIASES
--**************************************************
local wk = require("which-key")
local conform = require("conform")
local snacks = require("snacks")
local builtin = require("telescope.builtin")
local dap = require("dap")

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

--**************************************************
-- => PROGRAM KEMAPS (non-leader)
--**************************************************
-- TODO Keymaps
local todo = require("todo-comments")
vim.keymap.set("n", "]t", todo.jump_next, { noremap = true, silent = true, desc = "Next TODO" })
vim.keymap.set("n", "[t", todo.jump_prev, { noremap = true, silent = true, desc = "Previous TODO" })

-- Oil Keymaps
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "<C-->", "<cmd>Oil ~/<CR>", { desc = "Open Home Directory in Oil" })

--**************************************************
-- => WHICH-KEY KEYMAPS
--**************************************************
wk.add({
	-- Buffer
	{ "<leader>b", group = "Buffer" },
	{ "<leader>ba", snacks.bufdelete.all, desc = "Delete All Buffers" },
	{ "<leader>bc", snacks.bufdelete.delete, desc = "Delete Current Buffer" },
	{ "<leader>bo", snacks.bufdelete.other, desc = "Delete Other Buffers" },

	-- Code
	{ "<leader>c", group = "Code" },
	{
		"<leader>cf",
		function()
			conform.format({ lsp_format = "fallback" })
		end,
		desc = "Format Code",
	},
	{ "<leader>ct", "<cmd>TagbarToggle<CR>", desc = "Ctags" },

	-- Debugging
	{ "<leader>d", group = "Debug" },
	{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
	{ "<leader>dd", dap.continue, desc = "Continue" },
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
	{ "<leader>fb", builtin.buffers, desc = "Buffers" },
	{ "<leader>ff", builtin.find_files, desc = "Files" },
	{
		"<leader>fn",
		function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Neovim Files",
	},
	{ "<leader>fr", builtin.oldfiles, desc = "Recent Files" },

	-- Markdown
	{ "<leader>m", group = "Markdown" },
	{ "<leader>mo", "<cmd>Outline<CR>", desc = "Outline Toggle" },
	{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },

	-- Notifications
	{ "<leader>n", group = "Notifications" },
	{ "<leader>nc", "<cmd>messages<CR>", desc = "Clear" },
	{ "<leader>ns", "<cmd>messages clear<CR>", desc = "Show" },

	-- Search
	{ "<leader>s", group = "Search" },
	{ "<leader>sb", builtin.current_buffer_fuzzy_find, desc = "Current Buffer" },
	{ "<leader>sd", builtin.diagnostics, desc = "Diagnostics" },
	{ "<leader>sg", builtin.live_grep, desc = "Live Grep" },
	{ "<leader>sh", builtin.help_tags, desc = "Help" },
	{ "<leader>sk", builtin.keymaps, desc = "Keymaps" },
	{ "<leader>sq", builtin.quickfix, desc = "QuickFix List" },
	{ "<leader>sr", builtin.resume, desc = "Resume Last Search" },
	{ "<leader>st", "<cmd>TodoTelescope<CR>", desc = "TODOs" },
	{ "<leader>sw", builtin.grep_string, desc = "Word or Selection" },

	-- Window
	{ "<leader>w", group = "Window" },
	{ "<leader>we", "<C-w>=", desc = "Equalize Splits" },
	{ "<leader>wh", "<C-w>s", desc = "Horizontal Split" },
	{ "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize" },
	{ "<leader>wt", toggle_float, desc = "Toggle Terminal" },
	{ "<leader>wv", "<C-w>v", desc = "Vertical Split" },
	{ "<leader>wx", "<cmd>close<CR>", desc = "Close Split" },

	-- Utilities
	{ "<leader>u", group = "Utils" },
	{ "<leader>ud", snacks.toggle.diagnostics, desc = "Toggle Diagnostics" },
	{ "<leader>uh", snacks.toggle.inlay_hints, desc = "Toggle Inlay Hints" },
	{ "<leader>ul", snacks.lazygit.open, desc = "Lazygit" },
})

--**************************************************
-- => AUTO COMMANDS
--**************************************************

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
