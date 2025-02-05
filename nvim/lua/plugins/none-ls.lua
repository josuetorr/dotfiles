return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.ocamlformat,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.pint,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.formatting.sqlfmt,
        null_ls.builtins.formatting.sql_formatter,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.completion.spell,
      },
    })
  end,
}
