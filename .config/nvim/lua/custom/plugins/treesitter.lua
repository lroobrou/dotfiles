local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  print("cannot find treesitter.configs")
   return
end

-- local present, ts_object = pcall(require, "nvim-treesitter-textobjects")
-- if not present then
--   print("cannot find nvim-treesitter-textobjects")
--    return
-- end

print("exe xxx")
-- require "nvim-treesitter-textobjects"
-- require("nvim-treesitter.configs").setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true,
--   },
--   indent = {
--     enable = true,
--     disable = { "yaml" },
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "<enter>",
--       node_incremental = "<enter>",
--       node_decremental = "<bs>",
--     },
--   },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     -- Automatically jump forward to textobj, similar to targets.vim
  --     lookahead = true,
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["oc"] = "@class.outer",
  --       ["ic"] = "@class.inner",
  --       ["of"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ob"] = "@block.outer",
  --       ["ib"] = "@block.inner",
  --       ["ol"] = "@loop.outer",
  --       ["il"] = "@loop.inner",
  --       ["os"] = "@statement.outer",
  --       ["is"] = "@statement.inner",
  --       ["oC"] = "@comment.outer",
  --       ["iC"] = "@comment.inner",
  --       ["om"] = "@call.outer",
  --       ["im"] = "@call.inner",
  --     },
  --   },
--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         ["]m"] = "@function.outer",
--         ["]]"] = "@class.outer",
--       },
--       goto_next_end = {
--         ["]M"] = "@function.outer",
--         ["]["] = "@class.outer",
--       },
--       goto_previous_start = {
--         ["[m"] = "@function.outer",
--         ["[["] = "@class.outer",
--       },
--       goto_previous_end = {
--         ["[M"] = "@function.outer",
--         ["[]"] = "@class.outer",
--       },
--     },
   -- },
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25,
--     persist_queries = false,
--   },
-- }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

ts_config.setup {
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}

