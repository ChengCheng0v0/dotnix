{ config, ... }:

{
  services.ddclient = {
    enable = true;
    usev6 = "webv6, webv6=http://[2402:4e00:1013:e500:0:9671:f018:4947]";

    protocol = "cloudflare";
    zone = "moe.cash";
    username = "token";
    passwordFile = "/run/secrets/ddclient/cloudflare/password";
    domains = [ "${config.networking.hostName}.moe.cash" ];
  };
}
