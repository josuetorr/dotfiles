return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find file in cwd" },
		{ "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Find git files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Find string under cursor" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tag" },
		{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find Todos, etc..." },
	},
}
