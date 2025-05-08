return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = { ensure_installed = { "lua_ls", "gopls", "templ", "sqls", "svelte", "tailwindcss", "ts_ls" } },
		handlers = {
			["ts_ls"] = function()
				require("lspconfig").ts_ls.setup({
					settings = {
						typescript = {
							{
								format = {
									enable = false,
								},
							},
						},
					},
				})
			end,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			-- TODO: figure out how I want to manage lsp completion navigation
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
					["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local wk = require("which-key")
			local on_attach = function(bufnr)
				local jump_to_diagnostic = function(c)
					return function()
						vim.diagnostic.jump({ count = c, float = true })
					end
				end
				local next = jump_to_diagnostic(1)
				local prev = jump_to_diagnostic(-1)
				local opts = { bufnr = bufnr, remap = false }
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
						{ "gj", next, desc = "Goto next diagnostic" },
						{ "gk", prev, desc = "Goto previous diagnostic" },
					},
					{ "K", vim.lsp.buf.hover, desc = "Hover" },
				}, opts)

				vim.diagnostic.config({
					virtual_text = false,
				})
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
