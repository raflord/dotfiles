---- MONITORS ----
require("configs.monitors")

---- AUTOSTART ----
require("configs.autostart")

---- ENVIRONMENT VARIABLES ----
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

---- LOOK AND FEEL ----
require("configs.look_and_feel")

---- INPUT ----
require("configs.input")

---- KEYBINDINGS ----
require("configs.keybinds")

---- WINDOWS AND WORKSPACES ----
require("configs.windows_and_workspaces")
