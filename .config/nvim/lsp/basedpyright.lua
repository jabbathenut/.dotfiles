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
					callArgumentNames = true,
				},
			},
		},
	},
}
