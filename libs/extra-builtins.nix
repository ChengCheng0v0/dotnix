{ exec, ... }: {
  readSops = name: exec [ "env" "SOPS_AGE_KEY_FILE=/var/lib/sops/age-key.txt" "sops" "-d" name ];
}
