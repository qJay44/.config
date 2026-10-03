---------- Monitors ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

hl.monitor({
  output   = "HDMI-A-1",
  mode     = "preferred",
  position = "auto-left",
  scale    = "auto",
})

---------- My programs ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun -theme ~/.config/rofi/config.rasi"
local DUNST_SCRIPTS = "~/.config/dunst/scripts"

---------- Autostart -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar & hyprpaper &")
  hl.exec_cmd("bluetoothctl power off")
  hl.exec_cmd("wl-paste -t text -w xclip -selection clipboard")

  -- Browser file picker theme
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
  hl.exec_cmd("systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gtk")
end)

---------- Environment variables -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

hl.env("GTK_THEME", "Adwaita-dark")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---------- Permissions ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/

---------- Look and feel -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 10,

    border_size = 2,

    col = {
      active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding       = 10,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,
    dim_special = 0.0,
    screen_shader = "shaders/default.frag",

    shadow = {
      enabled      = false,
      range        = 4,
      render_power = 3,
    },

    blur = {
      enabled   = true,
      size      = 2,
      passes    = 1,
      vibrancy  = 0.1696,
    },
  },

  animations = {
      enabled = true,
  },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
  master = {
    new_status = "master",
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

hl.config({
  misc = {
    force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

---------- Input ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local dwt = true
local function toggle_dwt()
  dwt = not dwt
  hl.config({
    input = {
      touchpad = {
        disable_while_typing = dwt
      }
    }
  })

  arg = "off"
  if (dwt) then
    arg = "on"
  end

  hl.exec_cmd("~/.config/hypr/scripts/toggle_touchpad_moving_while_typing.sh " .. arg)
end


hl.config({
  input = {
    kb_layout  = "us,ru",
    kb_variant = "",
    kb_model   = "",
    kb_options = "grp:alt_shift_toggle",
    kb_rules   = "",

    follow_mouse = 1,

    sensitivity = 0.25, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
      disable_while_typing = false,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name          = "bltp7840:00-347d:7840-touchpad",
  scroll_factor = 0.15
})

---------- Keybinds ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(terminal, {float = true, center = true, size = {1200, 720}}))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. " + down", toggle_dwt)
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.swap({direction = "left"}))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.swap({direction = "right"}))
hl.bind(mainMod .. " + ALT + 0", hl.dsp.window.resize({x = 1280, y = 720}))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/record-window.sh"))

-- vim like jumps between windows
hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "up"   }))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + W",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(DUNST_SCRIPTS .. "/volume.sh 5%+"),             { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(DUNST_SCRIPTS .. "/volume.sh 5%-"),             { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(DUNST_SCRIPTS .. "/brightness.sh 5%+"),         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(DUNST_SCRIPTS .. "/brightness.sh 5%-"),         { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("notify-send 'Lid Switch [on]'"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("notify-send 'Lid Switch [off]'"), { locked = true })

---------- Windows -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
      class      = "^$",
      title      = "^$",
      xwayland   = true,
      float      = true,
      fullscreen = false,
      pin        = false,
  },

  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule

-- hl.window_rule({
--   name  = "move-hyprland-run",
--   match = { class = "hyprland-run" },
--   move  = "20 monitor_h-120",
--   float = true,
-- })

local windowRules = {
  {
    name = "cpp-windows",
    match = {
      title = "MyProgram",
    },
    float = true,
    center = true
  },
  {
    name = "python-plot-windows",
    match = {
      class = "Matplotlib",
    },
    float = true,
    center = true
  },
  {
    name = "neovide",
    match = {
      class = "neovide",
      workspace = "2"
    },
    workspace = "special:magic",
  },
  {
    name = "neovide-magic",
    match = {
      class = "neovide",
      workspace = "special:magic"
    },
    no_blur = true
  },
  {
    name = "android-studio",
    match = {
      class = "(?:^jetbrains-.+$)"
    },
    float = true,
    tag = "+jb"
  },
  {
    name = "android-studio-tagged",
    match = {
      tag = "jb"
    },
    stay_focused = false,
    no_initial_focus = true
  },
}

local excludedClasses = {}
for _, rule in ipairs(windowRules) do
  table.insert(excludedClasses, rule.match.class)
  hl.window_rule(rule)
end

hl.window_rule({
  name = "fallback",
  match = {
    class = "negative:" .. table.concat(excludedClasses, "|"),
  },
  float = true,
  size = {1600, 900},
  center = true,
})

---------- Workspaces ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({
  workspace = "2",
  on_created_empty = "[silent] google-chrome-stable"
})

for i = 1, 3 do
  hl.workspace_rule({
    workspace = "" .. i,
    monitor = "eDP-1"
  })
end

for i = 4, 6 do
  hl.workspace_rule({
    workspace = "" .. i,
    monitor = "HDMI-A-1"
  })
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

