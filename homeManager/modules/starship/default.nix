{ pkgs, ...}:
{ 
    programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    enableZshIntegration = true;
    settings = {
        add_newline = false;
    format = "$hostname$directory$localip$shlvl$singularity$kubernetes$vcsh$hg_branch$docker_context$package$custom$sudo$fill$git_branch$git_status$git_commit$cmd_duration$jobs$shell$line_break$character";

    hostname = {
      ssh_only = true;
      format = "[](fg:#252525 bg:none)[█](fg:#E8E3E3 bg:#252525)[$ssh_symbol$hostname](bold bg:#E8E3E3)[](fg:#E8E3E3 bg:none) ";
      disabled = false;
    };
    git_branch = {
      format = "[](fg:#252526 bg:none)[$branch]($style)[](fg:#252525 bg:#252525)[](fg:#81C19B bg:#252525)[](fg:#252525 bg:#81C19B)[](fg:#81C19B bg:none) ";
      style = "fg:#E8E3E3 bg:#252525";
      symbol = " ";
    };
    git_commit = {
format = "[\\($hash\\)]($style) [\\($tag\\)]($style)";
style = "green";
    };
    git_state = {
rebase = "REBASING";
merge =	"MERGING";
revert = "REVERTING";
cherry_pick = "CHERRY-PICKING";
bisect = "BISECTING";
am = "AM";
am_or_rebase = "M/REBASE";
style =	"yellow";
format = "\([$state( $progress_current/$progress_total)]($style)\) ";
    };
    git_status = {
      format="[](fg:#252525 bg:none)[$all_status$ahead_behind]($style)[](fg:#252525 bg:#252525)[](fg:#6791C9 bg:#252525)[ ](fg:#252525 bg:#6791C9)[](fg:#6791C9 bg:none) ";
      style = "fg:#E8E3E3 bg:#252525";
      conflicted = "=";
      ahead =	"⇡\${count}";
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
      format = "[](fg:#252525 bg:none)[$path]($style)[█](fg:#232526 bg:#232526)[](fg:#6791C9 bg:#252525)[ ](fg:#252525 bg:#6791C9)[](fg:#6791C9 bg:none)";
      style = "fg:#E8E3E3 bg:#252525 bold";
      truncation_length = 3;
      truncate_to_repo=false;
      read_only = " ";
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
      success_symbol = "[ ](#6791C9 bold)";
      error_symbol = "[ ](#B66467 bold)";
    };
          };
  };
}
