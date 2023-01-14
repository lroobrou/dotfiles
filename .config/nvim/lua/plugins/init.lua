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

	{
		"Wansmer/treesj",
		keys = {
			{ "J", "<cmd>TSJToggle<cr>" },
		},
		config = { use_default_keymaps = false },
	},
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

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		config = true,
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

	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
		end,
	},

	{
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
	},
}

return M
