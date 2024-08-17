local wezterm = require("wezterm")
local act = wezterm.action
-- local meh = "CTRL|SHIFT|OPT"

local padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

-- wezterm.on("update-status", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if string.find(pane:get_title(), "^n-vi-m-.*") then
-- 		overrides.window_padding = {
-- 			left = 0,
-- 			right = 0,
-- 			top = 0,
-- 			bottom = 0,
-- 		}
-- 	else
-- 		overrides.window_padding = padding
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

-- wezterm.on('update-right-status', function(window, pane)
--   window:set_left_status 'left'
--   window:set_right_status 'right'
-- end)

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.tab_index + 1
	if tab.is_active then
		return {
			{ Background = { Color = "#4161cc" } },
			{ Text = "  " .. title .. "  " },
		}
	end
	return "  " .. title .. "  "
end)

return {
	-- general
	color_scheme = "Monokai Soda",
	-- color_scheme = "One Dark (Gogh)",
	default_cwd = "/Users/sam/code/",
	force_reverse_video_cursor = true,
	-- font
	line_height = 1.1,
	font_size = 17.0,
	font = wezterm.font("Monolisa", { weight = "Bold" }),
	window_padding = padding,
	-- window
	window_background_opacity = 1,
	macos_window_background_blur = 0,
	max_fps = 60,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	-- tabs
	enable_tab_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	integrated_title_button_color = "Auto",
	integrated_title_button_style = "MacOsNative",
	adjust_window_size_when_changing_font_size = true,
	-- set_environment_variables = {
	-- 	NVIM_MODE = "1",
	-- },
	-- bell
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 100,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 100,
	},

	-- general config
	clean_exit_codes = { 130 },
	automatically_reload_config = true,
	-- keybinding
	keys = {
		{
			key = "R",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		{ key = "p", mods = "SUPER", action = act.ShowLauncher },
		{ key = "p", mods = "SUPER|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS" }) },

		{ key = "n", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "o", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Escape", mods = "SHIFT", action = act.ScrollToBottom },

		{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
		{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },

		{ key = "LeftArrow", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "a" }) },
		{ key = "RightArrow", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "e" }) },
		{ key = "Backspace", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "u" }) },
		-- { key = "LeftArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "b" }) },
		-- { key = "RightArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "f" }) },
		-- { key = "l", mods = "CMD", action = act.SendString("lazygit\x0A") },
	},

	launch_menu = {
		{
			label = "/Users/sam",
			cwd = "/Users/sam",
		},
	},
}
