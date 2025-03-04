{ config, pkgs, ... }:

{
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.0.0-20250228175314-1fb64108d4de" ];
      hash = "sha256-3nvVGW+ZHLxQxc1VCc/oTzCLZPBKgw4mhn+O3IoyiSs=";
    };

    extraConfig = let
      cfToken = builtins.extraBuiltins.getSecret "caddy/cloudflare/apiToken";
    in ''
      # Netdata
      ${config.networking.hostName}.moe.cash {
        tls {
          dns cloudflare "${cfToken}"
          resolvers 1.1.1.1
        }

        reverse_proxy :19999
      }

      # PostgreSQL
      homedb.ccs.cool {
        tls {
          dns cloudflare "${cfToken}"
          resolvers 1.1.1.1
        }

        reverse_proxy :5432
      }

      # pgAdmin
      pgadmin.hic.top {
        tls {
          dns cloudflare "${cfToken}"
          resolvers 1.1.1.1
        }

        reverse_proxy :5050
      }

      # n8n
      flows.hic.top {
        tls {
          dns cloudflare "${cfToken}"
          resolvers 1.1.1.1
        }

        reverse_proxy :5678
      }

      # Navidrome
      mlib.hic.top {
        tls {
          dns cloudflare "${cfToken}"
          resolvers 1.1.1.1
        }

        reverse_proxy :4533
      }
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
}
