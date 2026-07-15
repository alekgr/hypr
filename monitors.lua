local function apply_monitor_config()
    local monitors = hl.get_monitors()
    local big_monitor_name = nil

    -- Loop through active screens and find any HDMI-A output
    for _, m in ipairs(monitors) do
        if m.name and m.name:match("^HDMI%-A") then
            big_monitor_name = m.name
            break
        end
    end

    -- Apply layouts based on detection
    if big_monitor_name then
        -- Big monitor on the left
        hl.monitor({
            output   = big_monitor_name,
            mode     = "3840x2160@60",
            position = "0x0",
            scale    = "1",
        })
        -- Laptop screen on the right
        hl.monitor({
            output   = "eDP-1",
            mode     = "1920x1080@60",
            position = "3840x0",
            scale    = "1",
        })
    else
        -- Fallback: Laptop screen only when disconnected from the KVM
        hl.monitor({
            output   = "eDP-1",
            mode     = "1920x1080@60",
            position = "0x0",
            scale    = "1",
        })
    end
end

-- Connect the configuration handler to Hyprland's window manager event hooks
hl.on("config.reloaded", apply_monitor_config)
hl.on("monitor.added", apply_monitor_config)
hl.on("monitor.removed", apply_monitor_config)

-- Run the check immediately on initialization
apply_monitor_config()
