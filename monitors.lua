local function apply_monitor_config()
    local monitors = hl.get_monitors()
    local big_monitor_name = nil
    
    -- Loop through active screens and find any HDMI-A output
    for _, m in ipairs(monitors) do
        if m.name and m.name:match("^HDMI%-A%-") then
            big_monitor_name = m.name
            break
        end
    end
    
    -- Apply layouts based on detection using standard hl.config strings
    if big_monitor_name then
        hl.config({
            monitor = {
                big_monitor_name .. ", 3840x2160@60, 0x0, 1",
                "eDP-1, 1920x1080@60, 3840x0, 1"
            }
        })
    else
        -- Fallback: Laptop screen only when disconnected
        hl.config({
            monitor = {
                "eDP-1, 1920x1080@60, 0x0, 1"
            }
        })
    end
end

-- Connect the configuration handler to Hyprland's window manager event hooks
hl.on("config.reloaded", apply_monitor_config)
hl.on("monitor.added", apply_monitor_config)
hl.on("monitor.removed", apply_monitor_config)

-- Run the check immediately on initialization
apply_monitor_config()
