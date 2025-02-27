return {
	"catppuccin/nvim",
	priority = 1000, -- make sure it loads before all other plugins
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
		vim.cmd("colo catppuccin")
	end,
}
