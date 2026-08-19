{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "developer@lucas-haux.com";
        name = "Lucas-Haux";
      };
      init.defaultBranch = "main";
    };
  };
}
