return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
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
        performance = {
          fetching_timeout = 1,
        },
        sources = {
          { name = "nvim_lsp" },
        },
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

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        wk.add({
          {
            { "g", group = "code" },
            { "gd", vim.lsp.buf.definition, desc = "Jump to definition" },
            { "gD", vim.lsp.buf.declaration, desc = "Jump to declaration" },
            { "gi", vim.lsp.buf.implementation, desc = "Jump to implementation" },
            { "gt", vim.lsp.buf.type_definition, desc = "Jump to type definition" },
            { "gR", vim.lsp.buf.references, desc = "Show references" },
            { "gr", vim.lsp.buf.rename, desc = "Rename symbol" },
            { "gs", vim.lsp.buf.signature_help, desc = "Display signature info" },
            { "gx", vim.lsp.buf.code_action, desc = "Code actions" },
            { "go", vim.diagnostic.open_float, desc = "Show diagnostic window" },
            { "gj", vim.diagnostic.goto_next, desc = "Goto next diagnostic" },
            { "gk", vim.diagnostic.goto_prev, desc = "Goto previous diagnostic" },
          },
          {
            "<leader>p",
            ":LspZeroFormat<CR>",
            desc = "Format code",
          },

          { "K", vim.lsp.buf.hover, desc = "Hover" },
        }, opts)

        vim.diagnostic.config({
          virtual_text = false,
        })
      end

      lsp_zero.extend_lspconfig({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        lsp_attach = lsp_attach,
        float_border = "rounded",
        sign_text = true,
      })

      require("lspconfig").gleam.setup({})
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
