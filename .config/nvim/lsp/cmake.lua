return {
	cmd = { "cmake-language-server" },
	filetypes = {
		"cmake",
		"CMakeLists.txt",
	},
	root_markers = {
		"CMakePresets.json",
		"CTestConfig.cmake",
		"build",
		"cmake",
	},
	single_file_support = true,
	init_options = {
		buildDirectory = "build",
	},
}
