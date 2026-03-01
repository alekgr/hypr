#!/usr/bin/bash

ln -sfn ~/.config/hypr/custom/rocket_hyprland_big_monitor+laptop_debug.conf hyprland.conf
pkill waybar

ln -sfn ~/.config/waybar/rocket_big_monitor_config ~/.config/waybar/config
hyprctl dispatch exec waybar
