-- Safely require the plugins once vim.pack makes them available
local ok_mson, mson = pcall(require, "mason")
local ok_mtool, mtool = pcall(require, "mason-tool-installer")
if not (ok_mson and ok_mtool) then
	return
end

-- Setup an autocommand to hook into mason-tool-installer events
-- This is used to automatically downgrade pygls to version 1.3.1, which is required by cmake-language-server
vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsUpdateCompleted",
	callback = function(e)
		-- e.data lists the packages that were just handled
		local packages = e.data or {}

		-- Check if cmake-language-server was one of them
		if vim.tbl_contains(packages, "cmake-language-server") or #packages == 0 then
			-- Define the path to the virtualenv pip binary
			local mason_path = vim.fn.stdpath("data") .. "/mason/packages/cmake-language-server/venv/"
			local pip_bin = vim.fn.has("win32") == 1 and (mason_path .. "Scripts/pip.exe") or (mason_path .. "bin/pip")

			if vim.fn.executable(pip_bin) == 1 then
				-- Check what version is currently installed before acting
				vim.fn.jobstart({ pip_bin, "show", "pygls" }, {
					stdout_buffered = true,
					on_stdout = function(_, data)
						local output = table.concat(data, "\n")
						-- If "Version: 1.3.1" is already present, exit early and remain silent
						if string.find(output, "Version: 1.3.1") then
							return
						end

						-- Otherwise, run the downgrade routine
						vim.notify(
							"Fixing cmake-language-server compatibility: Downgrading pygls...",
							vim.log.levels.INFO
						)
						vim.fn.jobstart({ pip_bin, "install", "pygls==1.3.1" }, {
							on_exit = function(_, exit_code)
								if exit_code == 0 then
									vim.notify("pygls downgraded to 1.3.1 successfully!", vim.log.levels.INFO)
								end
							end,
						})
					end,
				})
			end
		end
	end,
})

-- Mason
mson.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- Mason Tool Installer
mtool.setup({
	ensure_installed = {
		-- LSPs
		"basedpyright", -- (type checking and autocompletion) paired with ruff
		--"clangd", -- do not install clangd on MacOS, as Apple Clang is used instead
		"cmake-language-server",
		"lua-language-server",
		"marksman",
		-- Formatters and Linters
		"clang-format",
		"cmakelang",
		"markdownlint-cli2",
		"prettierd",
		"ruff", -- (linting and formatting) paired with basedpyright
		"stylua",
		-- Debuggers
		"codelldb",
		"debugpy",
	},
})
