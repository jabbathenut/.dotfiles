return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"folke/lazydev.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapvt = require("nvim-dap-virtual-text")
		local lazydev = require("lazydev")

		dapui.setup({})

		dapvt.setup({
			commented = true,
		})

		lazydev.setup({
			library = { "nvim-dap-ui" },
		})

		-- ### DAP ADAPTERS

		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb", -- specify absolute path if not in $PATH
		}

		-- ### DAP CONFIGURATIONS

		-- cpp
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- ### AUTO OPEN/CLOSE DAP UI

		-- Use nvim-dap events to automatically open and close the dap ui.
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
