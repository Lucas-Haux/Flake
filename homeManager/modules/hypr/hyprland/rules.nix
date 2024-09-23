{
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland.extraConfig = ''
    # Bind k = keepass special
    windowrulev2 = tile,class:(keepassxc)
    windowrulev2 = workspace special:keepassxc,class:(keepassxc)

    # Bind D = Discord special
    windowrulev2 = tile,class:(vesktop)
    windowrulev2 = workspace special:vesktop,class:(vesktop)

    # Bind O = Obsidian special
    windowrulev2 = tile,class:(obsidian)
    windowrulev2 = workspace special:obsidian,class:(obsidian)

    # Bind T = Telegram spcial
    windowrulev2 = tile,class:(telegram-desktop)
    windowrulev2 = workspace special:telegram-desktop,class:(telegram)
  '';
}
