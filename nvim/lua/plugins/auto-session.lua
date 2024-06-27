return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local wk = require("which-key")

    wk.register({
      w = {
        name = "workspace",
        r = {"<cmd>SessionRestore<CR>", "Restore session for cwd" },
        s = {"<cmd>SessionSave<CR>", "Save session for auto session root dir" },
      }
    }, 
    { prefix = "<leader>" })
  end,
}
