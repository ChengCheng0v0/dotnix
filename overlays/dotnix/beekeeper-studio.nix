self: super: {
  beekeeper-studio = super.beekeeper-studio.overrideAttrs (oldAttrs: {
    buildCommand = oldAttrs.buildCommand + ''
      awk -i inplace -F '=' '
        { if ($1 == "Exec") sub($2, "beekeeper-studio --use-gl=desktop %U") }
        { print }
      ' $out/share/applications/${oldAttrs.pname}.desktop
    '';
  });
}
