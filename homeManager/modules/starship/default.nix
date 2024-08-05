{
  pkgs,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$hostname$directory$localip$shlvl$singularity$kubernetes$vcsh$hg_branch$docker_context$package$custom$sudo$fill$git_branch$git_status$git_commit$cmd_duration$jobs$shell$line_break$character";

      hostname = {
        ssh_only = true;
        format = "[](fg:#${config.colorScheme.colors.base03} bg:none)[$ssh_symbol](bold bg:#${config.colorScheme.colors.base03})[](fg:#${config.colorScheme.colors.base03} bg:none) ";
        disabled = false;
        ssh_symbol = "󰒋 ";
      };

      package = {
        format = " [](fg:#${config.colorScheme.colors.base03} bg:none)[$version](bg:#${config.colorScheme.colors.base03})[█](fg:#${config.colorScheme.colors.base03} bg:#${config.colorScheme.colors.base03})[](fg:#${config.colorScheme.colors.base09} bg:#${config.colorScheme.colors.base03})[  ](fg:#252525 bg:#${config.colorScheme.colors.base09})[](fg:#${config.colorScheme.colors.base09} bg:none)";

        disabled = false;
      };

      git_branch = {
        format = "[](fg:#${config.colorScheme.colors.base03} bg:none)[$branch]($style)[](fg:#${config.colorScheme.colors.base03} bg:#${config.colorScheme.colors.base03})[](fg:#${config.colorScheme.colors.base0B} bg:#${config.colorScheme.colors.base03})[  ](fg:#252525 bg:#${config.colorScheme.colors.base0B})[](fg:#${config.colorScheme.colors.base0B} bg:none) ";
        style = "fg:#E8E3E3 bg:#${config.colorScheme.colors.base03}";
        symbol = " ";
      };

      git_commit = {
        format = "[\\($hash\\)]($style) [\\($tag\\)]($style)";
        style = "green";
      };

      git_state = {
        rebase = "REBASING";
        merge = "MERGING";
        revert = "REVERTING";
        cherry_pick = "CHERRY-PICKING";
        bisect = "BISECTING";
        am = "AM";
        am_or_rebase = "M/REBASE";
        style = "yellow";
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
      };

      git_status = {
        format = "[](fg:#${config.colorScheme.colors.base03} bg:none)[$all_status$ahead_behind]($style)[](fg:#${config.colorScheme.colors.base03} bg:#${config.colorScheme.colors.base03})[](fg:#${config.colorScheme.colors.base0C} bg:#${config.colorScheme.colors.base03})[  ](fg:#${config.colorScheme.colors.base03} bg:#${config.colorScheme.colors.base0C})[](fg:#${config.colorScheme.colors.base0C} bg:none) ";
        style = "fg:#E8E3E3 bg:#${config.colorScheme.colors.base03}";
        conflicted = "=";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        up_to_date = " 󰄸 ";
        untracked = "?\${count}";
        stashed = "";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = " \${count}";
      };

      directory = {
        format = "[](fg:#${config.colorScheme.colors.base03} bg:none)[$path]($style)[█](fg:#${config.colorScheme.colors.base03} bg:#${config.colorScheme.colors.base03})[](fg:#${config.colorScheme.colors.base0C} bg:#${config.colorScheme.colors.base03})[  ](fg:#252525 bg:#${config.colorScheme.colors.base0C})[](fg:#${config.colorScheme.colors.base0C} bg:none)";
        style = "fg:#E8E3E3 bg:#${config.colorScheme.colors.base03} bold";
        truncation_length = 3;
        truncate_to_repo = false;
        read_only = " 󱧸 ";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "bright-blue";
      };

      jobs = {
        style = "bright-green bold";
      };

      fill = {
        symbol = " ";
        style = "bold green";
      };

      character = {
        success_symbol = "[ ](#${config.colorScheme.colors.base0C} bold)";
        error_symbol = "[ ](#B66467 bold)";
      };

    };
  };
}
