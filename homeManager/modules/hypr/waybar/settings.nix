{ config }:
{
  mainBar = {
    layer = "top";
    position = "top";
    output = "!0000000";
    modules-left = [
      "memory"
      "custom/separator"
      "cpu"
      "custom/separator"
      "temperature"
    ];
    modules-center = [
      "hyprland/workspaces"
      "custom/separator"
      "clock#time"
      "custom/separator"
      "clock#date"
    ];
    modules-right = [
      "pulseaudio"
      "custom/waybarmpris"
      "custom/separator"
      "network"
      "custom/separator"
      "custom/notification"
      "custom/privacy"
      "custom/separator"
      "tray"
    ];

    "custom/separator" = {
      format = "|";
      interval = "once";
      tooltip = false;
    };

    # Left
    "memory" = {
      format = "{used}G  ";
      interval = 3;
    };
    "cpu" = {
      interval = 3;
      format = "{usage:02}% ";
    };
    "temperature" = {
      thermal-zone = 0;
      format = "{temperatureC}°C ";
      format-critical = "{temperatureC}°C 󰈸";
      critical-threshold = 80;
      interval = 3;
    };

    # Center
    "hyprland/workspaces" = {
      all-outputs = false;
      format = "{id}";
      format-icons = {
        # "1" = "";
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "DP-1" = [
          1
          4
          7
        ];
        "DP-2" = [
          2
          5
          8
        ];
        "HDMI-A-1" = [
          3
          6
          9
        ];
      };
    };
    "clock#time" = {
      tooltip = false;
      format = "  {:%I:%M}";
    };
    "clock#date" = {
      tooltip = true;
      format = "  {:%a %d}";
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "year";
        mode-mon-col = 3;
        weeks-pos = "right";
        on-scroll = 1;
        format = {
          months = "<span color='#${config.colorscheme.colors.base0F}'><b>{}</b></span>";
          days = "<span color='#${config.colorscheme.colors.base0D}'><b>{}</b></span>";
          weeks = "<span color='#${config.colorscheme.colors.base0E}'><b>W{}</b></span>";
          weekdays = "<span color='#${config.colorscheme.colors.base0C}'><b>{}</b></span>";
          today = "<span color='#66FF00'><b><u>{}</u></b></span>";
        };
      };
      actions = {
        on-click-right = "mode";
        on-click-forward = "tz_up";
        on-click-backward = "tz_down";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };

    #Right
    "pulseaudio" = {
      format = "{icon}  {volume}%";
      format-bluetooth = "{volume}% {icon}";
      format-muted = "";
      format-icons = {
        default = [
          " "
          " "
        ];
      };
      scroll-step = 1;
      on-click = "pavucontrol";
      ignored-sinks = [ "Easy Effects Sink" ];
    };
    "custom/waybarmpris" = {
      return-type = "json";
      format = " {}";
      exec = "waybar-mpris --order SYMBOL --separator \" \" --play  --pause \"\" --autofocus";
      on-click = "waybar-mpris --send toggle";
      on-click-right = "waybar-mpris --send player-next";
      escape = true;
    };
    "network" = {
      format-wifi = " ";
      format-ethernet = "󰈀";
      format-disconnected = " ";
      tooltip-format-disconnected = "Error";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname} 󰈀 \n {bandwidthUpBits:04}   {bandwidthDownBits}  ";
      on-click = "nm-applet";
      interval = 3;
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon}";
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      escape = true;
      format-icons = {
        none = "󰂚";
        inhibited-none = "󰂚";
        notification = "󱅫";
        inhibited-notification = "󱅫";
        dnd-none = "󰂛";
        dnd-inhibited-none = "󰂛";
        dnd-notification = "󰂛";
        dnd-inhibited-notification = "󰂛";
      };
    };
  };
}
