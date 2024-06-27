return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    local wk = require("which-key")

    wk.register({
      t = {
        name = "Todos",
        j = { todo_comments.jump_next, "Next todo comment"},
        k = { todo_comments.jump_prev, "Previous todo comment"},
      }
    }, 
    { prefix = "g"})

    todo_comments.setup()
  end,
}
