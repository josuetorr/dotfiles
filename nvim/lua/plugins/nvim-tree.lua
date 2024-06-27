return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    local ntree = require("nvim-tree")

    -- recommended by nvim-tree docs
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    ntree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
    })

    local wk = require("which-key")
    wk.register({
      e = {
        name = "Explorer",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer at Root" },
        f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer at Current File" },
        x = { "<cmd>NvimTreeCollapse<CR>", "Collapse open folders" },
        b = { "<cmd>NvimTreeCollapseKeepBuffers<CR>", "Open directories in use" },
        r = { "<cmd>NvimTreeRefres<CR>", "Refresh file explorer" },
      },
    }, { prefix = "<leader>" })
  end,
  --keys = {
  --  {"<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer at Root"},
  --  {"<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer at Current File"},
  --  {"<leader>ex", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse open folders"},
  --  {"<leader>er", "<cmd>NvimTreeRefres<CR>", desc = "Refresh file explorer"},
  --},
}
