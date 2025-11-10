let
  barModuleBorder = "#5e81ac";
  barModuleBackground = "#3b4252";

  primary = "#5e81ac";
  content = "#81a1c1";
  active = "#88C0D0";
  error = "#bf616a";

  menuBorder = "#3b4252";
  menuBackground = "#3b4252";

  darkBackground = "#2e3440";
in
{
  font = {
    name = "Symbols Nerd Font Mono";
  };

  bar = {
    floating = true;
    transparent = true;
    margin_sides = "0.2em";
    margin_bottom = "0em";
    outer_spacing = "0em";
    border.color = barModuleBorder;
    buttons = {
      style = "default";
      enableBorders = true;
      borderSize = "0.12em";
      background_opacity = 90;
      background_hover_opacity = 100;
      spacing = "0.4em";
      radius = "0.95em";
      y_margins = "0em";
      background = barModuleBackground;
      bluetooth = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      borderColor = barModuleBorder;
      clock = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      dashboard = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
      };
      hover = "#434c53";
      icon = content;
      media = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      modules = {
        cava = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        cpu = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        cpuTemp = {
          border = barModuleBorder;
          background = barModuleBackground;
          icon = content;
          text = content;
        };
        hypridle = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        hyprsunset = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        kbLayout = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        microphone = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        netstat = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        power = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
        };
        ram = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        storage = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        submap = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        updates = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        weather = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
        worldclock = {
          background = barModuleBackground;
          border = barModuleBorder;
          icon = content;
          text = content;
        };
      };
      network = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      notifications = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
      };
      systray = {
        background = barModuleBackground;
        border = barModuleBorder;
        customIcon = content;
      };
      text = content;
      volume = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      windowtitle = {
        background = barModuleBackground;
        border = barModuleBorder;
        icon = content;
        text = content;
      };
      workspaces = {
        numbered_active_highlight_padding = "0.8em";
        numbered_active_highlight_border = "0.5em";
        active = barModuleBorder;
        available = content;
        occupied = content;
        background = barModuleBackground;
        border = barModuleBorder;
        hover = "#434c53";
        numbered_active_highlighted_text_color = active;
        # numbered_active_underline_color = "#ffffff";
      };
    };
    menus = {
      background = menuBackground;
      border.color = menuBackground;
      buttons = {
        active = active;
        default = menuBackground;
        disabled = darkBackground;
        text = "#2e3440";
      };
      cards = menuBackground;
      check_radio_button.active = active;
      check_radio_button.background = darkBackground;
      dimtext = darkBackground;
      dropdownmenu = {
        background = menuBackground;
        divider = barModuleBorder;
        text = content;
      };
      feinttext = "#434c53";
      iconbuttons = {
        active = active;
        passive = "#d8dee9";
      };
      icons = {
        active = active;
        passive = "#434c53";
      };
      label = content;
      listitems = {
        active = active;
        passive = "#d8dee9";
      };
      menu = {
        bluetooth = {
          background.color = darkBackground;
          border.color = menuBorder;
          card.color = menuBackground;
          iconbutton = {
            active = active;
            passive = primary;
          };
          icons = {
            active = active;
            passive = "#434c5e";
          };
          label.color = content;
          listitems = {
            active = primary;
            passive = "#d8dee9";
          };
          scroller.color = content;
          status = "#4c566a";
          switch = {
            disabled = darkBackground;
            enabled = content;
            puck = active;
          };
          switch_divider = "#4c566a";
          text = "#d8dee9";
        };
        clock = {
          background.color = darkBackground;
          border.color = menuBorder;
          calendar = {
            contextdays = "#434c53";
            currentday = active;
            days = "#d8dee9";
            paginator = content;
            weekdays = content;
            yearmonth = primary;
          };
          card.color = menuBackground;
          text = "#d8dee9";
          time = {
            time = content;
            timeperiod = primary;
          };
        };
        dashboard = {
          background.color = darkBackground;
          border.color = menuBorder;
          card.color = menuBackground;
          controls = {
            bluetooth = {
              background = primary;
              text = "#2e3440";
            };
            disabled = darkBackground;
            input = {
              background = primary;
              text = "#2e3440";
            };
            notifications = {
              background = primary;
              text = "#2e3440";
            };
            volume = {
              background = primary;
              text = "#2e3440";
            };
            wifi = {
              background = primary;
              text = "#2e3440";
            };
          };
          directories = {
            left = {
              bottom.color = content;
              middle.color = content;
              top.color = content;
            };
            right = {
              bottom.color = content;
              middle.color = content;
              top.color = content;
            };
          };
          monitors = {
            bar_background = "#434c53";
            cpu = {
              bar = "#b48ead";
              icon = "#b48ead";
              label = "#b48ead";
            };
            ram = {
              bar = "#a3be8c";
              icon = "#a3be8c";
              label = "#a3be8c";
            };
            disk = {
              bar = "#b48ead";
              icon = "#b48ead";
              label = "#b48ead";
            };
          };
          powermenu = {
            confirmation = {
              background = darkBackground;
              body = "#d8dee9";
              border = menuBorder;
              button_text = darkBackground;
              card = "#3b4252";
              confirm = active;
              deny = error;
              label = content;
            };
            logout = "#ebcb8b";
            restart = "#d08770";
            shutdown = error;
            sleep = "#b48ead";
          };
          profile.name = content;
          shortcuts = {
            background = content;
            recording = active;
            text = "#2e3440";
          };
        };
        media = {
          album = content;
          artist = content;
          background.color = darkBackground;
          border.color = menuBorder;
          buttons = {
            background = content;
            enabled = active;
            inactive = darkBackground;
            text = "#2e3440";
          };
          card.color = menuBackground;
          slider = {
            background = darkBackground;
            backgroundhover = "#4c566a";
            primary = primary;
            puck = active;
          };
          song = primary;
          timestamp = "#d8dee9";
        };
        network = {
          background.color = darkBackground;
          border.color = menuBorder;
          card.color = menuBackground;
          iconbuttons = {
            active = active;
            passive = "#d8dee9";
          };
          icons = {
            active = active;
            passive = primary;
          };
          label.color = content;
          listitems = {
            active = active;
            passive = "#d8dee9";
          };
          scroller.color = content;
          status.color = "#4c566a";
          switch = {
            disabled = darkBackground;
            enabled = content;
            puck = active;
          };
          text = "#d8dee9";
        };
        notifications = {
          scaling = 99;
          background = darkBackground;
          border = menuBorder;
          card = menuBackground;
          clear = error;
          label = content;
          no_notifications_label = menuBackground;
          pager = {
            background = darkBackground;
            button = content;
            label = primary;
          };
          scrollbar.color = "#b48ead";
          switch = {
            disabled = darkBackground;
            enabled = content;
            puck = active;
          };
          switch_divider = "#434c53";
        };
        power = {
          background.color = darkBackground;
          border.color = menuBorder;
          buttons = {
            logout = {
              background = menuBackground;
              icon = "#2e3440";
              text = content;
            };
            restart = {
              background = menuBackground;
              icon = "#2e3440";
              text = content;
            };
            shutdown = {
              background = menuBackground;
              icon = "#2e3440";
              text = content;
            };
            sleep = {
              background = menuBackground;
              icon = "#2e3440";
              text = content;
            };
          };
        };
        systray = {
          dropdownmenu = {
            background = darkBackground;
            divider = menuBackground;
            text = content;
          };
        };
        volume = {
          audio_slider = {
            background = darkBackground;
            backgroundhover = "#4c566a";
            primary = content;
            puck = active;
          };
          background.color = darkBackground;
          border.color = menuBackground;
          card.color = menuBackground;
          iconbutton = {
            active = active;
            passive = "#d8dee9";
          };
          icons = {
            active = active;
            passive = "#4c566a";
          };
          input_slider = {
            background = darkBackground;
            backgroundhover = "#434c53";
            primary = content;
            puck = active;
          };
          label.color = content;
          listitems = {
            active = active;
            passive = "#d8dee9";
          };
          text = "#d8dee9";
        };
      };
      popover = {
        background = menuBackground;
        border = darkBackground;
        text = content;
      };
      progressbar = {
        background = menuBackground;
        foreground = darkBackground;
      };
      slider = {
        background = darkBackground;
        backgroundhover = "#4c566a";
        primary = primary;
        puck = active;
      };
      switch = {
        disabled = darkBackground;
        enabled = content;
        puck = active;
      };
      text = "#d8dee9";
      tooltip = {
        background = darkBackground;
        text = "#d8dee9";
      };
    };
  };
  notification = {
    actions = {
      background = menuBackground;
      text = content;
    };
    background = menuBackground;
    border = darkBackground;
    close_button = {
      background = error;
      label = darkBackground;
    };
    label = content;
    labelicon = content;
    text = "#d8dee9";
    time = "#4c566a";
  };
  osd = {
    boarder.color = content;
    bar_color = content;
    bar_container = barModuleBackground;
    bar_empty_color = darkBackground;
    bar_overflow_color = error;
    icon_container = barModuleBorder;
    icon = active;
    label = active;
  };
}
