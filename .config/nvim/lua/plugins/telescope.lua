-- Gets the root dir from either:
-- * connected lsp
-- * .git from file
-- * .git from cwd
-- * cwd
---@param opts? table
local function project_files(opts)
	opts = opts or {}
	opts.cwd = require("util").get_root()
	require("telescope.builtin").find_files(opts)
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },

	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader><space>", project_files, desc = "Find File" },
	},
	config = function()
		-- local actions = require("telescope.actions")

		local telescope = require("telescope")
		local borderless = true
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<C-i>"] = function(...)
							project_files({ no_ignore = true })
						end,
						["<C-h>"] = function(...)
							project_files({ hidden = true })
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
					},
				},
				prompt_prefix = " ",
				selection_caret = " ",
				winblend = borderless and 0 or 10,
			},
			extensions = {
				sessions_picker = {
					-- sessions_dir = vim.fn.stdpath("data") .. "/session/", -- same as '/home/user/.local/share/nvim/session'
					sessions_dir = vim.fn.stdpath("state") .. "/sessions/", -- same as '/home/user/.local/share/nvim/session'
				},
				-- other tele extensions configs
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("sessions_picker")
		telescope.load_extension("variables")
	end,
}
