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
      }
    })

    telescope.load_extension("fzf")

    local wk = require("which-key")
    wk.register({
      f = {
        name = "Find",
        f = { tbuiltin.find_files, "Find file in cwd" },
        g = { tbuiltin.git_files, "Find git files" },
        s = { tbuiltin.live_grep, "Find string in cwd" },
        c = { tbuiltin.grep_string, "Find string under cursor" },
        t = { "<cmd>TodoTelescope<CR>", "Find Todos, etc..." },
      }
    }, { prefix = "<leader>"})
  end
}
