-- Extended increment/decrement plugin for Neovim. Written in Lua.
local M = {
	"monaqa/dial.nvim",
	keys = {
		{
			"<C-a>",
			function()
				return require("dial.map").inc_normal()
			end,
			expr = true,
		},
		{
			"<C-x>",
			function()
				return require("dial.map").dec_normal()
			end,
			expr = true,
		},
		{
			"<C-a>",
			mode = "v",
			function()
				return require("dial.map").inc_visual()
			end,
			expr = true,
		},
		{
			"<C-x>",
			mode = "v",
			function()
				return require("dial.map").dec_visual()
			end,
			expr = true,
		},
		{
			"g<C-a>",
			mode = "v",
			function()
				return require("dial.map").inc_gvisual()
			end,
			expr = true,
		},
		{
			"g<C-x>",
			mode = "v",
			function()
				return require("dial.map").dec_gvisual()
			end,
			expr = true,
		},
	},
}

function M.config()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		default = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.date.alias["%Y/%m/%d"],
			augend.constant.alias.bool,
			augend.semver.alias.semver,
		},
	})
end

return M
