local M = { -- personal plugin
	{ dir = "/home/luc/Projects/telescope-variables" },

	{
		dir = "/home/luc/Projects/myplugin",
		wants = "telescope.nvim",
		cmd = { "Boxes", "Figlet", "Pyfiglet", "Cowsay" },
		config = function()
			local make_cmd = require("myplugin").command_maker
			local opts = {
				hook_before = function(a, b)
					-- print("before " .. a .. ", " .. b)
					local api = require("Comment.api")
					-- api.uncomment.linewise("j")
					vim.cmd("normal! " .. a .. "ggv")
					vim.cmd("normal! " .. b .. "ggv")
					api.toggle.linewise(vim.fn.visualmode())
				end,
				hook_after = function(a, b)
					print("after " .. a .. ", " .. b)
					local api = require("Comment.api")
					-- pcall(api.comment.linewise, "j")
					vim.cmd("normal! " .. a .. "ggv")
					vim.cmd("normal! " .. b .. "ggv")
					api.comment.linewise(vim.fn.visualmode())
				end,
			}
			opts = {}
			make_cmd("Boxes", 'boxes -l | grep -P "(?s)^[^\\s-]\\S*$"', "boxes -m -d")
			make_cmd("Figlet", "ls /usr/share/figlet/fonts/ | grep .flf | sed s/\\.flf$//", "figlet -f", opts)
			make_cmd("Pyfiglet", "pyfiglet -l", "xargs pyfiglet -f", opts)
			make_cmd("Cowsay", "cowsay -l | sed 1d | tr ' ' '\n'", "cowsay -f")
		end,
	},

	"JoseConseco/telescope_sessions_picker.nvim",
	"b0o/SchemaStore.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"MunifTanjim/nui.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvim-lua/plenary.nvim",
	"windwp/nvim-spectre",
	"folke/twilight.nvim",
	"folke/which-key.nvim",
	{
		cmd = { "ChatGTP" },
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				-- optional configuration
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- require("plugins.lsp"),
	"nvim-treesitter/nvim-treesitter",
	"jose-elias-alvarez/null-ls.nvim",
	"morhetz/gruvbox",
	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "toml",
		config = function()
			require("crates").setup()
			local cmp = require("cmp")
			cmp.setup.buffer({ sources = { { name = "crates" } } })
		end,
	},
	-- require("config/plugins/mason"),

	{
		enabled = true,
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	{
		"folke/styler.nvim",
		event = "VeryLazy",
		config = {
			themes = {
				markdown = { colorscheme = "tokyonight-storm" },
				help = { colorscheme = "oxocarbon", background = "dark" },
				-- noice = { colorscheme = "gruvbox", background = "dark" },
			},
		},
	},

	{
		"folke/drop.nvim",
		event = "VimEnter",
		enabled = false,
		config = function()
			math.randomseed(os.time())
			local theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)]
			require("drop").setup({ theme = theme })
		end,
	},

	{ "shaunsingh/oxocarbon.nvim", enabled = true },

	{ "ellisonleao/gruvbox.nvim" },

	{
		"folke/paint.nvim",
		enabled = false,
		event = "BufReadPre",
		config = function()
			require("paint").setup({
				highlights = {
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%-%s*(@%w+)",
						hl = "Constant",
					},
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%[%[(@%w+)",
						hl = "Constant",
					},
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%-%s*@field%s+(%S+)",
						hl = "@field",
					},
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%-%s*@class%s+(%S+)",
						hl = "@variable.builtin",
					},
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%-%s*@alias%s+(%S+)",
						hl = "@keyword",
					},
					{
						filter = { filetype = "lua" },
						pattern = "%s*%-%-%-%s*@param%s+(%S+)",
						hl = "@parameter",
					},
				},
			})
		end,
	},

	-- With the release of Neovim 0.6 we were given the start of extensible core UI hooks (vim.ui.select and vim.ui.input). They exist to allow plugin authors to override them with improvements upon the default behavior, so that's exactly what we're going to do.
	--
	-- It is a goal to match and not extend the core Neovim API. All options that core respects will be respected, and we will not accept any custom parameters or options in the functions. Customization will be done entirely using a separate configuration method.
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- LSP
	{
		"SmiteshP/nvim-navic",
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
		end,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		config = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		config = true,
	},

	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		config = { snippet_engine = "luasnip" },
	},

	-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
	{
		"m-demare/hlargs.nvim",
		event = "VeryLazy",
		enabled = false,
		config = {
			excluded_argnames = {
				usages = {
					lua = { "self", "use" },
				},
			},
		},
	},

	-- Theme: icons
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},

	-- A high performance filetype mode for Neovim which leverages conceal and highlights your buffer with the correct color codes.
	{
		"norcalli/nvim-terminal.lua",
		ft = "terminal",
		config = true,
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = {
			auto_open = false,
			use_diagnostic_signs = true, -- en
		},
	},

	-- Persistence is a simple lua plugin for automated session management.
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = {
			-- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
			dir = vim.fn.expand(vim.fn.stdpath("data") .. "/session/"), -- directory where session files are saved
			options = { "buffers", "curdir", "tabpages", "winsize", "help" },
		},
	},

	-- Structural search and replace for Neovim.
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{
				"<leader>cR",
				function()
					require("ssr").open()
				end,
				mode = { "n", "x" },
				desc = "Structural Replace",
			},
		},
	},

	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- Lightweight alternative to context.vim implemented with nvim-treesitter.
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		-- config = true,
		config = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
				-- For all filetypes
				-- Note that setting an entry here replaces all other patterns for this entry.
				-- By setting the 'default' entry below, you can control which nodes you want to
				-- appear in the context window.
				default = {
					"class",
					"function",
					"method",
					"for",
					"while",
					"if",
					"switch",
					"case",
					"interface",
					"struct",
					"enum",
				},
				-- Patterns for specific filetypes
				-- If a pattern is missing, *open a PR* so everyone can benefit.
				tex = {
					"chapter",
					"section",
					"subsection",
					"subsubsection",
				},
				haskell = {
					"adt",
				},
				rust = {
					"impl_item",
				},
				terraform = {
					"block",
					"object_elem",
					"attribute",
				},
				scala = {
					"object_definition",
				},
				vhdl = {
					"process_statement",
					"architecture_body",
					"entity_declaration",
				},
				markdown = {
					"section",
				},
				elixir = {
					"anonymous_function",
					"arguments",
					"block",
					"do_block",
					"list",
					"map",
					"tuple",
					"quoted_content",
				},
				json = {
					"pair",
				},
				typescript = {
					"export_statement",
				},
				yaml = {
					"block_mapping_pair",
				},
			},
			exact_patterns = {
				-- Example for a specific filetype with Lua patterns
				-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
				-- exactly match "impl_item" only)
				-- rust = true,
			},

			-- [!] The options below are exposed but shouldn't require your attention,
			--     you can safely ignore them.

			zindex = 20, -- The Z-index of the context window
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
		},
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
	},

	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
	-- It extends vim's % key to language-specific words instead of just single characters.
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
		end,
	},

	-- Neovim's default :bdelete command can be quite annoying, since it also messes up your entire
	-- window layout by deleting windows. bufdelete.nvim aims to fix that by providing useful commands
	-- that allow you to delete a buffer without messing up your window layout.
	{
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
	},
}

return M
