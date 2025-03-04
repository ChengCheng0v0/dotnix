{ lib, ... }:

{
  services.n8n = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.n8n = {
    environment = lib.mkForce {
      N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS = "true";
      N8N_USER_FOLDER = "/data/n8n";
      HOME = "/data/n8n";

      N8N_HOST = "flows.hic.top";
      WEBHOOK_URL = "https://flows.hic.top";
      WEBHOOK_TUNNEL_URL = "https://flows.hic.top";
    };
    serviceConfig = {
      DevicePolicy = lib.mkForce null;
      StateDirectory = lib.mkForce null;
      PrivateDevices = lib.mkForce false;
      ProtectSystem = lib.mkForce false;
      DynamicUser = lib.mkForce false;
      Group = "n8n";
      User = "n8n";
    };
  };

  users = {
    users.n8n = {
      isSystemUser = true;
      group = "n8n";
      home = "/data/n8n";
    };
    groups.n8n = {};
  };
}
