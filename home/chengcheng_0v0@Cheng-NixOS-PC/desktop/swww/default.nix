{ pkgs, ... }:

let
  mkSetAtTime = {
    service = name: {
      Unit = {
        Description = "Set ${name} wallpaper using swww";
        Requires = [ "swww-daemon.service" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww img ${./toggle_targets/time-${name}} --transition-type grow --transition-duration 1.5 --transition-fps 160";
      };
    };
    timer = name: (time: {
      Unit = {
        Description = "Auto set `${name}` wallpaper using swww";
        Requires = [ "swww-daemon.service" ];
        After = [ "graphical-session.target" ];
      };
      Timer = {
        Unit = "swww-set-at-time-${name}.service";
        OnCalendar = "*-*-* ${time}";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    });
  };
in {
  # swww 守护进程
  systemd.user.services.swww-daemon = {
    Unit = {
      Description = "The swww daemon for Wayland wallpaper management";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      ConditionEnvironment = [ "WAYLAND_DISPLAY" ];
    };
    Service = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # 时间到达早上 (7:00) 时设置壁纸
  # systemd.user.services.swww-set-at-time-morning = mkSetAtTime.service "morning";
  # systemd.user.timers.swww-set-at-time-morning = mkSetAtTime.timer "morning" "7:00:00";

  # 时间到达夜晚 (19:00) 时设置壁纸
  # systemd.user.services.swww-set-at-time-night = mkSetAtTime.service "night";
  # systemd.user.timers.swww-set-at-time-night = mkSetAtTime.timer "night" "19:00:00";
}
