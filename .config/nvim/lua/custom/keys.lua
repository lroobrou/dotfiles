local wk = require("which-key")
local util = require("custom.util")

vim.o.timeoutlen = 300

local presets = require("which-key.plugins.presets")
presets.objects["a("] = nil
wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
})

-- Move to window using the <ctrl> movement keys
-- util.nmap("<left>", "<C-w>h")
-- util.nmap("<down>", "<C-w>j")
-- util.nmap("<up>", "<C-w>k")
-- util.nmap("<right>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
util.nnoremap("<S-Up>", ":resize +2<CR>")
util.nnoremap("<S-Down>", ":resize -2<CR>")
util.nnoremap("<S-Left>", ":vertical resize -2<CR>")
util.nnoremap("<S-Right>", ":vertical resize +2<CR>")

-- Move Lines
util.nnoremap("<A-j>", ":m .+1<CR>==")
util.vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
util.inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
util.nnoremap("<A-k>", ":m .-2<CR>==")
util.vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
util.inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")

-- Switch buffers with tab
util.nnoremap("<C-Left>", ":bprevious<cr>")
util.nnoremap("<C-Right>", ":bnext<cr>")

-- Easier pasting
util.nnoremap("[p", ":pu!<cr>")
util.nnoremap("]p", ":pu<cr>")

-- Clear search with <esc>
util.map("", "<esc>", ":noh<cr>")
util.nnoremap("gw", "*N")
util.xnoremap("gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
util.nnoremap("n", "'Nn'[v:searchforward]", { expr = true })
util.xnoremap("n", "'Nn'[v:searchforward]", { expr = true })
util.onoremap("n", "'Nn'[v:searchforward]", { expr = true })
util.nnoremap("N", "'nN'[v:searchforward]", { expr = true })
util.xnoremap("N", "'nN'[v:searchforward]", { expr = true })
util.onoremap("N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
util.inoremap(",", ",<c-g>u")
util.inoremap(".", ".<c-g>u")
util.inoremap(";", ";<c-g>u")

-- telescope <ctrl-r> in command line
-- vim.cmd([[cmap <C-R> <Plug>(TelescopeFuzzyCommandSearch)]])

-- markdown
util.nnoremap("=t", "<cmd>TableFormat<cr>")

-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

util.nnoremap("<space>cu", function()
  local number = math.random(math.pow(2, 127) + 1, math.pow(2, 128))
  return "i" .. string.format("%.0f", number)
end, {
  expr = true,
})


-- treesitter text objects doesn't work at startup :(
-- util.vnoremap("if", ":TSTextobjectSelect @function.inner", {})
-- util.vnoremap("af", ":TSTextobjectSelect @function.outer", {})
-- util.onoremap("if", ":TSTextobjectSelect @function.inner", {})
-- util.onoremap("af", ":TSTextobjectSelect @function.outer", {})
-- util.nnoremap("]f", ":TSTextobjectGotoNextStart @function.outer<cr>")
-- util.nnoremap("[f", ":TSTextobjectGotoPreviousStart @function.outer<cr>")

util.vnoremap("ic", ":TSTextobjectSelect @class.inner", {})
util.vnoremap("ac", ":TSTextobjectSelect @class.outer", {})
util.onoremap("ic", ":TSTextobjectSelect @class.inner", {})
util.onoremap("ac", ":TSTextobjectSelect @class.outer", {})
util.nnoremap("]c", ":TSTextobjectGotoNextStart @class.outer<cr>")
util.nnoremap("[c", ":TSTextobjectGotoPreviousStart @class.outer<cr>")

util.vnoremap("ia", ":TSTextobjectSelect @parameter.inner", {})
util.vnoremap("aa", ":TSTextobjectSelect @parameter.outer", {})
util.onoremap("ia", ":TSTextobjectSelect @parameter.inner", {})
util.onoremap("aa", ":TSTextobjectSelect @parameter.outer", {})
util.nnoremap("]a", ":TSTextobjectGotoNextStart @parameter.outer<cr>")
util.nnoremap("[a", ":TSTextobjectGotoPreviousStart @parameter.outer<cr>")

-- makes * and # work on visual mode too.
vim.api.nvim_exec(
  [[
  function! g:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction

  xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]],
  false
)

local leader = {
  b = {
    name = "+buffer",
    ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    b = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
    d = { "<cmd>:Bdelete<CR>", "Delete Buffer" },
    g = { "<cmd>:BufferLinePick<CR>", "Goto Buffer" },
    n = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    p = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    t = { "<cmd>Telescope buffers<cr>", "Telescope Buffer" },
  },
  c = {
    v = { "<cmd>Vista!!<CR>", "Vista" },
    o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" } },
  f = {
    name = "+file/find",
    D = { "<cmd>lua require('telescope.builtin').find_files({hidden=true,cwd='~/.config'})<cr>", "All Dotfiles" },
    a = { "<cmd>Telescope autocommands<cr>", "Find Autocommands" },
    b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
    c = { "<cmd>Telescope commands<cr>", "Find Commands" },
    d = { "<cmd>lua require('custom.dotfilepicker').find_files()<cr>", "Dotfiles" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope git_files<cr>", "Find Git File" },
    m = { "<cmd>Telescope man_pages<cr>", "Find Man Page" },
    n = { "<cmd>enew<cr>", "New File" },
    o = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<cmd>write<cr>", "Save File" },
    t = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
    z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Fuzzy" },
  },
  g = {
    name = "+git",
    g = { "<cmd>Neogit<CR>", "NeoGit" },
    l = {
      function()
        require("util").float_terminal("lazygit")
      end,
      "LazyGit",
    },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
    h = { name = "+hunk" },
  },
  h = {
    name = "+help",
    t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
    c = { "<cmd>:Telescope commands<cr>", "Commands" },
    h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
    m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
    k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
    s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
    l = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
    f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
    o = { "<cmd>:Telescope vim_options<cr>", "Options" },
    a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
  },
  l = {
    name = "+lsp",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>LspInstallInfo<CR>", "Installed Servers" },
    l = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Diagnostics" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  },
  s = {
    name = "+search",
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module" },
        })
      end,
      "Goto Symbol",
    },
    h = { "<cmd>Telescope command_history<cr>", "Command History" },
    m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
    r = { "<cmd>lua require('spectre').open()<CR>", "Replace (Spectre)" },
  },
  S = {
    name = "+session",
    l = { "<cmd>SessionLoad<CR>", "Load Session" },
    s = { "<cmd>SessionSave<CR>", "Save Session" },
  },
  o = {
    name = "+open",
    p = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
    g = { "<cmd>Glow<cr>", "Markdown Glow" },
  },
  p = {
    name = "+project",
    p = "Open Project",
    b = { ":Telescope file_browser cwd=~/projects<CR>", "Browse ~/projects" },
  },
  P = {
    name = "+packer",
    P = { "<cmd>PackerSync<cr>", "Sync" },
    s = { "<cmd>PackerStatus<cr>", "Status" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
  },
  q = {
    name = "+quit/session",
    q = { "<cmd>:qa<cr>", "Quit" },
    ["!"] = { "<cmd>:qa!<cr>", "Quit without saving" },
    s = { [[<cmd>lua require("persistence").load()<cr>]], "Restore Session" },
    l = { [[<cmd>lua require("persistence").load({last=true})<cr>]], "Restore Last Session" },
    d = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop Current Session" },
  },
  t = {
    name = "toggle",
    f = {
      -- require("config.lsp.formatting").toggle,
      "Format on Save",
    },
    s = {
      function()
        util.toggle("spell")
      end,
      "Spelling",
    },
    p = {
      function()
        util.toggle("paste")
      end,
      "Paste",
    },
    l = {
      function()
        util.toggle("list")
      end,
      "Toggle List",
    },
    n = {
      function()
        util.toggle("relativenumber", true)
        util.toggle("number")
      end,
      "Line Numbers",
    },
    w = {
      function()
        util.toggle("wrap")
      end,
      "Toggle Wrap",
    },
  },
  T = {
    name = "terminal"
  },
  ["<tab>"] = {
    name = "workspace",
    ["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },

    n = { "<cmd>tabnext<CR>", "Next" },
    d = { "<cmd>tabclose<CR>", "Close" },
    p = { "<cmd>tabprevious<CR>", "Previous" },
    ["]"] = { "<cmd>tabnext<CR>", "Next" },
    ["["] = { "<cmd>tabprevious<CR>", "Previous" },
    f = { "<cmd>tabfirst<CR>", "First" },
    l = { "<cmd>tablast<CR>", "Last" },
  },
  u = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
  w = {
    name = "+windows",
    w = { "<C-W>p", "other-window" },
    d = { "<C-W>c", "delete-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    h = { "<C-W>h", "window-left" },
    j = { "<C-W>j", "window-below" },
    l = { "<C-W>l", "window-right" },
    k = { "<C-W>k", "window-up" },
    o = { "<C-W>o", "only-window" },
    H = { "<C-W>5<", "expand-window-left" },
    J = { ":resize +5", "expand-window-below" },
    L = { "<C-W>5>", "expand-window-right" },
    K = { ":resize -5", "expand-window-up" },
    ["="] = { "<C-W>=", "balance-window" },
    s = { "<C-W>s", "split-window-below" },
    v = { "<C-W>v", "split-window-right" },
  },
  x = {
    name = "+errors",
    x = { "<cmd>TroubleToggle<cr>", "Trouble" },
    w = { "<cmd>TroubleWorkspaceToggle<cr>", "Workspace Trouble" },
    d = { "<cmd>TroubleDocumentToggle<cr>", "Document Trouble" },
    t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
    T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
    l = { "<cmd>lopen<cr>", "Open Location List" },
    q = { "<cmd>copen<cr>", "Open Quickfix List" },
  },
  Z = { [[<cmd>lua require("zen-mode").reset()<cr>]], "Zen Mode" },
  z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
  ["`"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
  [" "] = { ":Telescope find_files<cr>", "Find File"},
  ["."] = { ":Telescope file_browser<CR>", "Browse Files" },
  [","] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
  ["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
  [":"] = { "<cmd>Telescope command_history<cr>", "Command History" },
  D = {
    function()
      util.docs()
    end,
    "Create Docs from README.md",
  },
}

for i = 0, 10 do
  leader[tostring(i)] = "which_key_ignore"
end

wk.register(leader, { prefix = "<leader>" })

wk.register({ g = { name = "+goto", h = "Hop Word" }, s = "Hop Word1" })
