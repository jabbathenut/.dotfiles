-- ### LOCAL KEY MAPS ###

local keymap = vim.keymap
local opts = {
	noremap = true,
	silent = true,
}

-- Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right
keymap.set("n", "<m-tab>", "<C-6>", opts) -- Cycle Buffers

-- Indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- ### WHICH-KEY KEY MAPS ###

local wk = require("which-key")

-- Create ToggleTerm variables
local terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = terminal:new({
		direction = "float",
	})
	return float:toggle()
end

-- Leader Keymaps
local leadermaps = {
	c = { "<cmd>TagbarToggle<CR>", "Ctags" },
	C = { "<cmd>ColorizerToggle<CR>", "Colorizer" },
	e = {
		name = "+Explorer",
		e = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
		c = { "<cmd>NvimTreeCollapse<CR>", "Collapse" },
		f = { "<cmd>NvimTreeFocus<CR>", "Focus" },
		h = { "<cmd>e ~/<CR>", "Home" },
	},
	f = {
		name = "+Find",
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
		f = { "<cmd>Telescope find_files<CR>", "Files" },
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		t = { "<cmd>TodoTelescope<CR>", "TODOs" },
		w = { "<cmd>Telescope live_grep<CR>", "Word" },
	},
	l = { name = "+LSP" },
	t = { toggle_float, "Terminal" },
	w = {
		name = "+Window",
		e = { "<C-w>=", "Equalize Splits" },
		h = { "<C-w>s", "Horizontal Split" },
		v = { "<C-w>v", "Vertical Split" },
		x = { "<cmd>close<CR>", "Close Split" },
		m = { "<cmd>MaximizerToggle<CR>", "Maximize" },
	},
	m = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" },
	s = {
		name = "+Session",
		r = { "<cmd>SessionRestore<CR>", "Restore" },
		s = { "<cmd>SessionSave<CR>", "Save" },
	},
	x = {
		name = "+Trouble",
		x = { "<cmd>TroubleToggle<CR>", "List" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace List" },
		d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document List" },
		q = { "<cmd>TroubleToggle quickfix<CR>", "QuickFix List" },
		l = { "<cmd>TroubleToggle loclist<CR>", "Location List" },
		t = { "<cmd>TodoTrouble<CR>", "TODO List" },
	},
}

wk.register(leadermaps, { prefix = "<leader>" })
