--******************************
-- # Pre-Lazy
--******************************
-- Load "Pre-Lazy" configurations
-- These are loaded before lazy.nvim, as the
-- plugins loaded by lazy.nvim may depend on them.
require("config.globals")
require("config.options")

--******************************
-- # Lazy
--******************************
-- Load lazy.nvim
require("config.lazy")

--******************************
-- # Post-Lazy
--******************************
-- Load "Post-Lazy" configurations
-- These are loaded after lazy.nvim, as they
-- depend on plugins loaded by lazy.
require("config.lspconfig")
require("config.keymaps")
