-- return {
--   "folke/trouble.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
--   cmd = "Trouble",
--   event = { "BufReadPre", "BufNewFile" },
--   --TODO: figure out a way to use a function to implement keys with which-key
--   keys = {
--     { "<leader>tx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open/close trouble list" },
--     { "<leader>tw", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
--     { "<leader>td", "<cmd>Trouble document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
--     { "<leader>tq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
--     { "<leader>tl", "<cmd>Trouble loclist<CR>", desc = "Open trouble location list" },
--     { "<leader>tL", "<cmd>Trouble lsp<CR>", desc = "Open trouble lsp" },
--     { "<leader>tr", "<cmd>Trouble<CR>", desc = "Open todos in trouble" },
--   },
-- }
return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>tx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>tX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>tL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
