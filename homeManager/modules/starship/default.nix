{ lib, config, ... }:
let
  colors = config.lib.stylix.colors;

  hostnameFormat = lib.concatStrings [
    "[](fg:#${colors.base0A} bg:none)"
    "[ ](bold bg:#${colors.base0A} fg:#252525)"
    "[](fg:#${colors.base0A} bg:none)"
    " "
  ];
  nixShellFormat = lib.concatStrings [
    "[](fg:#${colors.base0E} bg:none)"
    "[󱄅 ](bold bg:#${colors.base0E} fg:#252525)"
    "[](fg:#${colors.base0E} bg:none)"
    " "
  ];
  directoryFormat = lib.concatStrings [
    "[](fg:#${colors.base03} bg:none)"
    "[$path]($style)"
    "[█](fg:#${colors.base03} bg:#${colors.base03})"
    "[](fg:#${colors.base0C} bg:#${colors.base03})"
    "[󰉖 ](bold fg:#252525 bg:#${colors.base0C})"
    "[](fg:#${colors.base0C} bg:none)"
  ];
  packageFormat = lib.concatStrings [
    " "
    "[](fg:#${colors.base03} bg:none)"
    "[$version](bg:#${colors.base03})"
    "[█](fg:#${colors.base03} bg:#${colors.base03})"
    "[](fg:#${colors.base09} bg:#${colors.base03})"
    "[ ](fg:#252525 bg:#${colors.base09})"
    "[](fg:#${colors.base09} bg:none)"
  ];
  gitBranchFormat = lib.concatStrings [
    "[](fg:#${colors.base0D} bg:#${colors.base03})"
    "[$branch](fg:#252525 bg:#${colors.base0D})"
    "[](fg:#${colors.base0D} bg:none)"
  ];
  gitStatusFormat = lib.concatStrings [
    "[](fg:#${colors.base03} bg:none)"
    "[$modified]($style)"
    "[$untracked]($style)"
    "[$staged]($style)"
    "[$deleted]($style)"
    "[$ahead_behind]($style)"
    "[$conflicted](fg:#${colors.base08}bg:#${colors.base03})"
    "[$stashed]($style)"
  ];
  cmdDurationFormat = lib.concatStrings [
    " "
    "[](fg:#${colors.base03} bg:none)"
    "[$duration](bold bg:#${colors.base03})"
    "[](fg:#${colors.base03} bg:none)"
  ];
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$hostname"
        "$nix_shell"
        "$directory"
        "$package"
        "$fill"
        "$git_status$git_branch"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      hostname = {
        ssh_only = true;
        format = hostnameFormat;
        disabled = false;
      };

      nix_shell = {
        format = nixShellFormat;
        disabled = false;
        heuristic = false;
      };

      directory = {
        format = directoryFormat;
        style = "fg:#E8E3E3 bg:#${colors.base03} bold";
        truncation_length = 4;
        truncate_to_repo = false;
        read_only = "󱧸 ";
        truncation_symbol = " /";
        home_symbol = "~";
      };

      package = {
        format = packageFormat;
        version_format = "\${raw}";
        disabled = false;
      };

      git_branch = {
        format = gitBranchFormat;
        style = "fg:#E8E3E3 bg:#${colors.base03}";
      };

      git_status = {
        format = gitStatusFormat;
        style = "fg:#E8E3E3 bg:#${colors.base03}";
        conflicted = " ";
        ahead = "󱓊 \${count} ";
        behind = "󱓋 \${count} ";
        diverged = "󱓌 ";
        up_to_date = "󱓏 ";
        untracked = " \${count} ";
        stashed = "  ";
        modified = "󰜚\${count} ";
        staged = " \${count} ";
        renamed = "";
        deleted = " \${count} ";
      };

      cmd_duration = {
        format = cmdDurationFormat;
        style = "bright-blue";
      };

      fill = {
        symbol = " ";
        style = "";
      };

      character = {
        success_symbol = "[ ](#${colors.base07} bold)";
        error_symbol = "[ ](#${colors.base08} bold)";
        vimcmd_symbol = "[ ](#${colors.base09} bold)";
        vimcmd_replace_one_symbol = "[ ](#${colors.base09} bold)";
        vimcmd_replace_symbol = "[ ](#${colors.base09} bold)";
        vimcmd_visual_symbol = "[󰴲 ](#${colors.base0A} bold)";
      };
    };
  };
}
