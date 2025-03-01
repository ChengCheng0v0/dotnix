{ pkgs, vars, ... }:

{
  "$mainMod" = "SUPER";

  "$terminal" = "kitty";
  "$file_manager" = "kitty yazi";
  "$gui_file_manager" = "nautilus";
  "$menu" = "rofi -modes drun,run,ssh -show drun";
  "$wp_picker" = "${pkgs.dotnix.wallpaper_picker}/bin/wallpaper_picker";
  "$region_screenshot" = "${vars.nixOsConfigPath}/scripts/region_screenshot.sh";
}
