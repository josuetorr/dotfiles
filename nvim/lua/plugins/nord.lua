return {
  -- "gbprod/nord.nvim",
  "shaunsingh/nord.nvim",
  priority = 1000, -- make sure it loads before all other plugins
  config = function()
    vim.cmd("colo nord")
  end,
}
