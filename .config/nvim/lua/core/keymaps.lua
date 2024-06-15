-- ### LOCAL FUNCTIONS ###

-- Toggle floating terminal
local terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = terminal:new({
		direction = "float",
	})
	return float:toggle()
end

-- Close all buffers but the current one
local closeOtherBuffers = function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(bufs) do
		local ftype = vim.bo[buf].filetype
		if buf ~= current_buf and ftype ~= "NvimTree" then
			vim.api.nvim_buf_delete(buf, {})
		end
	end
end

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

-- Set relevant local variables
local wk = require("which-key")
local builtin = require("telescope.builtin")

-- Leader Keymaps
local leadermaps = {
	b = {
		name = "+Buffer",
		d = { ":bd<CR>", "Delete Current Buffer" },
		o = { closeOtherBuffers, "Close Other Buffers" },
	},
	c = {
		name = "+Code",
		s = { ":ClangdSwitchSourceHeader<CR>", "Switch Source Header" },
		t = { ":TagbarToggle<CR>", "Ctags" },
	},
	e = {
		name = "+Explorer",
		e = { ":NvimTreeToggle<CR>", "Toggle" },
		c = { ":NvimTreeCollapse<CR>", "Collapse" },
		f = { ":NvimTreeFocus<CR>", "Focus" },
		h = { ":e ~/<CR>", "Home" },
	},
	f = {
		name = "+Find",
		b = { builtin.buffers, "Buffers" },
		f = { builtin.find_files, "Files" },
		g = { builtin.live_grep, "Live Grep" },
		h = { builtin.help_tags, "Help Tags" },
		k = { builtin.keymaps, "Keymaps" },
		d = { builtin.lsp_definitions, "LSP Definitions" },
		i = { builtin.lsp_implementations, "LSP Implementations" },
		t = { ":TodoTelescope<CR>", "TODOs" },
	},
	m = { ":MarkdownPreviewToggle<CR>", "Markdown Preview" },
	t = { toggle_float, "Terminal" },
	w = {
		name = "+Window",
		e = { "<C-w>=", "Equalize Splits" },
		h = { "<C-w>s", "Horizontal Split" },
		v = { "<C-w>v", "Vertical Split" },
		x = { ":close<CR>", "Close Split" },
		m = { ":MaximizerToggle<CR>", "Maximize" },
	},
}

wk.register(leadermaps, { prefix = "<leader>" })
