{ lib, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "chengcheng@miao.ms";
    userName = "成成0v0";

    /* ----------------------------------------------------- *
      sec   rsa2048 2024-10-25 [SCEAR]
            58E6F884D0EA5D3039EB3D68EB30D47C23175F56
      uid             [ 绝对 ] 成成0v0 <chengcheng@miao.ms>
      ssb   rsa2048 2024-10-25 [SEA]                         */
    signing.key = "58E6F884D0EA5D3039EB3D68EB30D47C23175F56";
    /* -----------^----------------------------------------^ */

    extraConfig = {
      credential.helper = "store"; # 使用 .git-credentials 中的身份验证信息
      commit = {
        gpgSign = true;
        verbose = true;
      };
      pull.rebase = false;
    };
  };

  # 从机密中获取信息并写入 .git-credentials
  home.activation.writeGitCredentials = let
    getSecret = builtins.extraBuiltins.getSecret;
  in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "https://${getSecret "gitCredentials/chengcheng_0v0/username"}:${getSecret "gitCredentials/chengcheng_0v0/password"}@${getSecret "gitCredentials/chengcheng_0v0/host"}" > ~/.git-credentials
    chmod 600 ~/.git-credentials
  '';
}
