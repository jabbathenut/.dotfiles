return {
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--enable-config",
		"--fallback-style=llvm",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
		"--pch-storage=memory",
	},
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
		"proto",
	},
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
	},
	capabilities = {
		offsetEncoding = { "utf-16" },
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
}
