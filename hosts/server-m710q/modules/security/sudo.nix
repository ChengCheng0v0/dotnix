{ pkgs, ... }:

{
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "chengcheng_0v0" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
