local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Must be set before loading Lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = {}
require("lazy").setup("plugins", opts)

require("util.debug")
require("config.options")
-- require("util.dashboard").setup()

vim.cmd("colorscheme tokyonight-night")
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- require("util").version()
		require("config.commands")
		require("config.mappings")
		require("config.options")
	end,
})
