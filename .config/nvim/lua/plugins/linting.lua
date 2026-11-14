-- Safely require the plugins once vim.pack makes them available
local ok_lint, lint = pcall(require, "lint")
local ok_md_lint, md_lint = pcall(require, "markdownlint-cli2")
if not (ok_lint and ok_md_lint) then
	return
end

lint.setup({
	linters_by_ft = {
		markdown = { "markdownlint-cli2" },
	},
})

md_lint.setup({
	args = {
		"--stdin",
		"--config",
		os.getenv("HOME") .. "/.markdownlint.jsonc",
		"--",
	},
})

-- Automate linting on buffer changes
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("MarkdownLinting", { clear = true }),
	callback = function()
		if vim.bo.filetype == "markdown" and vim.api.nvim_buf_get_name(0) ~= "" then
			lint.try_lint()
		end
	end,
})
