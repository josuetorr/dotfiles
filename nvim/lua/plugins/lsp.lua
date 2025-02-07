return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { ensure_installed = { "lua_ls", "gopls", "templ", "html", "delve", "stylua", "gofumpt" } },
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

			local capabilities = require("blink.cmp").get_lsp_capabilities()
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
	{ "neovim/nvim-lspconfig" },
}
