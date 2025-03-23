{ ... }:
{
  wayland.windowManager.hyprland.extraConfig = # hyprlang
    ''
      # Bind k = keepass special
      windowrulev2 = tile,class:(keepassxc)
      windowrulev2 = workspace special:keepassxc silent,class:(keepassxc)

      # Bind D = Discord special
      windowrulev2 = tile,class:(vesktop)
      windowrulev2 = workspace special:vesktop silent,class:(vesktop)
      windowrulev2 = opacity 0.8 0.8, class:(vesktop)


      # Bind O = Obsidian special
      windowrulev2 = tile,class:(obsidian)
      windowrulev2 = workspace special:obsidian silent,class:(obsidian)
      windowrulev2 = opacity 0.8 0.8, class:(obsidian)


      # Bind T = Android Message Special
      windowrulev2 = tile,class:(android-messages)
      windowrulev2 = workspace special:android-messages silent,class:(android-messages)
      windowrulev2 = opacity 0.8 0.8, class:(android-messages)


      # Bind S = Spotify Special
      windowrulev2 = tile,class:(spotify)
      windowrulev2 = workspace special:spotify silent,class:(spotify)
      windowrulev2 = opacity 0.7 0.7, class:(spotify)
    '';
}
