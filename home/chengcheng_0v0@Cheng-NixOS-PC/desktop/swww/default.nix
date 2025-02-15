{ pkgs, ... }:

let
  mkSetAtTime = {
    service = name: {
      Unit = {
        Description = "Set `${name}` Wallpaper Using Swww";
        Requires = [ "swww-daemon.service" ];
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww img ${./toggle_targets/time-${name}} --transition-type grow --transition-duration 1.5 --transition-fps 160";
      };
    };
    timer = name: (time: {
      Unit = {
        Description = "Auto Set '${name}' Wallpaper Using Swww";
        Requires = [ "swww-daemon.service" ];
        PartOf = [ "graphical-session.target" ];
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
  # swww 的守护进程
  systemd.user.services.swww-daemon = {
    Unit = {
      Description = "Swww Daemon for Wayland Wallpaper Management";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStartPre ="/usr/bin/env sleep 2"; # HACK: 延迟一段时间以确保 Hyprland 启动完成，不然会启动失败。
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  # 登录时设置壁纸
  systemd.user.services.swww-set-at-login = {
    Unit = {
      Description = "Set Login Wallpaper Using Swww";
      Requires = [ "swww-daemon.service" ];
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStartPre="/usr/bin/env sleep 0.5"; # HACK: 延迟一段时间以确保 swww-daemon 启动完成，不然会黑屏。
      ExecStart = "${pkgs.swww}/bin/swww img ${./toggle_targets/login}";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  # 时间到达早上 (7:00) 时设置壁纸
  systemd.user.services.swww-set-at-time-morning = mkSetAtTime.service "morning";
  systemd.user.timers.swww-set-at-time-morning = mkSetAtTime.timer "morning" "7:00:00";

  # 时间到达夜晚 (19:00) 时设置壁纸
  systemd.user.services.swww-set-at-time-night = mkSetAtTime.service "night";
  systemd.user.timers.swww-set-at-time-night = mkSetAtTime.timer "night" "19:00:00";
}
