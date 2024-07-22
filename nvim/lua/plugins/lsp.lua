return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      -- TODO: figure out how I want to manage lsp completion navigation
      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      local wk = require("which-key")

      lsp_zero.extend_lspconfig()
      lsp_zero.preset("recommended")

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        wk.register({
          g = {
            name = "Code",
            d = { vim.lsp.buf.definition, "Jump to definition" },
            D = { vim.lsp.buf.declaration, "Jump to declaration" },
            i = { vim.lsp.buf.implementation, "Jump to implementation" },
            t = { vim.lsp.buf.type_definition, "Jump to type definition" },
            R = { vim.lsp.buf.references, "Show references" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
            s = { vim.lsp.buf.signature_help, "Display signature info" },
            x = { vim.lsp.buf.code_action, "Code actions" },
            o = { vim.diagnostic.open_float, "Show diagnostic window" },
            j = { vim.diagnostic.goto_next, "Goto next diagnostic" },
            k = { vim.diagnostic.goto_prev, "Goto previous diagnostic" },
          },
          ["<leader>p"] = {
            function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = false,
              })
            end,
            "Format code",
          },
          K = { vim.lsp.buf.hover, "Hover" },
        }, opts)

        vim.diagnostic.config({
          virtual_text = false,
        })
      end)

      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          emmet_language_server = function()
            lsp_zero.configure("emmet_language_server", {
              filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "pug",
                "typescriptreact",
                "php",
              },
            })
          end,
        },
      })
    end,
  },
}
