-- Safely require the plugin once vim.pack makes it available
local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
	return
end

ts.setup({
	-- Custom target directory for downloaded parsers
	install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
	"bash",
	"c",
	"cmake",
	"cpp",
	"css",
	"html",
	"javascript",
	"json",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"norg",
	"python",
	"regex",
	"scss",
	"svelte",
	"tsx",
	"typst",
	"vim",
	"vimdoc",
	"vue",
	"yaml",
})
