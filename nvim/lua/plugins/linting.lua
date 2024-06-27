return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        --BUG: might need to check this out with a new update
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
        lint.try_lint(nil, { ignore_errors = true })
    end, { desc = "Trigger linting for current file" })
  end,
}
