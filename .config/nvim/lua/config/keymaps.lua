-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Go to Below Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Go to Above Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to Right Window" })

-- TODO Navigation
local todo = require("todo-comments")
vim.keymap.set("n", "]t", todo.jump_next, { noremap = true, silent = true, desc = "Next TODO" })
vim.keymap.set("n", "[t", todo.jump_prev, { noremap = true, silent = true, desc = "Previous TODO" })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "<C-->", "<cmd>Oil ~/<CR>", { desc = "Open Home Directory in Oil" })

-- Alias names
local wk = require("which-key")
local conform = require("conform")
local snacks = require("snacks")

-- ### KEYMAP FUNCTIONS

-- Function to pick Neovim configuration files
local find_projects = function()
	snacks.picker.projects({
		dev = { "~/Developer" },
		patterns = {
			".git",
			"package.json",
			"CMakeLists.txt",
			"CMakePresets.json",
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
		},
	})
end

-- ### WHICH-KEY KEYMAPS

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

	-- Find
	{ "<leader>f", group = "Find" },
	{ "<leader>fb", snacks.picker.buffers, desc = "Buffers" },
	{
		"<leader>fc",
		function()
			snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Config Files",
	},
	{ "<leader>ff", snacks.picker.files, desc = "Files in Project" },
	{ "<leader>fp", find_projects, desc = "Projects" },
	{ "<leader>fr", snacks.picker.recent, desc = "Recent Files" },

	-- Markdown
	{ "<leader>m", group = "Markdown" },
	{ "<leader>mo", "<cmd>Outline<CR>", desc = "Outline Toggle" },
	{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
	{ "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", desc = "Render Toggle" },

	-- Search
	{ "<leader>s", group = "Search" },
	{ "<leader>sb", snacks.picker.lines, desc = "Buffer Lines" },
	{ "<leader>sB", snacks.picker.grep_buffers, desc = "Buffers" },
	{ "<leader>sd", snacks.picker.diagnostics, desc = "Diagnostics" },
	{ "<leader>sD", snacks.picker.diagnostics_buffer, desc = "Buffer Diagnostics" },
	{ "<leader>sg", snacks.picker.grep, desc = "Grep" },
	{ "<leader>sh", snacks.picker.help, desc = "Help" },
	{ "<leader>sk", snacks.picker.keymaps, desc = "Keymaps" },
	{
		"<leader>sn",
		function()
			snacks.picker.notifications({ layout = "vertical" })
		end,
		desc = "Notification History",
	},
	{ "<leader>sr", snacks.picker.resume, desc = "Resume Last Search" },
	{ "<leader>st", snacks.picker.todo_comments, desc = "TODOs" },
	{ "<leader>sw", snacks.picker.grep_word, desc = "Word or Visual Selection", mode = { "n", "x" } },

	-- Window
	{ "<leader>w", group = "Window" },
	{ "<leader>we", "<C-w>=", desc = "Equalize Splits" },
	{ "<leader>wh", "<C-w>s", desc = "Horizontal Split" },
	{ "<leader>wm", "<cmd>MaximizerToggle<CR>", desc = "Maximize" },
	{ "<leader>wt", snacks.terminal.toggle, desc = "Toggle Terminal" },
	{ "<leader>wv", "<C-w>v", desc = "Vertical Split" },
	{ "<leader>wx", "<cmd>close<CR>", desc = "Close Split" },

	-- Utilities
	{ "<leader>u", group = "Utils" },
	{ "<leader>ud", snacks.toggle.diagnostics, desc = "Toggle Diagnostics" },
	{ "<leader>uh", snacks.toggle.inlay_hints, desc = "Toggle Inlay Hints" },
	{ "<leader>ul", snacks.lazygit.open, desc = "Lazygit" },
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked region",
	group = vim.api.nvim_create_augroup("Visual", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 300 })
	end,
})
