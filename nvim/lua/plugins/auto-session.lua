return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local wk = require("which-key")

		wk.add({
			{ "<leader>w", group = "Workspace" },
			{ "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
			{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session for auto session root dir" },
		})
	end,
}
