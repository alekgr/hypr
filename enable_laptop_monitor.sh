#!/usr/bin/bash

ln -sfn ~/.config/hypr/custom/rocket_hyprland_laptop.conf hyprland.conf

pkill waybar

ln -sfn ~/.config/waybar/rocket_laptop_monitor_config ~/.config/waybar/config

hyprctl dispatch exec waybar
