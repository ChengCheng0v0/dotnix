{ pkgs, ... }:

{
  users.users = {
    chengcheng_0v0 = {
      isNormalUser = true;
      description = "成成0v0";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
      shell = pkgs.fish;
    };
  };
}
