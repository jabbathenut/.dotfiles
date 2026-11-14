-- Safely require the plugins once vim.pack makes them available
local ok_d, d = pcall(require, "dap")
local ok_dui, dui = pcall(require, "dapui")
local ok_dvt, dvt = pcall(require, "nvim-dap-virtual-text")
local ok_lzy, lzy = pcall(require, "lazydev")
local ok_dpython, dpython = pcall(require, "dap-python")
if not (ok_d and ok_dui and ok_dvt and ok_lzy and ok_dpython) then
	return
end

local dap_python_path = vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

dui.setup()

dvt.setup({
	commented = true,
})

lzy.setup({
	library = { "nvim-dap-ui" },
})

-- ##### DAP ADAPTERS #####

d.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

d.adapters.debugpy = {
	type = "executable",
	command = dap_python_path,
	args = { "-m", "debugpy.adapter" },
}

-- ##### DAP CONFIGURATIONS #####

-- ## C, C++ and Rust ##

-- Shared language layout targeting C, C++ and Rust
local c_cpp_rust_config = {
	{
		name = "file",
		type = "codelldb",
		request = "launch",
		program = function()
			-- Interactively asks you for the compiled executable path (e.g., ./a.out)
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
	},
	{
		name = "attach",
		type = "codelldb",
		request = "attach",
		processId = require("dap.utils").pick_process, -- Interactive PID picker
		cwd = "${workspaceFolder}",
	},
}

-- Bind settings to both C and C++ extensions
d.configurations.c = c_cpp_rust_config
d.configurations.cpp = c_cpp_rust_config

-- ## Python ##

-- Automatically configures the adapter and mappings for 'python' types.
-- Provide the path to a python binary that has the 'debugpy' package installed.
-- On most systems with an active venv or global environment:
dpython.setup("python")

-- ##### USER INTERFACE #####

-- Hook up listeners so the visual layout opens and closes automatically
d.listeners.before.attach.dapui_config = function()
	dui.open()
end
d.listeners.before.launch.dapui_config = function()
	dui.open()
end
d.listeners.before.event_terminated.dapui_config = function()
	dui.close()
end
d.listeners.before.event_exited.dapui_config = function()
	dui.close()
end
