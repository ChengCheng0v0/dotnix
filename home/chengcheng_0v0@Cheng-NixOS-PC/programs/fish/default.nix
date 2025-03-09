{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
    '';
    shellAliases = {
      ip = "ip -c";
      grep ="grep --color=auto";
      wlc = "wl-copy";

      l = "eza --icons";
      la = "eza --icons -a";
      ll = "eza --icons -al";
      lss = "eza --icons --sort=size -la";
      lg = "eza --icons --git -al";
      ld = "eza --icons --group-directories-first -al";
      tree = "eza --tree --icons -L";
    };
    functions = {
      # Yazi wrapper
      y = builtins.readFile ./functions/y.fish;
    };
  };

  catppuccin.fish.enable = true;

  xdg.configFile."fish/conf.d".source = ./config/conf.d;
}
