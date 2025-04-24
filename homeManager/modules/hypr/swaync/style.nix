# css
''
  /* Define Nord theme colors */
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

  /* Define additional colors based on the Nord theme */
  @define-color mpris-album-art-overlay alpha(@nord0, 0.55);
  @define-color mpris-button-hover alpha(@nord0, 0.50);
  @define-color text @nord5;
  @define-color bg alpha(@nord0,.9);
  @define-color bg-hover alpha(@nord0,.95);
  @define-color border-color alpha(@nord1, 0.3);

  * {
      outline:none;
  }

  /* Keyframes for fade-in animation for floating notifications */
  @keyframes fadeIn{
    0% {
      margin-top: 50;
      margin-left:50;
      margin-right:50;
    }
    100% {
      padding:0;
      margin-top: 10;
      margin-left:10;
    }
  }

  .control-center .notification-row {
      background-color: unset;
  }

  /* General styling for notification backgrounds and content */
  .control-center .notification-row .notification-background .notification,
  .control-center .notification-row .notification-background .notification .notification-content,
  .floating-notifications .notification-row .notification-background .notification,
  .floating-notifications.background .notification-background .notification .notification-content {
  }

  /* Basic notification styling */
  .notification{
      padding-right: 1;
      background: alpha(@nord0,.7);
      margin-top: 9;
      margin-right: 3;
  }

  /* Styling for notification backgrounds in the control center */
  .control-center .notification-row .notification-background .notification {
      margin-top: 0.150rem;
      box-shadow: 1px 1px 5px rgba(0, 0, 0, .3);
      background: alpha(@nord0,.9);

  }

  /* Apply fade-in animation to floating notifications */
  .floating-notifications .notification{
      animation: fadeIn .5s ease-in-out;
  }

  /* Styling for various elements within notifications (border-radius) */
  .control-center .notification-row .notification-background .notification box,
  .control-center .notification-row .notification-background .notification widget,
  .control-center .notification-row .notification-background .notification .notification-content,
  .floating-notifications .notification-row .notification-background .notification box,
  .floating-notifications .notification-row .notification-background .notification widget,
  .floating-notifications.background .notification-background .notification .notification-content {
      border-radius: 0.818rem;
  }

  /* Hover effect for notification widgets */
  .notification widget:hover{
      background:alpha(@nord0,.2);
  }

  /* Padding for notification content in floating and control center notifications */
  .floating-notifications.background .notification-background .notification .notification-content,
  .control-center .notification-background .notification .notification-content {
      padding-top: 0.818rem;
      padding-right: unset;
      margin-right: unset;
  }

  /* Padding for labels in low and normal priority notifications */
  .control-center .notification-row .notification-background .notification.low .notification-content label,
  .control-center .notification-row .notification-background .notification.normal .notification-content label,
  .floating-notifications.background .notification-background .notification.low .notification-content label,
  .floating-notifications.background .notification-background .notification.normal .notification-content label {
      padding-top:5px;
      padding-left:10px;
      padding-right:10px;
      padding-bottom:5px;
  }

  /* Styling for images within low and normal priority notifications */
  .control-center .notification-row .notification-background .notification..notification-content image,
  .control-center .notification-row .notification-background .notification.normal .notification-content image,
  .floating-notifications.background .notification-background .notification.low .notification-content image,
  .floating-notifications.background .notification-background .notification.normal .notification-content image {
      background-color: unset;
  }

  /* Styling for body text in low and normal priority notifications */
  .control-center .notification-row .notification-background .notification.low .notification-content .body,
  .control-center .notification-row .notification-background .notification.normal .notification-content .body,
  .floating-notifications.background .notification-background .notification.low .notification-content .body,
  .floating-notifications.background .notification-background .notification.normal .notification-content .body {
      color: @text;
  }

  /* Background color for critical priority notifications */
  .control-center .notification-row .notification-background .notification.critical .notification-content,
  .floating-notifications.background .notification-background .notification.critical .notification-content {
      background-color: #ffb4a9;

  }

  /* Styling for images within critical priority notifications */
  .control-center .notification-row .notification-background .notification.critical .notification-content image,
  .floating-notifications.background .notification-background .notification.critical .notification-content image{
      background-color: unset;
      color: @text;

  }

  /* Styling for labels within critical priority notifications */
  .control-center .notification-row .notification-background .notification.critical .notification-content label,
  .floating-notifications.background .notification-background .notification.critical .notification-content label {
      color: @text;
  }

  /* General padding for notification content */
  .notification-content{
      padding:5;
  }

  /* Styling for the notification summary (label) */
  .control-center .notification-row .notification-background .notification .notification-content .summary,
  .floating-notifications.background .notification-background .notification .notification-content .summary {
      font-family: 'CodeNewRoman Nerd Font Propo';
      font-size: 1.2rem;
      font-weight: 900;
      color: @nord8; 
  }

  /* Styling for the notification time */
  .control-center .notification-row .notification-background .notification .notification-content .time,
  .floating-notifications.background .notification-background .notification .notification-content .time {
      font-size: 0.8291rem;
      font-weight: 500;
      margin-right: 2rem;
      padding-right: unset;
  }

  /* Styling for the notification body text */
  .control-center .notification-row .notification-background .notification .notification-content .body,
  .floating-notifications.background .notification-background .notification .notification-content .body {
      font-family: 'CodeNewRoman Nerd Font Propo';
      font-size: 0.8891rem;
      font-weight: 400;
      margin-top: 0.310rem;
      padding-right: unset;
      margin-right: unset;
  }

  /* Styling for the close button */
  .control-center .notification-row .close-button,
  .floating-notifications.background .close-button {
      all:unset;
      background-color: unset;
      border-radius: 0%;
      border: none;
      box-shadow: none;
      margin-right: 5px;
      margin-top: 11px;
      margin-bottom: unset;
      padding-bottom: unset;
      min-height: 20px;
      min-width: 20px;
      text-shadow: none;
      color:@text;
  }

  /* Hover styling for the close button */
  .control-center .notification-row .close-button:hover,
  .floating-notifications.background .close-button:hover {
      all:unset;
      background-color: @nord3;
      border-radius: 100%;
      border: none;
      box-shadow: none;
      margin-right: 5px;
      margin-top: 11px;
      margin-bottom: unset;
      padding-bottom: unset;
      min-height: 20px;
      min-width: 20px;
      text-shadow: none;
      color:@text;

  }

  /* Styling for the control center window */
  .control-center {
      background: @bg;
      color: @text;
      border-radius: 10px;
      border:none;
      /*box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);*/
  }

  /* Styling for the title widget */
  .widget-title {
      padding:unset;
      margin:unset;
      color: @text;
      padding-left:20px;
      padding-top:20px;
  }

  /* Styling for the button within the title widget */
  .widget-title > button {
      padding:unset;
      margin:unset;
      font-size: initial;
      color: @text;
      text-shadow: none;
      background: alpha(@nord3, .8);
      border: none;
      box-shadow: none;
      border-radius: 12px;
      padding:0px 10px;
      margin-right:20px;
      margin-top:3px;
      transition: all .7s ease;
  }

  /* Hover styling for the button within the title widget */
  .widget-title > button:hover {
      border: none;
      background: @nord2;
      transition: all .7s ease;
      box-shadow: 0px 0px 5px rgba(0, 0, 0, .65);
  }

  /* Styling for generic label widgets */
  .widget-label {
      margin: 8px;
  }

  /* Styling for the label text within generic label widgets */
  .widget-label > label {
      font-size: 1.1rem;
  }

  /* Styling for the MPRIS widget */
  .widget-mpris {
  }

  /* Styling for the player section within the MPRIS widget */
  .widget-mpris .widget-mpris-player {
      padding: 16px;
      margin: 16px 20px;
      background-color: @mpris-album-art-overlay;
      border-radius: 12px;
      box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);
  }

  /* Hover styling for buttons within the MPRIS player */
  .widget-mpris .widget-mpris-player button:hover {
      all: unset;
      background: @nord2;
      text-shadow: none;
      border-radius: 15px;
      border: none;
      padding: 5px;
      margin: 5px;
      transition: all 0.5s ease;
  }

  /* Styling for buttons within the MPRIS player */
  .widget-mpris .widget-mpris-player button {
      color:@text;
      text-shadow: none;
      border-radius: 15px;
      border: none;
      padding: 5px;
      margin: 5px;
      transition: all 0.5s ease;
  }

  /* Styling for non-selected buttons within the MPRIS player */
  .widget-mpris .widget-mpris-player button:not(.selected) {
      /*background: transparent;*/
      border: 2px solid transparent;
  }

  /* Hover styling for buttons within the MPRIS player (border) */
  .widget-mpris .widget-mpris-player button:hover {
      border: 2px solid transparent;
  }

  /* Styling for the album art within the MPRIS player */
  .widget-mpris .widget-mpris-player .widget-mpris-album-art {
      border-radius: 20px;
      box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.75);
  }

  /* Styling for the title within the MPRIS player */
  .widget-mpris .widget-mpris-player .widget-mpris-title {
      font-weight: bold;
      font-size: 1.25rem;
  }

  /* Styling for the subtitle within the MPRIS player */
  .widget-mpris .widget-mpris-label {
      font-size: 1.1rem;
  }

  /* Hover styling for boxes containing buttons within the MPRIS player */
  .widget-mpris .widget-mpris-player > box > button:hover {
      background-color: @mpris-button-hover;
  }

  /* Styling for the buttons grid widget */
  .widget-buttons-grid {
      font-family:"CodeNewRoman Nerd Font Propo";
      padding-left: 8px;
      padding-right: 8px;
      padding-bottom: 8px;
      margin: 10px;
      border-radius: 12px;
      background:transparent;
  }

  /* Styling for the labels within the buttons grid buttons */
  .widget-buttons-grid>flowbox>flowboxchild>button label {
      font-size: 20px;
      color: @color7; 
      transition: all .7s ease;
  }

  /* Hover styling for the labels within the buttons grid buttons */
  .widget-buttons-grid>flowbox>flowboxchild>button:hover label {
      font-size: 20px;
      color: @text;
      transition: all .7s ease;
  }

  /* Styling for the buttons within the buttons grid */
  .widget-buttons-grid > flowbox > flowboxchild > button {
      background: @nord2;
      border-radius: 12px;
      text-shadow:none;
      box-shadow: 0px 0px 8px rgba(255,255,255, .02);
      transition: all .5s ease;
      border: none; 
  }

  /* Hover styling for the buttons within the buttons grid */
  .widget-buttons-grid > flowbox > flowboxchild > button:hover {
      background: @bg;
      box-shadow: 0px 0px 2px rgba(0, 0, 0, .2);
      transition: all .5s ease;
  }

  /* Styling for toggled buttons within the buttons grid */
  .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
      background: @bg;
  }

  /* Styling for labels of toggled buttons within the buttons grid */
  .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked label {
      color: @background; /* Using a defined color (ensure @background is defined if needed, otherwise use a theme color) */
  }

  /* Styling for buttons in the menubar */
  .widget-menubar > box > .menu-button-bar > button {
      border: none;
      background: transparent;
  }

  /* Styling for buttons in the topbar */
  .topbar-buttons > button {
      border: none;
      background: transparent;
  }

  /* Styling for troughs (used in volume/backlight sliders) */
  trough {
      border-radius: 20px;
      background: transparent;
  }

  /* Styling for the highlight within troughs */
  trough highlight {
      padding: 5px;
      background: @bg;
      border-radius: 20px;
      box-shadow: 0px 0px 5px rgba(0, 0, 0, .5);
      transition: all .7s ease;
  }

  /* Hover styling for the highlight within troughs */
  trough highlight:hover {
      padding: 5px;
      background: @bg;
      border-radius: 20px;
      box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
      transition: all .7s ease;
  }

  /* Styling for the slider within troughs */
  trough slider {
      background: transparent;
  }

  /* Hover styling for the slider within troughs */
  trough slider:hover {
      background: transparent;
  }

  /* Styling for the volume widget */
  .widget-volume {
      background-color: alpha(@nord1, 0.5);
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
  }

  /* Styling for the backlight widget */
  .widget-backlight {
      background-color: transparent;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
  }
''
