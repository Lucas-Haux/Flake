{
  programs.yazi.settings.keymaps.mgr.prepend_keymap = [
    {
      on = [ "F" ];
      run = "plugin smart-filter";
    }
    {
      on = "M";
      run = "plugin mount";
    }
    {
      on = [
        "c"
        "m"
      ];
      run = "plugin chmod";
      desc = "Chmod on selected files";
    }

    # Number Motions
    {
      on = [ "1" ];
      run = "plugin relative-motions 1";
      desc = "Move in relative steps";
    }
    {
      on = [ "2" ];
      run = "plugin relative-motions 2";
      desc = "Move in relative steps";
    }
    {
      on = [ "3" ];
      run = "plugin relative-motions 3";
      desc = "Move in relative steps";
    }
    {
      on = [ "4" ];
      run = "plugin relative-motions 4";
      desc = "Move in relative steps";
    }
    {
      on = [ "5" ];
      run = "plugin relative-motions 5";
      desc = "Move in relative steps";
    }
    {
      on = [ "6" ];
      run = "plugin relative-motions 6";
      desc = "Move in relative steps";
    }
    {
      on = [ "7" ];
      run = "plugin relative-motions 7";
      desc = "Move in relative steps";
    }
    {
      on = [ "8" ];
      run = "plugin relative-motions 8";
      desc = "Move in relative steps";
    }
    {
      on = [ "9" ];
      run = "plugin relative-motions 9";
      desc = "Move in relative steps";
    }
  ];
}
