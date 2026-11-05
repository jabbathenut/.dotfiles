-- Safely require the plugin once vim.pack makes it available
local ok, blnk = pcall(require, "blink.cmp")
if not ok then
	return
end

blnk.setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			snippets = {
				score_offset = 900,
			},
		},
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		accept = {
			auto_brackets = { enabled = true },
		},
		ghost_text = { enabled = false },
		menu = {
			draw = {
				-- Define the structure of your completion items
				columns = { { "kind_icon", gap = 1 }, { "label", "kind", gap = 1 } },

				components = {
					-- Custom layout handling for the kind_icon
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							-- Attempt to use mini.icons for modern Neovim 0.12 integration
							local success, mini_icons = pcall(require, "mini.icons")
							if success then
								local icon, _, _ = mini_icons.get("lsp", ctx.kind)
								if icon then
									return icon
								end
							end
							-- Fallback to the default blink.cmp icon if mini.icons is unavailable
							return ctx.kind_icon
						end,
						highlight = function(ctx)
							-- Match color highlights with mini.icons groups
							local success, mini_icons = pcall(require, "mini.icons")
							if success then
								local _, hl, _ = mini_icons.get("lsp", ctx.kind)
								if hl then
									return hl
								end
							end
							-- Fallback to default styling syntax
							return "BlinkCmpKind" .. ctx.kind
						end,
					},
				},
			},
		},
	},
	-- Enable and configure command-line completion explicitly
	cmdline = {
		enabled = true,
		keymap = { preset = "cmdline" }, -- Pulls standard command-line navigation profiles
		sources = function()
			local type = vim.fn.getcmdtype()
			-- Search forward '/' or backward '?'
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			-- Standard commands ':'
			if type == ":" then
				return { "cmdline" }
			end
			return {}
		end,
		completion = {
			-- Prevent immediate pre-selection to stop accidental triggers on short commands (e.g., :w)
			menu = { auto_show = true },
			ghost_text = { enabled = false },
		},
	},
})
