{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/orblazer/discord-nordic/master/nordic.vencord.css"
      ];
      useQuickCss = true;
      transparent = false;
      frameless = true;
      plugins = {
        alwaysAnimate.enable = true;
        alwaysTrust.enable = true;
        betterSettings = {
          enable = true;
          disableFade = true;
          organizeMenu = true;
          eagerLoad = true;
        };
        biggerStreamPreview.enable = true;
        clearURLs.enable = true;
        colorSighted.enable = true;
        copyFileContents.enable = true;
        ctrlEnterSend.enable = true;
        decor.enable = true;
        fakeNitro = {
          enable = true;
          transformCompoundSentence = true;
        };
        forceOwnerCrown.enable = true;
        implicitRelationships.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLogger.enable = true;
        reverseImageSearch.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        userVoiceShow.enable = true;
        voiceChatDoubleClick.enable = true;
        viewRaw.enable = true;
        volumeBooster.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
