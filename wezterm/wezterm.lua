local wezterm = require("wezterm")
local act = wezterm.action
local meh = 'CTRL|SHIFT|OPT'

return {

	-- general
	color_scheme = "Dracula (Official)",
	default_cwd = "/Users/sam/code/",
  line_height = 1.3,

	-- font
	font_size = 18.0,
	font = wezterm.font('MonoLisa Nerd Font Mono', {
		weight = "DemiBold",
		stretch = "ExtraExpanded",
	}),

	-- window
	window_background_opacity = 1,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	-- tabs
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	integrated_title_button_style = "MacOsNative",

	-- keybinding
	keys = {
		{
			key = 'R',
			mods = 'CTRL|SHIFT',
			action = act.PromptInputLine {
				description = 'Enter new name for tab',
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			},
		},

		{ key = 'p', 					mods = 'SUPER', 			action = act.ShowLauncher },
		{ key = 'p', 					mods = 'SUPER|SHIFT', action = act.ShowLauncherArgs { flags = 'FUZZY|LAUNCH_MENU_ITEMS' }},

		{ key = 'n', 					mods = 'CTRL',	 			action = act.ActivateTabRelative(-1) },
  	{ key = 'o', 					mods = 'CTRL',	 			action = act.ActivateTabRelative(1) },
		{ key = 'Escape', 		mods = 'SHIFT',				action = act.ScrollToBottom },

		{ key = 'UpArrow', 		mods = 'SHIFT', 			action = act.ScrollByLine(-1) },
		{ key = 'DownArrow', 	mods = 'SHIFT', 			action = act.ScrollByLine(1) },

		{ key = "LeftArrow",	mods = "OPT",					action = act.SendKey({ mods = "ALT", key = "b" }) },
		{ key = "RightArrow",	mods = "OPT",					action = act.SendKey({ mods = "ALT", key = "f" }) },
		{ key = "LeftArrow",	mods = "CMD",					action = act.SendKey({ mods = "CTRL", key = "a" }) },
		{ key = "RightArrow",	mods = "CMD",					action = act.SendKey({ mods = "CTRL", key = "e" }) },
		{ key = "Backspace",	mods = "CMD",					action = act.SendKey({ mods = "CTRL", key = "u" }) },
		{ key = "l",					mods = "CMD",					action = act.SendString('lazygit\x0A') },
	},


	launch_menu = {
		{
			label = 'Home',
			cwd = "~"
		},
		{
			label = 'Config',
			args = {'code', '/Users/sam/code/dotfiles'},
			cwd = "/Users/sam/code/dotfiles"
		},
		{
			label = 'Code/Dotfiles',
			cwd = "/Users/sam/code/dotfiles"
		},
		{
			label = 'Code/Sys',
			cwd = "/Users/sam/code/dotfiles"
		},
		{
			label = 'MYZ',
			cwd = "/Users/sam/code/myziegler-portal",
		},
		{
			label = 'MYZ/frontend',
			cwd = "/Users/sam/code/myziegler-portal/frontend",
		},

	}
}
