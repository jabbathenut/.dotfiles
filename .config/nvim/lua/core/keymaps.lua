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

wk.add({
	{ "<leader>b", group = "+Buffer" },
	{ "<leader>bd", ":bd<CR>", desc = "Delete Current Buffer" },
	{ "<leader>bo", closeOtherBuffers, desc = "Close Other Buffers" },
	{ "<leader>c", group = "+Code" },
	{ "<leader>cs", ":ClangdSwitchSourceHeader<CR>", desc = "Switch Source Header" },
	{ "<leader>ct", ":TagbarToggle<CR>", desc = "Ctags" },
	{ "<leader>e", group = "+Explorer" },
	{ "<leader>ec", ":NvimTreeCollapse<CR>", desc = "Collapse" },
	{ "<leader>ee", ":NvimTreeToggle<CR>", desc = "Toggle" },
	{ "<leader>ef", ":NvimTreeFocus<CR>", desc = "Focus" },
	{ "<leader>eh", ":e ~/<CR>", desc = "Home" },
	{ "<leader>f", group = "+Find" },
	{ "<leader>fb", builtin.buffers, desc = "Buffers" },
	{ "<leader>fd", builtin.lsp_definitions, desc = "LSP Definitions" },
	{ "<leader>ff", builtin.find_files, desc = "Files" },
	{ "<leader>fg", builtin.live_grep, desc = "Live Grep" },
	{ "<leader>fh", builtin.help_tags, desc = "Help Tags" },
	{ "<leader>fi", builtin.lsp_implementations, desc = "LSP Implementations" },
	{ "<leader>fk", builtin.keymaps, desc = "Keymaps" },
	{ "<leader>ft", ":TodoTelescope<CR>", desc = "TODOs" },
	{ "<leader>m", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
	{ "<leader>t", toggle_float, desc = "Terminal" },
	{ "<leader>w", group = "+Window" },
	{ "<leader>we", "<C-w>=", desc = "Equalize Splits" },
	{ "<leader>wh", "<C-w>s", desc = "Horizontal Split" },
	{ "<leader>wm", ":MaximizerToggle<CR>", desc = "Maximize" },
	{ "<leader>wv", "<C-w>v", desc = "Vertical Split" },
	{ "<leader>wx", ":close<CR>", desc = "Close Split" },
})
