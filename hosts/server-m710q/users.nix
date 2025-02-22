{ pkgs, ... }:

{
  users.users = {
    root = {
      shell = pkgs.fish;
    };
    chengcheng_0v0 = {
      isNormalUser = true;
      description = "成成0v0";
      extraGroups = [ "wheel" ];
      packages = with pkgs; [];
      shell = pkgs.fish;
    };
  };
}
