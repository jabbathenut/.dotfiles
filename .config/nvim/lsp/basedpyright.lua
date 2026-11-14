return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyrightconfig.json",
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				inlayHints = {
					variableTypes = true, -- Show type hints for variables
					functionReturnTypes = true, -- Show return types for functions
					callArgumentNames = "all", -- Show parameter names in function calls ("all", "none", or "partial")
					genericTypes = true,
				},
			},
		},
	},
}
