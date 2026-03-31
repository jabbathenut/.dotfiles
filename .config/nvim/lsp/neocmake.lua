return {
	cmd = { "neocmakelsp", "stdio" },
	filetypes = {
		"cmake",
		"CMakeLists.txt",
	},
	root_markers = {
		".neocmake.toml",
		".neocmakelint.toml",
		"CMakePresets.json",
		"CTestConfig.cmake",
		"build",
		"cmake",
	},
	init_options = {
		format = {
			enable = false, -- using external formatter
		},
		lint = {
			enable = true,
		},
		scan_cmake_in_package = true,
	},
	single_file_support = true,
}
