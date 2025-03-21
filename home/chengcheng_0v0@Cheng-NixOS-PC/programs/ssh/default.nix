{ config, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks.vm-m710q-server = {
      host = "vm-m710q-server";
      hostname = "192.168.2.201";
      user = "chengcheng_0v0";

      identityFile = "${config.home.homeDirectory}/data/SSH_Keys/vm-m710q-server/chengcheng_0v0/id_rsa";
    };
  };
}
