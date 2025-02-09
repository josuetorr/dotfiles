return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { ensure_installed = { "lua_ls", "gopls", "templ", "html", "delve", "stylua" } },
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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local wk = require("which-key")
			local on_attach = function(_, bufnr)
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
					{ "K", vim.lsp.buf.hover, desc = "Hover" },
				}, opts)

				vim.diagnostic.config({
					virtual_text = false,
				})
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
