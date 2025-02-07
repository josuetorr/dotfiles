return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "start debugger" })

		vim.keymap.set("n", "<leader>ds", function()
			dap.step_over()
		end, { desc = "step over" })

		vim.keymap.set("n", "<leader>dsi", function()
			dap.step_into()
		end, { desc = "step into" })

		vim.keymap.set("n", "<leader>dso", function()
			dap.step_out()
		end, { desc = "step over" })

		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "toggle breakpoint" })

		vim.keymap.set("n", "<Leader>dB", function()
			dap.set_breakpoint()
		end, { desc = "set breakpoint" })

		vim.keymap.set("n", "<Leader>dq", function()
			dap.terminate()
		end, { desc = "terminate" })

		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)

		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end, { desc = "open repl" })

		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end, { desc = "run last" })

		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "dap ui hover" })

		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "dap ui preview" })

		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, { desc = "dap ui center float" })

		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "dap ui center scopes" })
	end,
}
