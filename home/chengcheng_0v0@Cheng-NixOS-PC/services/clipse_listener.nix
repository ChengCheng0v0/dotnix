{ pkgs, ... }:

{
  systemd.user.services.clipse-listener = {
    Unit = {
      Description = "Clipboard listener for Clipse";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.clipse}/bin/clipse --listen-shell";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
