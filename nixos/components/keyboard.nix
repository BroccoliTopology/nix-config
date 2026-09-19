# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ pkgs, ... }:

{
  i18n.inputMethod = {
    # Available since NixOS 24.11
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true; # Use settings below, ignore user config
      addons = with pkgs; [
        fcitx5-chewing # Chewing (Traditional Chinese)
        qt6Packages.fcitx5-chinese-addons
      ];
      settings.inputMethod = {
        "GroupOrder" = {
          "0" = "Default";
        };

        "Groups/0" = {
          "Name" = "Default";
          "Default Layout" = "us";
          "DefaultIM" = "keyboard-us";
        };

        "Groups/0/Items/0" = {
          "Name" = "keyboard-us";
        };

        "Groups/0/Items/1" = {
          "Name" = "chewing";
        };
      };
    };
  };
}
