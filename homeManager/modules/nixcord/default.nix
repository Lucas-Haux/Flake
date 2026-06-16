{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    quickCss = # css
      ''
        /**
         * @name Discord Mica
         * @author Coolkie
         * @version 1.0
         * @description Discord with mica :)
         * @source https://github.com/PL7963/Discord-Mica/blob/main/src/main.css
         * @website http://github.com/PL7963/
         * @invite mh5Tzm43m9
         */

        @import url("https://discord-mica.pages.dev/src/main.css");

         :root {
          /*Dark mode*/
          --dark-bg: #1e283a5a; to achieve screenshot looking*/
          --dark-accent: rgb(76, 194, 255);
          --dark-accent-hovered: rgb(65, 163, 214); /*also disabled button*/
          --dark-accent-font-color: black;
          --dark-button: rgb(45,45,45);
          --dark-button-border: rgb(60, 60, 60);
          --dark-button-font-color: white;
          --dark-background-accent: rgba(50,50,50,0.9);

          /*Light mode*/
          --light-bg: transparent;
          --light-accent: rgb(0, 120, 212);
          --light-accent-hovered: rgb(0, 94, 167); /*also disabled button*/
          --light-accent-font-color: white;
          --light-button: rgb(251,251,251);
          --light-button-border: rgb(204, 204, 231);
          --light-button-font-color: black;
          --light-background-accent: rgba(160,160,160,0.9);
          }
      '';
    config = {
      themeLinks = [
        # "https://raw.githubusercontent.com/orblazer/discord-nordic/master/nordic.vencord.css"
      ];
      useQuickCss = false;

      transparent = true;
      frameless = true;
      plugins = {
        # alwaysAnimate.enable = false;
        alwaysTrust.enable = true;
        betterSettings = {
          enable = true;
          disableFade = true;
          organizeMenu = true;
          eagerLoad = true;
        };
        # biggerStreamPreview.enable = true;
        # # colorSighted.enable = true;
        # copyFileContents.enable = true;
        # ctrlEnterSend.enable = true;
        # decor.enable = false;
        fakeNitro = {
          enable = true;
          transformCompoundSentence = true;
        };
        # forceOwnerCrown.enable = true;
        # implicitRelationships.enable = true;
        # mentionAvatars.enable = true;
        # messageClickActions.enable = true;
        # messageLogger.enable = true;
        # reverseImageSearch.enable = true;
        # showHiddenChannels.enable = true;
        # showHiddenThings.enable = true;
        # userVoiceShow.enable = true;
        # voiceChatDoubleClick.enable = true;
        # viewRaw.enable = true;
        # # volumeBooster.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
