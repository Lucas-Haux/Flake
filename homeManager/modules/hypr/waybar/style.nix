# css
''
  @define-color nord0 #2E3440;
  @define-color nord1 #3B4252;
  @define-color nord2 #434C5E;
  @define-color nord3 #4C566A;
  @define-color nord4 #D8DEE9;
  @define-color nord5 #E5E9F0;
  @define-color nord6 #ECEFF4;
  @define-color nord7 #8FBCBB;
  @define-color nord8 #88C0D0;
  @define-color nord9 #81A1C1;
  @define-color nord10 #5E81AC;
  @define-color nord11 #BF616A;
  @define-color nord12 #D08770;
  @define-color nord13 #EBCB8B;
  @define-color nord14 #A3BE8C;
  @define-color nord15 #B48EAD;

  @define-color bg alpha(@nord0,.825);
  @define-color text @nord5;
  @define-color text-dark @nord4;
  @define-color modleft @nord9;
  @define-color modcent @nord10;
  @define-color modrght @nord9;

  * {
      font-size:13px;
      font-family: "JetBrains Nerd Font";
  }
  window#waybar{
     margin: 5px;
     background: transparent;
  }
  tooltip {
      background:@bg;
      color: @text;
  }
  .modules-left {
      padding:2px;
      border-radius: 15 15 15 15;
      margin-top: 8px;
      margin-left: 10px;
      background:@bg;
      border-style: solid;
      border-width: 2px;
      border-color: @nord9
  }
  .modules-center {
      padding:2px;
      border-radius: 15 15 15 15;
      margin-top:  8px;
      background:@bg;
      border-style: solid;
      border-width: 2px;
      border-color: @nord10
  }
  .modules-right {
      padding:2px;
      border-radius: 15 15 15 15;
      margin-top: 8px;
      margin-right: 10px;
      background: @bg;
      border-style: solid;
      border-width: 2px;
      border-color: @nord9
  }

  #custom-separator {
      color: alpha(@text-dark, .6);
      margin: 0 5px;
  }

  #custom-weather {
      color: @modcent
  }

  #custom-waybarmpris, #pulseaudio{
      padding: 0px 0px;
      transition: all .3s ease; 
      color: @modrght;
  }

  #pulseaudio{
      padding: 0px 5px;
      color:@modrght;
  }

  #clock:hover, #disk:hover, #custom-waybarmpris:hover, #pulseaudio:hover, #custom-weather:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
      transition: all .3s ease;
  }
  #custom-notification {
      padding: 0px 5px;
      transition: all .3s ease;
      color:@modrght;
  }
  #clock{
      padding: 0px 5px;
      color:@modcent;
      transition: all .3s ease;
  }
  #workspaces {
      padding: 0px 2px;
  }
  #workspaces button {
      all:unset;
      padding: 0px 5px;
      color: alpha(@nord9,.5);
      transition: all .2s ease;
  }
  #workspaces button:hover {
      color:@nord9;
      border: none;
      transition: all 1s ease;
  }
  #workspaces button.active {
      color: @nord10;
      border: none;
      text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
  }
  #workspaces button.empty {
      color: @nord2;
      border: none;
      text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
  }
  #workspaces button.empty:hover {
      color: alpha(@nord1,.75);
      border: none;
      text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
      transition: all 1s ease;
  }
  #workspaces button.empty.active {
      color: @nord3;
      border: none;
      text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
  }
  #bluetooth{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@modrght;
  }
  #network{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@modrght;
  }

  #battery{
      padding: 0px 5px;
      transition: all .3s ease;
      color:@modleft;
  }

  #battery.charging {
      color: @nord14;
  }

  #battery.warning:not(.charging) {
      color: @nord13;
  }

  #battery.critical:not(.charging) {
      color: @nord11;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
  }
  #group-expand{
      padding: 0px 5px;
      transition: all .3s ease; 
  }
  #custom-expand{
      padding: 0px 5px;
      color:alpha(@text,.2);
      text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
      transition: all .3s ease; 
  }
  #custom-expand:hover{
      color:rgba(255,255,255,.2);
      text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
  }
  #custom-colorpicker{
      padding: 0px 5px;
  }
  #disk,#cpu,#memory,#temperature{
      padding: 0px 5px;
      transition: all .3s ease; 
  }

  #disk{
      color:@modleft;
  }

  #memory{
      color:@modleft;
  }

  #cpu{
      color:@modleft;
  }

  #temperature{
      color:@modleft;
  }

  #temperature.critical{
      color:@nord11;
  }

  #custom-endpoint{
      color:transparent;
      text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

  }
  #tray{
      padding: 0px 5px;
      transition: all .3s ease; 

  }
  #tray menu * {
      padding: 0px 5px;
      transition: all .3s ease; 
  }

  #tray menu separator {
      padding: 0px 5px;
      transition: all .3s ease; 
  }
''
