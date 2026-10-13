hl.on("hyprland.start",
	function()
    		hl.exec_cmd("swaybg -i /usr/share/hypr/wall2.png")
		hl.exec_cmd("kitty --class kitty-dropterm")
		hl.exec_cmd("kitty --class kitty-dropneomutt -e neomutt")
		hl.exec_cmd("kitty --class kitty-dropyazi -e yazi")
		hl.exec_cmd("kitty --class kitty-dropcmus -e cmus")
        end)
