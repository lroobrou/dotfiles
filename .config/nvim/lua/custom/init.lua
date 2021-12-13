
-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require("core.hooks")
-- local util = require("custom.util")

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
  local opts = {
    silent = true,
    noremap = true,
  }

  map({"v", "o"}, "if", ":<C-u>TSTextobjectSelect @function.inner<CR>", opts)
  map({"v", "o"}, "af", ":<C-u>TSTextobjectSelect @function.outer<CR>", opts)
  map("n", "]f", ":<C-u>TSTextobjectGotoNextStart @function.outer<cr>", opts)
  map("n", "[f", ":<C-u>TSTextobjectGotoPreviousStart @function.outer<cr>", opts)

  map({"v", "o"}, "ic", ":<C-u>TSTextobjectSelect @class.inner<CR>", opts)
  map({"v", "o"}, "ac", ":<C-u>TSTextobjectSelect @class.outer<CR>", opts)
  map("n", "]c", ":<C-u>TSTextobjectGotoNextStart @class.outer<cr>", opts)
  map("n", "[c", ":<C-u>TSTextobjectGotoPreviousStart @class.outer<cr>", opts)

  map({"v", "o"}, "ia", ":<C-u>TSTextobjectSelect @parameter.inner<CR>", opts)
  map({"v", "o"}, "aa", ":<C-u>TSTextobjectSelect @parameter.outer<CR>", opts)
  map("n", "]a", ":<C-u>TSTextobjectGotoNextStart @parameter.outer<cr>", opts)
  map("n", "[a", ":<C-u>TSTextobjectGotoPreviousStart @parameter.outer<cr>", opts)

  map("n", "<leader>ls", ":SymbolsOutline<CR>", opts)

end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
  use 'folke/tokyonight.nvim'

  use 'tpope/vim-repeat'

  use 'tjdevries/nlua.nvim'

  -- Don't change window setup when deleting a buffer.
  use {
    'famiu/bufdelete.nvim',
    cmd = { "Bdelete", "Bwipeout" }
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {
      "Trouble",
      "TroubleToggle"
    },
    config = function()
      require("trouble").setup {}
    end,
  }

  use {
    "ggandor/lightspeed.nvim",
  }

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = "nvim-cmp",
    after = "nvim-cmp",
    config = function()
      local tabnine = require('cmp_tabnine.config')
      tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
        ignored_file_types = {
          -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        };
      })
    end,
  }

  use {
    "b3nj5m1n/kommentary",
    event = "BufRead",
    config = function()
      require('kommentary.config').configure_language("rust", {
        prefer_multi_line_comments = true,
      })
    end
  }

  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup {}
      require("custom.keys")
    end
  }

  use {
    "williamboman/nvim-lsp-installer",
    event = "BufRead",
    config = function()
      local lsp_installer = require "nvim-lsp-installer"

      lsp_installer.on_server_ready(function(server)
        local opts = {}

        if server.name == "sumneko_lua" then
          opts.settings = {
            Lua = {
              runtime = { version = 'LuaJIT', },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = { enable = false, },
            },
          }
        end

        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
      end)
    end,
  }

  use {
    "glepnir/lspsaga.nvim",
    config = function()
      local saga = require 'lspsaga'
      saga.init_lsp_saga()
    end,
  }

  use {
    'nvim-treesitter/playground',
    event = "BufRead",
  }

  -- Dabomb
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    cmd = {
      "TSTextobjectSelect", "TSTextobjectGotoNextStart", "TSTextobjectGotoPreviousStart"
    },
  }

  -- MAGIT like client
  use {
    "TimUntersberger/neogit",
    event = "BufRead",
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end
  }

  -- ORG mode plugin, also required some setup in the treesitter config.
  use {
    'nvim-orgmode/orgmode',
    after = "nvim-treesitter",
    config = function()
      require('orgmode').setup{}
    end,
    requires = {
      {
        "akinsho/org-bullets.nvim",
        config = function()
          require("org-bullets").setup {
            symbols = { "◉", "○", "✸", "✿" }
            -- or a function that receives the defaults and returns a list
            --[[ symbols = function(default_list)
              table.insert(default_list, "♥")
              return default_list
            end ]]
          }
        end
      }
    }
  }

  -- still need to configure this one, I have disabled it for now.
  use({
    "aserowy/tmux.nvim",
    disable = true,
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        }
      })
    end
  })

  use {
    "simrat39/rust-tools.nvim",
    disable = true,
    event = "BufRead *.rs",
    after = "nvim-lspconfig",
    opt = true,
    config = function()
      require('rust-tools').setup({})
    end
  }

  use({
    "simrat39/symbols-outline.nvim",
    cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    setup = function()
      vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = 'right',
        relative_width = true,
        width = 50,
      }
    end
  })

  -- Display crate version in Cargo.toml
  use {
    'Saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup()
    end,
  }

  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      vim.opt.fillchars = "diff:╱"
      require'diffview'.setup
      {
        key_bindings = {
          view = {
            -- other mappings ...
            ["gq"] = "<CMD>DiffviewClose<CR>",
            ["q"] = "<CMD>DiffviewClose<CR>",
          },
          file_panel = {
            -- optionally add it to the file panel as well:
            ["gq"] = "<CMD>DiffviewClose<CR>",
            ["q"] = "<CMD>DiffviewClose<CR>",
          }
        }
      }
      -- Doesn't work, unfortunately, seems to be set somewhere afterwards.
      vim.cmd [[ hi DiffDelete gui=bold guifg=#606060 ]]
    end
  }

  use {
    'jvgrootveld/telescope-zoxide',
    event = "BufRead",
    config = function()
      require'telescope'.load_extension('zoxide')
    end
  }

  use "kg8m/vim-simple-align"
end)

hooks.add("install_plugins", function(use)
  -- vim.opts.listchars:
  vim.cmd [[
  set listchars=tab:→\ ,eol:↲,nbsp:␣,space:•,trail:◼,extends:❯,precedes:❮
  command! Chomp %s/\s\+$// | normal! ``
  ]]

  local colors = require("colors").get("tokyonight")
  local fg = require("core.utils").fg
  --local fg_bg = require("core.utils").fg_bg
  --local bg = require("core.utils").bg ]]
  --
  fg("DiffDelete", colors.grey_fg)
  vim.cmd [[
  hi DiffDelete gui=bold guifg=#606060
  ]]
end)
-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

-- ----------------------------------------------------------------------------
-- :Chomp
-- ----------------------------------------------------------------------------

