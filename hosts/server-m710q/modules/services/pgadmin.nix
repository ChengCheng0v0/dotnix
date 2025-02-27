{ lib, ... }:

{
  services.pgadmin = {
    enable = true;
    openFirewall = true;
    settings = {
      DATA_DIR = "/data/pgadmin";
    };

    initialEmail = "suxinchengcheng@gmail.com";
    initialPasswordFile = "/tmp/pgadmin_initial_password";
  };

  # 关闭动态用户以允许设置自定义数据目录
  systemd.services.pgadmin.serviceConfig.DynamicUser = lib.mkForce false;
}
