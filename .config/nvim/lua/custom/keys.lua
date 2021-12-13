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
util.nnoremap("=t", "<Cmd>TableFormat<cr>")

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
    ["["] = { "<Cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["]"] = { "<Cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    b = { "<Cmd>:e #<cr>", "Switch to Other Buffer" },
    d = { "<Cmd>:Bdelete<CR>", "Delete Buffer" },
    g = { "<Cmd>:BufferLinePick<CR>", "Goto Buffer" },
    n = { "<Cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    p = { "<Cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    t = { "<Cmd>Telescope buffers<cr>", "Telescope Buffer" },
  },
  c = {
    v = { "<Cmd>Vista!!<CR>", "Vista" },
    o = { "<Cmd>SymbolsOutline<cr>", "Symbols Outline" } },
  f = {
    name = "+file/find",
    D = { "<Cmd>lua require('telescope.builtin').find_files({hidden=true,cwd='~/.config'})<cr>", "All Dotfiles" },
    a = { "<Cmd>Telescope autocommands<cr>", "Find Autocommands" },
    b = { "<Cmd>Telescope file_browser<cr>", "File Browser" },
    c = { "<Cmd>Telescope commands<cr>", "Find Commands" },
    d = { "<Cmd>lua require('custom.dotfilepicker').find_files()<cr>", "Dotfiles" },
    f = { "<Cmd>Telescope find_files<cr>", "Find File" },
    g = { "<Cmd>Telescope git_files<cr>", "Find Git File" },
    m = { "<Cmd>Telescope man_pages<cr>", "Find Man Page" },
    n = { "<Cmd>enew<cr>", "New File" },
    o = { "<Cmd>Telescope zoxide list<cr>", "Zoxide" },
    r = { "<Cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<Cmd>write<cr>", "Save File" },
    t = { "<Cmd>NvimTreeToggle<cr>", "NvimTree" },
    z = { "<Cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Fuzzy" },
  },
  g = {
    name = "+git",
    g = { "<Cmd>Neogit<CR>", "NeoGit" },
    l = {
      function()
        require("util").float_terminal("lazygit")
      end,
      "LazyGit",
    },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    d = { "<Cmd>DiffviewOpen<cr>", "DiffView" },
    h = { name = "+hunk" },
  },
  h = {
    name = "+help",
    t = { "<Cmd>:Telescope builtin<cr>", "Telescope" },
    c = { "<Cmd>:Telescope commands<cr>", "Commands" },
    h = { "<Cmd>:Telescope help_tags<cr>", "Help Pages" },
    m = { "<Cmd>:Telescope man_pages<cr>", "Man Pages" },
    k = { "<Cmd>:Telescope keymaps<cr>", "Key Maps" },
    s = { "<Cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
    l = { [[<Cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
    f = { "<Cmd>:Telescope filetypes<cr>", "File Types" },
    o = { "<Cmd>:Telescope vim_options<cr>", "Options" },
    a = { "<Cmd>:Telescope autocommands<cr>", "Auto Commands" },
  },
  l = {
    name = "+lsp",
    a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
    f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
    h = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    i = { "<Cmd>LspInfo<CR>", "Info" },
    I = { "<Cmd>LspInstallInfo<CR>", "Installed Servers" },
    l = { "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Diagnostics" },
    q = { "<Cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", "Quickfix" },
    r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
  },
  s = {
    name = "+search",
    g = { "<Cmd>Telescope live_grep<cr>", "Grep" },
    b = { "<Cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module" },
        })
      end,
      "Goto Symbol",
    },
    h = { "<Cmd>Telescope command_history<cr>", "Command History" },
    m = { "<Cmd>Telescope marks<cr>", "Jump to Mark" },
    r = { "<Cmd>lua require('spectre').open()<CR>", "Replace (Spectre)" },
  },
  S = {
    name = "+session",
    l = { "<Cmd>SessionLoad<CR>", "Load Session" },
    s = { "<Cmd>SessionSave<CR>", "Save Session" },
  },
  o = {
    name = "+open",
    p = { "<Cmd>MarkdownPreview<cr>", "Markdown Preview" },
    g = { "<Cmd>Glow<cr>", "Markdown Glow" },
  },
  p = {
    name = "+project",
    p = "Open Project",
    b = { ":Telescope file_browser cwd=~/projects<CR>", "Browse ~/projects" },
  },
  P = {
    name = "+packer",
    P = { "<Cmd>PackerSync<cr>", "Sync" },
    s = { "<Cmd>PackerStatus<cr>", "Status" },
    i = { "<Cmd>PackerInstall<cr>", "Install" },
    c = { "<Cmd>PackerCompile<cr>", "Compile" },
  },
  q = {
    name = "+quit/session",
    q = { "<Cmd>:qa<cr>", "Quit" },
    ["!"] = { "<Cmd>:qa!<cr>", "Quit without saving" },
    s = { [[<Cmd>lua require("persistence").load()<cr>]], "Restore Session" },
    l = { [[<Cmd>lua require("persistence").load({last=true})<cr>]], "Restore Last Session" },
    d = { [[<Cmd>lua require("persistence").stop()<cr>]], "Stop Current Session" },
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
    ["<tab>"] = { "<Cmd>tabnew<CR>", "New Tab" },

    n = { "<Cmd>tabnext<CR>", "Next" },
    d = { "<Cmd>tabclose<CR>", "Close" },
    p = { "<Cmd>tabprevious<CR>", "Previous" },
    ["]"] = { "<Cmd>tabnext<CR>", "Next" },
    ["["] = { "<Cmd>tabprevious<CR>", "Previous" },
    f = { "<Cmd>tabfirst<CR>", "First" },
    l = { "<Cmd>tablast<CR>", "Last" },
  },
  u = { "<Cmd>UndotreeToggle<CR>", "Undo Tree" },
  w = {
    name = "+windows",
    H = { "<C-W>5<", "expand-window-left" },
    J = { ":resize +5", "expand-window-below" },
    K = { ":resize -5", "expand-window-up" },
    L = { "<C-W>5>", "expand-window-right" },
    R = { "<C-W>R", "rotate-windows-anti" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    ["="] = { "<C-W>=", "balance-window" },
    ["|"] = { "<C-W>v", "split-window-right" },
    d = { "<C-W>c", "delete-window" },
    h = { "<C-W>h", "window-left" },
    j = { "<C-W>j", "window-below" },
    k = { "<C-W>k", "window-up" },
    l = { "<C-W>l", "window-right" },
    o = { "<C-W>o", "only-window" },
    r = { "<C-W>r", "rotate-windows" },
    s = { "<C-W>s", "split-window-below" },
    v = { "<C-W>v", "split-window-right" },
    w = { "<C-W>p", "other-window" },
  },
  x = {
    name = "+errors",
    x = { "<Cmd>TroubleToggle<cr>", "Trouble" },
    w = { "<Cmd>TroubleWorkspaceToggle<cr>", "Workspace Trouble" },
    d = { "<Cmd>TroubleDocumentToggle<cr>", "Document Trouble" },
    t = { "<Cmd>TodoTrouble<cr>", "Todo Trouble" },
    T = { "<Cmd>TodoTelescope<cr>", "Todo Telescope" },
    l = { "<Cmd>lopen<cr>", "Open Location List" },
    q = { "<Cmd>copen<cr>", "Open Quickfix List" },
  },
  Z = { [[<Cmd>lua require("zen-mode").reset()<cr>]], "Zen Mode" },
  z = { [[<Cmd>ZenMode<cr>]], "Zen Mode" },
  ["`"] = { "<Cmd>:e #<cr>", "Switch to Other Buffer" },
  [" "] = { ":Telescope find_files<cr>", "Find File"},
  ["."] = { ":Telescope file_browser<CR>", "Browse Files" },
  [","] = { "<Cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
  ["/"] = { "<Cmd>Telescope live_grep<cr>", "Search" },
  [":"] = { "<Cmd>Telescope command_history<cr>", "Command History" },
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
