{ config, pkgs, ... }: {
  # grafana configuration
  services.grafana = {
    enable = true;
    # domain = "grafana.pele";
    # port = 2342;
    addr = "10.0.0.178";
  };

    services.prometheus = {
    enable = true;
        exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
        port = 9002;
      };
    };
    scrapeConfigs = [
      {
        job_name = "chrysalis";
        static_configs = [{
          targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" ];
        }];
      }
    ];

    port = 9001;
  };



}

