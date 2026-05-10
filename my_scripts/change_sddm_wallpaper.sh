wallpaper_current="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
sddm_wallpaper="/usr/share/sddm/themes/SilentSDDM/backgrounds/default.jpg"
echo "asdf" | sudo -S cp -f "$wallpaper_current" "$sddm_wallpaper"

notify-send -i "$iDIR/ja.png" "SDDM" "Background SET"
