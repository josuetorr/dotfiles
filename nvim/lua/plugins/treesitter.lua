return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		ts.install({ "lua", "vim", "vimdoc", "query", "go" })

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})
	end,
}
