{ vars, ... }:

{
  services.dae = {
    enable = true;
    config = let
      getSecret = builtins.extraBuiltins.getSecret;
    in ''
      global {
        wan_interface: auto

        log_level: info
        allow_insecure: false
        auto_config_kernel_parameter: true
      }

      subscription {
        "${getSecret "proxySubscriptions/catnet/link"}"
      }

      dns {
        upstream {
          googledns: "tcp+udp://dns.google:53"
          alidns: "udp://dns.alidns.com:53"
        }
        routing {
          request {
            qtype(https) -> reject
            fallback: alidns
          }
          response {
            upstream(googledns) -> accept
            ip(geoip:private) && !qname(geosite:cn) -> googledns
            fallback: accept
          }
        }
      }

      group {
        proxy {
          filter: name(keyword: "${vars.dae.nodeName}")
          policy: fixed(0)
        }
      }

      routing {
        pname(NetworkManager) -> direct
        dip(224.0.0.0/3, "ff00::/8") -> direct

        l4proto(udp) && dport(443) -> block
        dip(geoip:private) -> direct
        dip(geoip:cn) -> direct
        domain(geosite:cn) -> direct

        fallback: proxy
      }
    '';
  };
}
