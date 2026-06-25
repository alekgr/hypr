hl.on("hyprland.start",
	function()
    		hl.exec_cmd("swaybg -i /usr/share/hypr/wall2.png")
		hl.exec_cmd("waybar")
		hl.exec_cmd("pypr --debug /tmp/pypr.log")
end)

