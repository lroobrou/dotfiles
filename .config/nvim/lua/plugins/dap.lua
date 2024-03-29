local M = {
	"mfussenegger/nvim-dap",

	dependencies = {
		{
			"rcarriga/nvim-dap-ui",

			config = function()
				require("dapui").setup()
			end,
		},
		{ "jbyuki/one-small-step-for-vimkind" },
	},
}

function M.init()
	vim.keymap.set("n", "<leader>db", function()
		require("dap").toggle_breakpoint()
	end, { desc = "Toggle Breakpoint" })

	vim.keymap.set("n", "<leader>dc", function()
		require("dap").continue()
	end, { desc = "Continue" })

	vim.keymap.set("n", "<leader>do", function()
		require("dap").step_over()
	end, { desc = "Step Over" })

	vim.keymap.set("n", "<leader>di", function()
		require("dap").step_into()
	end, { desc = "Step Into" })

	vim.keymap.set("n", "<leader>dw", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Widgets" })

	vim.keymap.set("n", "<leader>dr", function()
		require("dap").repl.open()
	end, { desc = "Repl" })

	vim.keymap.set("n", "<leader>du", function()
		require("dapui").toggle({})
	end, { desc = "Dap UI" })

	vim.keymap.set("n", "<leader>ds", function()
		require("osv").launch({ port = 8086 })
	end, { desc = "Launch Lua Debugger Server" })

	vim.keymap.set("n", "<leader>dd", function()
		require("osv").run_this()
	end, { desc = "Launch Lua Debugger" })
end

function M.config()
	local dap = require("dap")

	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
		},
	}

	dap.configurations.rust = {
		{
			name = "Launch Debug",
			type = "lldb",
			request = "attach",
			-- request = "launch",
			-- program = function()
			-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/" .. "")
			-- end,
			-- cwd = "${workspaceFolder}",
			-- stopOnEntry = false,
			args = {},
			-- initCommand = {},
			-- runInTerminal = true,
			pid = require("dap.utils").pick_process,
		},
	}

	dap.adapters.nlua = function(callback, config)
		callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
	end

	dap.adapters.lldb = {
		type = "executable",
		-- command = 'lldb-vscode', -- I tried this
		-- command = 'vscode-lldb', -- also tried this
		command = "/usr/bin/lldb-vscode", -- and this
		-- command = "/home/name/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/lldb/bin/lldb", -- even this
		name = "lldb",
	}

	local dapui = require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end
end

-- - `DapBreakpoint` for breakpoints (default: `B`)
-- - `DapBreakpointCondition` for conditional breakpoints (default: `C`)
-- - `DapLogPoint` for log points (default: `L`)
-- - `DapStopped` to indicate where the debugee is stopped (default: `→`)
-- - `DapBreakpointRejected` to indicate breakpoints rejected by the debug
--   adapter (default: `R`)
--
-- You can customize the signs by setting them with the |sign_define()| function.
-- For example:
--
-- >
--     lua << EOF
--     vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
--     EOF
-- <

return M
