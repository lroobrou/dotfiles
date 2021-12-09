-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

-- M.options = {
--    relativenumber = true,
-- }

-- M.ui = {
--   theme = "nord"
-- }

-- NvChad included plugin options & overrides
M.plugins = {
   status = {
      blankline = true, -- show code scope with symbols
      bufferline = true, -- list open buffers up the top, easy switching too
      colorizer = false, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true, -- NeoVim 'home screen' on open
      esc_insertmode = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true, -- gitsigns in statusline
      lspsignature = true, -- lsp enhancements
      telescope_media = true, -- media previews within telescope finders
      vim_matchup = true, -- % operator enhancements
      cmp = true,
      nvimtree = true,
      autopairs = true,
   },
  options = {
    lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  -- To change the Packer `config` of a plugin that comes with NvChad,
  -- add a table entry below matching the plugin github name
  --              '-' -> '_', remove any '.lua', '.nvim' extensions
  -- this string will be called in a `require`
  --              use "(custom.configs).my_func()" to call a function
  --              use "custom.blankline" to call a file
  default_plugin_config_replace = {
    -- nvim_treesitter = "custom.plugins.treesitter_empty"
    nvim_treesitter = "custom.plugins.treesitter",
    feline = "custom.plugins.statusline",
    dashboard = "custom.plugins.dashboard",
  },
}

M.mappings = {
  -- custom = {}, -- all custom user mappings
  -- close current focused buffer
  close_buffer = "<leader>bd",
  copy_whole_file = "yae", -- copy all contents of the current buffer
  line_number_toggle = "<leader>tn", -- show or hide line number
  new_buffer = "<leader>bc", -- open a new buffer
  new_tab = "<C-t>b", -- open a new vim tab
  save_file = "<leader>fs", -- save file using :w
  theme_toggler = "<leader>tt", -- for theme toggler, see in ui.theme_toggler
  -- navigation in insert mode, only if enabled in options
  insert_nav = {
    backward = "<C-h>",
    end_of_line = "<C-e>",
    forward = "<C-l>",
    next_line = "<C-k>",
    prev_line = "<C-j>",
    beginning_of_line = "<C-a>",
  },
  --better window movement
  window_nav = {
    moveLeft = "<C-h>",
    moveRight = "<C-l>",
    moveUp = "<C-k>",
    moveDown = "<C-j>",
  },
  -- terminal related mappings
  terminal = {
    -- multiple mappings can be given for esc_termmode and esc_hide_termmode
    -- get out of terminal mode
    esc_termmode = { "jk" }, -- multiple mappings allowed
    -- get out of terminal mode and hide it
    esc_hide_termmode = { "JK" }, -- multiple mappings allowed
    -- show & recover hidden terminal buffers in a telescope picker
    pick_term = "<leader>Tp",
    -- below three are for spawning terminals
    new_horizontal = "<leader>Th",
    new_vertical = "<leader>Tv",
    new_window = "<leader>TT",
  },
  -- update nvchad from nvchad, chadness 101
  update_nvchad = "<leader>uu",
}

-- all plugins related mappings
M.mappings.plugins = {
   -- list open buffers up the top, easy switching too
   bufferline = {
      next_buffer = "<TAB>", -- next buffer
      prev_buffer = "<S-Tab>", -- previous buffer
   },
   -- easily (un)comment code, language aware
   comment = {
      toggle = "<leader>/", -- toggle comment (works on multiple lines)
   },
   -- NeoVim 'home screen' on open
   dashboard = {
      bookmarks = "<leader>bm",
      new_file = "<leader>fn", -- basically create a new buffer
      open = "<leader>db", -- open dashboard
      session_load = "<leader>l", -- load a saved session
      session_save = "<leader>s", -- save a session
   },
   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = { "jk" }, -- multiple mappings allowed
   },
   -- file explorer/tree
   nvimtree = {
      toggle = "<leader>ft",
      focus = "<leader>wt",
   },
   -- multitool for finding & picking things
   telescope = {
      buffers = "<leader>bt",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>gc",
      git_status = "<leader>gs",
      help_tags = "<leader>hh",
      live_grep = "<leader>fw",
      oldfiles = "<leader>fr",
      themes = "<leader>th", -- NvChad theme picker
      -- media previews within telescope finders
      telescope_media = {
         media_files = "<leader>fp",
      },
   },
}

return M
