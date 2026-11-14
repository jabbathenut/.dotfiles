--******************************
-- # Pre-Plugin
--******************************
-- Load "Pre-Plugin" configurations
-- These are loaded before the plugins are loaded, as the
-- plugins may depend on them.
require("config.options")

--******************************
-- # Plugin
--******************************
require("plugins")

--******************************
-- # Post-Plugin
--******************************
-- Load "Post-Plugin" configurations
-- These are loaded after the plugins are loaded, as they
-- may depend on the loaded plugins
require("config.keymaps")
require("config.lspconfig")
