vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>ft",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					dir = require("util").get_root(),
				})
			end,
			desc = "NeoTree",
		},
	},
	config = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
		},
	},
}
