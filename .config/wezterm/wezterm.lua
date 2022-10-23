--                        __                    
--   _      _____  ____  / /____  _________ ___ 
--  | | /| / / _ \/_  / / __/ _ \/ ___/ __ `__ \
--  | |/ |/ /  __/ / /_/ /_/  __/ /  / / / / / /
--  |__/|__/\___/ /___/\__/\___/_/  /_/ /_/ /_/ 
--                                              
local wezterm = require("wezterm")
local act = wezterm.action

return {
	enable_wayland = true,

	--    __        __       __
	--   / /_____ _/ /_     / /_  ____ ______
	--  / __/ __ `/ __ \   / __ \/ __ `/ ___/
	-- / /_/ /_/ / /_/ /  / /_/ / /_/ / /
	-- \__/\__,_/_.___/  /_.___/\__,_/_/
	--
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Jetbrains Mono", weight = "Bold" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 11.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#333333",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#333333",
	},

	--               __                        __
	--   _________  / /___  _____   __________/ /_  ___  ____ ___  ___
	--  / ___/ __ \/ / __ \/ ___/  / ___/ ___/ __ \/ _ \/ __ `__ \/ _ \
	-- / /__/ /_/ / / /_/ / /     (__  ) /__/ / / /  __/ / / / / /  __/
	-- \___/\____/_/\____/_/     /____/\___/_/ /_/\___/_/ /_/ /_/\___/
	--
	color_scheme = "ayu",
	-- color_scheme = "tokyonight",
	-- color_scheme = "Flatland",
	-- color_scheme = "FunForrest",
	-- color_scheme = "Gruvbox Dark",
	-- color_scheme = "HaX0R_R3D",

	--               __
	--   _________  / /___  __________
	--  / ___/ __ \/ / __ \/ ___/ ___/
	-- / /__/ /_/ / / /_/ / /  (__  )
	-- \___/\____/_/\____/_/  /____/
	--
	colors = {
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			-- inactive_tab_edge = "#575757",
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			-- background = "#0b0022",
			background = "#141722",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				-- bg_color = "#2b2042",
				bg_color = "#2e354f",
				-- The color of the text for the tab
				fg_color = "#c5c5c5",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Bold",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				-- bg_color = "#1b1032",
				bg_color = "#23283c",
				fg_color = "#808080",
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				-- bg_color = "#3b3052",
				bg_color = "#343b59",
				fg_color = "#909090",
				italic = true,
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				-- bg_color = "#1b1032",
				bg_color = "#3c232c",
				fg_color = "#808080",
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				-- bg_color = "#3b3052",
				bg_color = "#56323f",
				fg_color = "#909090",
			},
		},

		--[[ 
		-- The default text color
		foreground = "silver",
		-- The default background color
		background = "black",

		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		cursor_bg = "#52ad70",
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = "black",
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = "#52ad70",

		-- the foreground color of selected text
		selection_fg = "black",
		-- the background color of selected text
		selection_bg = "#fffacd",

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = "#222222",

		-- The color of the split lines between panes
		split = "#444444",

		ansi = {
			"black",
			"maroon",
			"green",
			"olive",
			"navy",
			"purple",
			"teal",
			"silver",
		},
		brights = {
			"grey",
			"red",
			"lime",
			"yellow",
			"blue",
			"fuchsia",
			"aqua",
			"white",
		},

		-- Arbitrary colors of the palette in the range from 16 to 255
		indexed = { [136] = "#af8700" },

		-- Since: 20220319-142410-0fcdea07
		-- When the IME, a dead key or a leader key are being processed and are effectively
		-- holding input pending the result of input composition, change the cursor
		-- to this color to give a visual cue about the compose state.
		compose_cursor = "orange",

		-- Colors for copy_mode and quick_select
		-- available since: 20220807-113146-c2fee766
		-- In copy_mode, the color of the active text is:
		-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
		-- 2. selection_* otherwise
		copy_mode_active_highlight_bg = { Color = "#000000" },
		-- use `AnsiColor` to specify one of the ansi color palette values
		-- (index 0-15) using one of the names "Black", "Maroon", "Green",
		--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
		-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
		copy_mode_active_highlight_fg = { AnsiColor = "Black" },
		copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
		copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

		quick_select_label_bg = { Color = "peru" },
		quick_select_label_fg = { Color = "#ffffff" },
		quick_select_match_bg = { AnsiColor = "Navy" },
		quick_select_match_fg = { Color = "#ffffff" }, ]]
	},

	inactive_pane_hsb = {
		saturation = 0.7,
		brightness = 0.7,
	},

	quick_select_patterns = {
		-- match things that look like sha1 hashes
		-- (this is actually one of the default patterns)
		"[0-9a-f]{7,40}",
		"(color|window|enable)[a-z_]*",
	},

	-- e.g. distinguish between tab and ctrl-i
	enable_csi_u_key_encoding = true,

	--     ____            __
	--    / __/___  ____  / /_
	--   / /_/ __ \/ __ \/ __/
	--  / __/ /_/ / / / / /_
	-- /_/  \____/_/ /_/\__/
	--
	-- font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
	-- font = wezterm.font("Hack"),
	font = wezterm.font("JetBrains Mono"),
	font_size = 12,

	--     __
	--    / /_____  __  ______ ___  ____ _____  _____
	--   / //_/ _ \/ / / / __ `__ \/ __ `/ __ \/ ___/
	--  / ,< /  __/ /_/ / / / / / / /_/ / /_/ (__  )
	-- /_/|_|\___/\__, /_/ /_/ /_/\__,_/ .___/____/
	--           /____/               /_/
	--
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
		{ key = '"', mods = "ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = '"', mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "%", mods = "CTRL", action = act.ActivateTab(4) },
		{ key = "%", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
		{ key = "%", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "%", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "'", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = ")", mods = "CTRL", action = act.ResetFontSize },
		{ key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
		{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
		{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
		{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
		{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
		{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
		{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
		{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
		{ key = "9", mods = "ALT", action = act.ActivateTab(8) },
		{ key = "5", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "K", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
		{ key = "M", mods = "SHIFT|CTRL", action = act.Hide },
		{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
		{ key = "P", mods = "SHIFT|CTRL", action = act.PaneSelect({ alphabet = "", mode = "Activate" }) },
		{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
		{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{
			key = "U",
			mods = "SHIFT|CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
		{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
		{ key = "[", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
		{
			key = "a",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_pane",
				one_shot = true,
				replace_current = false,
				timeout_milliseconds = 1000,
				until_unknown = false,
			}),
		},
		{ key = "a", mods = "CTRL|LEADER", action = act.SendString("") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
		{ key = "f", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "k", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
		{ key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
		{ key = "m", mods = "SHIFT|CTRL", action = act.Hide },
		{ key = "n", mods = "SHIFT|CTRL", action = act.SpawnWindow },
		{ key = "p", mods = "SHIFT|CTRL", action = act.PaneSelect({ alphabet = "", mode = "Activate" }) },
		{ key = "r", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
		{
			key = "r",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
				replace_current = false,
				until_unknown = false,
			}),
		},
		{ key = "t", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
		{
			key = "u",
			mods = "SHIFT|CTRL",
			action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
		},
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "w", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "x", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
		{ key = "z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
		{ key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "|", mods = "SHIFT|LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
		{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "PageUp", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
		{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "PageDown", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
		{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
		{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	},

	key_tables = {
		activate_pane = {
			{ key = "h", mods = "NONE", action = act.ActivatePaneDirection("Left") },
			{ key = "j", mods = "NONE", action = act.ActivatePaneDirection("Down") },
			{ key = "k", mods = "NONE", action = act.ActivatePaneDirection("Up") },
			{ key = "l", mods = "NONE", action = act.ActivatePaneDirection("Right") },
			{ key = "LeftArrow", mods = "NONE", action = act.ActivatePaneDirection("Left") },
			{ key = "RightArrow", mods = "NONE", action = act.ActivatePaneDirection("Right") },
			{ key = "UpArrow", mods = "NONE", action = act.ActivatePaneDirection("Up") },
			{ key = "DownArrow", mods = "NONE", action = act.ActivatePaneDirection("Down") },
		},

		copy_mode = {
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{
				key = "y",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
			{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
		},

		resize_pane = {
			{ key = "Escape", mods = "NONE", action = act.PopKeyTable },
			{ key = "h", mods = "NONE", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "j", mods = "NONE", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "k", mods = "NONE", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "l", mods = "NONE", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "LeftArrow", mods = "NONE", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "RightArrow", mods = "NONE", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "UpArrow", mods = "NONE", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "DownArrow", mods = "NONE", action = act.AdjustPaneSize({ "Down", 1 }) },
		},

		search_mode = {
			{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PriorMatchPage") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("NextMatchPage") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("NextMatch") },
		},
	},
}
