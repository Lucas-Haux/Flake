{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "luke";
    configDir = "/home/luke/.config/syncthing";
    # relay.listenAddress = "0.0.0.0";
  };
}
