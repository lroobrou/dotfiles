local pickers = require "telescope.pickers"
local make_entry = require "telescope.make_entry"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local home = vim.env['HOME']
local git_command = { "git", "--git-dir=" .. home .. "/.cfg", "--work-tree=" .. home, "ls-files", home }

local M = {}
-- our picker function: colors
M.find_files = function(opts)
  opts = opts or {}
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
  pickers.new(opts, {
    prompt_title = "Dotfiles",
    finder = finders.new_oneshot_job(git_command, opts),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

-- to execute the function
-- colors()
return M
