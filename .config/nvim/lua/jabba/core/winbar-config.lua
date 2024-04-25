local M = {}

vim.api.nvim_set_hl(0, "WinBar", { bg = "#090618", fg = "#c8c093" })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "#090618", fg = "#727169" })
vim.api.nvim_set_hl(0, "FileNormal", { bg = "#090618", fg = "#7AA89F" })
vim.api.nvim_set_hl(0, "FileModified", { bg = "#090618", fg = "#C34043" })

function M.set_winbar()
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local file_marker = ""
	local modified = vim.api.nvim_eval_statusline("%M", {}).str

	-- Add titles for NvimTree and CTags tagbar
	-- Add a file modified indicator
	if string.match(file_path, "^NvimTree") then
		file_path = "      FILE EXPLORER"
	elseif string.match(file_path, "^__Tagbar") then
		file_path = "TAGBAR"
	else
		file_path = file_path:gsub("/", " » ")
		if modified == "+" then
			file_marker = "       ◉ "
		else
			file_marker = "       ◎ "
		end
	end

	if modified == "+" then
		return "%#FileModified#" .. file_marker .. "%*" .. file_path .. "%*"
	else
		return "%#FileNormal#" .. file_marker .. "%*" .. file_path .. "%*"
	end
end

return M
