{
  wayland.windowManager.hyprland.settings = {
    bindin = [
      # Launcher
      "SUPER, mouse:272, global, caelestia:launcherInterrupt"
      "SUPER, mouse:273, global, caelestia:launcherInterrupt"
      "SUPER, mouse:274, global, caelestia:launcherInterrupt"
      "SUPER, mouse:275, global, caelestia:launcherInterrupt"
      "SUPER, mouse:276, global, caelestia:launcherInterrupt"
      "SUPER, mouse:277, global, caelestia:launcherInterrupt"
      "SUPER, mouse_up, global, caelestia:launcherInterrupt"
      "SUPER, mouse_down, global, caelestia:launcherInterrupt"
    ];
    bind = [
      # Launcher
      "SUPER, R, global, caelestia:launcher"
      "SUPER, X, global, caelestia:session" # Powermenu

      # Misc
      "SUPER, L, global, caelestia:lock"
      "SUPER, N, exec, caelestia shell drawers toggle sidebar"

      # Utilities
      "SUPER+Shift, SPACE, exec, caelestia shell gameMode toggle" # Toggle Focus/Game mode
      "SUPER+Shift, S, global, caelestia:screenshotFreeze" # Capture region (freeze)
      "SUPER+Shift+Alt, S, global, caelestia:screenshot" # Capture region
      "SUPER+Alt, R, exec, caelestia record -s" # Record screen with sound
      "Ctrl+Alt, R, exec, caelestia record" # Record screen
      "SUPER+Shift+Alt, R, exec, caelestia record -r" # Record region

      "SUPER+Shift, E, exec, pkill fuzzel || caelestia emoji -p"
    ];
    bindl = [
      # Brightness
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
      "SUPER, F2, exec, nightshift-toggle"
      "SUPER, F3, exec, nightshift-toggle"

      # Media
      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      ", XF86AudioNext, global, caelestia:mediaNext"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
      ", XF86AudioStop, global, caelestia:mediaStop"

      # Sound
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Utilities
      ", Print, exec, caelestia screenshot" # Full screen capture > clipboard
      "SUPER, W, exec, pkill fuzzel || caelestia clipboard" # Full screen capture > clipboard

    ];
    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];
  };
}
