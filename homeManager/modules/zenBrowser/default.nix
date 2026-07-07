{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      sine = {
        enable = true;
        # mods = [
        #   "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        #   "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
        #   "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
        #   "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
        #   "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        #   "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
        #   "c6813222-6571-4ba6-8faf-58f3343324f6" # Disable Rounded Corners
        #   "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
        #   "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # Hide Extension Name
        #   "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # Better Active Tab
        #   "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        #   "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
        #   "fd24f832-a2e6-4ce9-8b19-7aa888eb7f8e" # Quietify
        #   "642854b5-88b4-4c40-b256-e035532109df" # transparnet zen
        # ];
      };

      # extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      #   ublock-origin
      #   refined-github
      #   enhanced-github
      #   # foxyproxy-standard
      #   sponsorblock
      #   vimium
      #   # to-deepl
      #   bonjourr-startpage
      #   search-by-image
      #   zen-internet
      #   # foxytab
      #   # owasp-penetration-testing-kit
      # ];
      settings = {
        "sine.engine.auto-update" = false;
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
        "zen.view.experimental-no-window-controls" = "true";
      };
      # Custom userChrome.css for UI customization
      # Reference: https://mefmobile.org/how-to-customize-firefoxs-user-interface-with-userchrome-css/
      userChrome = import ./userChrome.nix { inherit colors; };
    };
  };
}
