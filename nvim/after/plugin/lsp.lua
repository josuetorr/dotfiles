local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
	"lua_ls",
	"csharp_ls",
})

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = {
	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
}

lsp.setup_nvim_cmp({
	mapping = cmp_mapping,
})

lsp.set_sign_icons({
	error = "🚨",
	warn = "⚠️",
	hint = "💡",
	info = "ℹ",
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "gR", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "gca", function()
		vim.lsp.buf.code_actions()
	end, opts)
	vim.keymap.set("n", "gs", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "gk", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "gj", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "gh", function()
		vim.lsp.buf.signature_help()
	end, opts)

	vim.keymap.set("n", "<leader>p", function()
		vim.lsp.buf.format({
			bufnr = bufnr,
			async = false,
			filter = function(client)
				return client.name ~= "tsserver"
			end,
		})
		-- require("conform").format({ async = false, bufnr = bufnr })
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = false,
})
