--        __      __  _____ __           _      __               __
--   ____/ /___  / /_/ __(_) /__  ____  (_)____/ /_____  _____  / /_  ______ _
--  / __  / __ \/ __/ /_/ / / _ \/ __ \/ / ___/ //_/ _ \/ ___/ / / / / / __ `/
-- / /_/ / /_/ / /_/ __/ / /  __/ /_/ / / /__/ ,< /  __/ /  _ / / /_/ / /_/ /
-- \__,_/\____/\__/_/ /_/_/\___/ .___/_/\___/_/|_|\___/_/  (_)_/\__,_/\__,_/
--                            /_/
local pickers = require("telescope.pickers")
local make_entry = require("telescope.make_entry")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local home = vim.env["HOME"]
-- local git_command = { "git", "--git-dir=" .. home .. "/.cfg", "--work-tree=" .. home, "ls-files", "--full-name", home }
local git_command = { "yadm", "list", "-a" }

local M = {}
-- our picker function: colors
M.find_files = function(opts)
	opts = opts or {}
	opts.cwd = home
	opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
	pickers
		.new(opts, {
			prompt_title = "Dotfiles",
			finder = finders.new_oneshot_job(git_command, opts),
			previewer = conf.file_previewer(opts),
			sorter = conf.file_sorter(opts),
		})
		:find()
end

-- to execute the function
-- M.find_files()
return M
