return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		local wk = require("which-key")

		wk.add({
			{ "gt", group = "Todos" },
			{ "gtj", todo_comments.jump_next, desc = "Next todo comment" },
			{ "dtk", todo_comments.jump_prev, desc = "Previous todo comment" },
		})

		todo_comments.setup()
	end,
}
