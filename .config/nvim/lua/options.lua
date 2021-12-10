local opt = vim.opt
local g = vim.g

vim.opt.termguicolors = true

opt.title = true
-- opt.clipboard = options.clipboard
-- opt.cmdheight = options.cmdheight
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 3
opt.relativenumber = false
opt.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
-- opt.tabstop = options.tabstop
opt.termguicolors = true
-- opt.timeoutlen = options.timeoutlen
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
-- opt.updatetime = options.updatetime

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = " "
g.maplocalleader = "\\"

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
