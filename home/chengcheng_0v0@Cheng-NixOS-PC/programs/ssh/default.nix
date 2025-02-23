{
  programs.ssh = {
    enable = true;

    matchBlocks.server-m710q = {
      host = "server-m710q";
      hostname = "192.168.2.3";
      user = "chengcheng_0v0";
    };
  };
}
