-- Safely require the plugins once vim.pack makes them available
local ok_mai, mai = pcall(require, "mini.ai")
local ok_mdiff, mdiff = pcall(require, "mini.diff")
local ok_mextra, mextra = pcall(require, "mini.extra")
local ok_mgit, mgit = pcall(require, "mini.git")
local ok_micons, micons = pcall(require, "mini.icons")
local ok_mpairs, mpairs = pcall(require, "mini.pairs")
local ok_mpick, mpick = pcall(require, "mini.pick")
local ok_msurr, msurr = pcall(require, "mini.surround")
if not (ok_mai and ok_mdiff and ok_mgit and ok_micons and ok_mpairs and ok_mpick and ok_msurr) then
	return
end

-- Setup mini.icons preload logic to mock nvim-web-devicons
package.preload["nvim-web-devicons"] = function()
	micons.mock_nvim_web_devicons()
	return package.loaded["nvim-web-devicons"]
end

mai.setup({
	n_lines = 200,
})

mdiff.setup()

mextra.setup()

mgit.setup()

micons.setup()

mpairs.setup()

mpick.setup({
	window = {
		config = function()
			local height = math.floor(vim.o.lines * 0.4)
			local width = math.floor(vim.o.columns * 0.6)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor((vim.o.lines - height) / 2),
				col = math.floor((vim.o.columns - width) / 2),
				border = "rounded",
			}
		end,
	},
})

msurr.setup({
	n_lines = 100,
})
