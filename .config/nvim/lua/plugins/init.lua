vim.pack.add({
	-- Colorscheme
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

	-- Completion
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },

	-- Debugging
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },

	-- Explorer
	{ src = "https://github.com/stevearc/oil.nvim" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- LazyGit
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	-- Linting
	{ src = "https://github.com/mfussenegger/nvim-lint" },

	-- Lualine
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Markdown
	{ src = "https://github.com/delphinus/md-render.nvim" },
	{ src = "https://github.com/delphinus/budoux.lua" },

	-- Mini.nvim
	{ src = "https://github.com/nvim-mini/mini.ai", version = "stable" }, -- Around/Inside
	{ src = "https://github.com/nvim-mini/mini.diff", version = "stable" }, -- Git Diff Hunks
	{ src = "https://github.com/nvim-mini/mini-git", version = "stable" }, -- Git Integration
	{ src = "https://github.com/nvim-mini/mini.extra", version = "stable" }, -- Extra
	{ src = "https://github.com/nvim-mini/mini.icons", version = "stable" }, -- Icons
	{ src = "https://github.com/nvim-mini/mini.pairs", version = "stable" }, -- Autopairs
	{ src = "https://github.com/nvim-mini/mini.pick", version = "stable" }, -- Picker
	{ src = "https://github.com/nvim-mini/mini.surround", version = "stable" }, -- Surround

	-- Mason
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- Maximize
	{ src = "https://github.com/declancm/maximize.nvim" },

	-- Outline
	{ src = "https://github.com/hedyhli/outline.nvim" },

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Toggle Terminal
	{ src = "https://github.com/akinsho/toggleterm.nvim" },

	-- Which-Key
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("plugins.colorscheme")
require("plugins.completion")
require("plugins.debugging")
require("plugins.formatting")
require("plugins.linting")
require("plugins.lualine")
require("plugins.mason")
require("plugins.maximizer")
require("plugins.mini")
require("plugins.oil")
require("plugins.outline")
require("plugins.toggleterm")
require("plugins.treesitter")
require("plugins.which-key")
