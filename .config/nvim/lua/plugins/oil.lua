-- Safely require the plugin once vim.pack makes it available
local ok, o = pcall(require, "oil")
if not ok then
	return
end

-- Local variable to store the detail toggle state
local detail_toggle = false

o.setup({
	default_file_explorer = true,
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
		natural_order = true,
		is_always_hidden = function(name, _)
			return name == ".." or name == ".git" or name == ".DS_Store"
		end,
	},
	keymaps = {
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail_toggle = not detail_toggle
				if detail_toggle then
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
	},
})
