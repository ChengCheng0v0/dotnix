{ lib, ... }:

{
  services.postgresql = {
    enable = true;
    dataDir = "/data/postgres";
    enableTCPIP = true;
    settings = {
      listen_addresses = lib.mkForce "*";
    };

    ensureDatabases = [ "test" ];
    ensureUsers = [
      { name = "test"; }
    ];
    authentication = ''
      host  all  all  0.0.0.0/0  md5
      host  all  all  ::/0       md5
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [ 5432 ];
  };
}
