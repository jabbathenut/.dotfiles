-- Safely require the plugin once vim.pack makes it available
local ok_mdm, mdm = pcall(require, "md-render")
if not ok_mdm then
	return
end

mdm.setup()
