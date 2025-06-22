{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "luke";
    configDir = "/home/luke/Sync";
    # relay.listenAddress = "0.0.0.0";
  };
}
