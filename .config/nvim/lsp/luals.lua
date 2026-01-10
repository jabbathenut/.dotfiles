return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		"luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
			},
			completion = {
				-- Call snippet options include:
				--   Disable - Only show the function name
				--   Both - Show function name and snippet
				--   Replace - Only show the call snippet
				callSnippet = "Replace",
			},
		},
	},
}
