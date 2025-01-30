{ exec, ... }: {
  readSops = path: builtins.fromJSON (exec [
    "sh" "-c" ''
      echo -n \'\'$(env SOPS_AGE_KEY_FILE=/var/lib/sops/age-key.txt sops -d ${path})\'\'
    ''
  ]);
  # getSecrets = name: name;
}
