{ lib, config, ... }:
{
  wayland.windowManager.hyprland.extraConfig = # hyprlang
    ''
      # Bind k = keepass special
      windowrulev2 = tile,class:(keepassxc)
      windowrulev2 = workspace special:keepassxc silent,class:(keepassxc)

      # Bind D = Discord special
      windowrulev2 = tile,class:(vesktop)
      windowrulev2 = workspace special:vesktop silent,class:(vesktop)
      windowrulev2 = opacity 1 1, class:(vesktop)

      # Bind O = Obsidian special
      windowrulev2 = tile,class:(obsidian)
      windowrulev2 = workspace special:obsidian silent,class:(obsidian)
      windowrulev2 = opacity 0.8 0.8, class:(obsidian)

      # Bind T = Android Message Special
      windowrulev2 = tile,class:(android-messages-desktop)
      windowrulev2 = workspace special:android-messages-desktop silent,class:(android-messages-desktop)
      windowrulev2 = opacity 0.8 0.8, class:(android-messages-desktop)

      # Bind S = Spotify Special
      windowrulev2 = tile,class:(spotify)
      windowrulev2 = workspace special:spotify silent,class:(spotify)
      windowrulev2 = opacity 0.75 0.75, class:(spotify)

      # Bind A = clipse
      windowrulev2 = float, class:(com.clipse.clipse)
      windowrulev2 = size 622 652, class:(com.clipse.clipse)
      windowrulev2 = stayfocused, class:(com.clipse.clipse)
      windowrulev2 = bordercolor rgba(${lib.removePrefix "#" config.colorscheme.colors.base0E}cc), class:(com.clipse.clipse) 

      windowrulev2 = float, title:^(Picture-in-Picture)$
      windowrulev2 = pin, title:^(Picture-in-Picture)$ 
      windowrulev2 = keepaspectratio, title:^(Picture-in-Picture)$
    '';
}
