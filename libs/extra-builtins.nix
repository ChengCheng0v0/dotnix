{ exec, ... }: {
  # 解密 Sops 机密文件并将其作为 Nix 表达式完整返回
  readSops = path: builtins.fromJSON (exec [
    "sh" "-c" ''
      echo -n \'\'$(env SOPS_AGE_KEY_FILE=/var/lib/sops/age-key.txt sops -d ${path})\'\'
    ''
  ]);

  # 通过 sops-nix 创建的解密后文件获取指定机密的明文
  # WARNING: 使用此函数需要确保已正确配置 sops-nix；无法获取未声明的机密项。
  getSecret = name: builtins.readFile "/run/secrets/${name}";
}
