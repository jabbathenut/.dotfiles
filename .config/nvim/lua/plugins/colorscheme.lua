return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      transparent = true,
    })
    vim.cmd.colorscheme "kanagawa-wave"
    -- vim.cmd.colorscheme "kanagawa-dragon"
  end,
}
