{ ... }:

{
  programs.fish = {
    enable = true;
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
  };
}
