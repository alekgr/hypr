local function apply_monitor_config()
 	local monitors = hl.get_monitors()
 	local has_big_monitor = false
 	for  _, m in ipairs(monitors) do
 		if m.name and m.name == "HDMI-A-1" then
			has_big_monitor = true
			break
		end
	end

	if has_big_monitor then
		hl.monitor({
			output = "HDMI-A-1",
			mode = "3840x2160@60",
			position = "0x0",
			scale = "1",
		})
		hl.monitor({
			output = "eDP-1",
			mode = "1920x1080@60",
			position = "3840x0",
			scale = "1",
		})

	else
		hl.monitor({
			output = "eDP-1",
			mode = "1920x1080@60",
			position = "0x0",
			scale = "1",
		})
	end
end

hl.on("config.reloaded", apply_monitor_config)
hl.on("monitor.added", apply_monitor_config)
hl.on("monitor.removed", apply_monitor_config)

apply_monitor_config()
