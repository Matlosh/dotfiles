-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar")
    hl.exec_cmd("mpvpaper 'ALL' /home/matlosh/wallpapers/CC.png -o 'no-audio --loop-file=inf'")
end)
