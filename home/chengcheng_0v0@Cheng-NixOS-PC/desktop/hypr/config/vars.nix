{ vars, ... }:

{
  "$mainMod" = "SUPER";

  "$terminal" = "kitty";
  "$file_manager" = "kitty yazi";
  "$gui_file_manager" = "nemo";
  "$menu" = "rofi -modes drun,run,ssh -show drun";
  "$wp_picker" = "${vars.nixOsConfigPath}/scripts/wallpaper_picker/target/release/wallpaper_picker";
  "$region_screenshot" = "${vars.nixOsConfigPath}/scripts/region_screenshot.sh";
}
