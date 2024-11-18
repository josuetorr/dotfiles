return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local tbuiltin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
      },
    })

    telescope.load_extension("fzf")

    local wk = require("which-key")
    wk.add({
      { "<leader>f",  group = "Find" },
      { "<leader>ff", tbuiltin.find_files,      desc = "Find file in cwd" },
      { "<leader>fg", tbuiltin.git_files,       desc = "Find git files" },
      { "<leader>fs", tbuiltin.live_grep,       desc = "Find string in cwd" },
      { "<leader>fc", tbuiltin.grep_string,     desc = "Find string under cursor" },
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find Todos, etc..." },
    })
  end,
}
