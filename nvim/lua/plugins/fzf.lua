return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find file in cwd" },
		{ "<leader>fg", "<cmd>FzfLua git_files<CR>", desc = "Find git files" },
		{ "<leader>fs", "<cmd>FzfLua live_grep<CR>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>FzfLua grep_cword<CR>", desc = "Find string under cursor" },
		{ "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Find help tag" },
		{ "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Find Todos, etc..." },
	},
}
