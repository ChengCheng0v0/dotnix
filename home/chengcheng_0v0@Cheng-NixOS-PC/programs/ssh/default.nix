{
  programs.ssh = {
    enable = true;

    matchBlocks.server-m710q = {
      host = "192.168.2.3";
    };
  };
}
