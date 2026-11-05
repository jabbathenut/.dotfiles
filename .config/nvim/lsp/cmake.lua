return {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	root_markers = { "CMakePresets.json", "CTestConfig.cmake", "build", "cmake" },
	init_options = {
		buildDirectory = "build",
	},
	settings = {
		CMake = {
			formatter = {
				command = "cmake-format",
			},
			hints = {
				enabled = true,
			},
		},
	},
}
