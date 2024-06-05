{
  config,
  pkgs,
  pkgs-unstable,
  userSettings,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = userSettings.username;
    homeDirectory = "/home/"+userSettings.username;
    stateVersion = "23.11"; # Please read the comment before changing.
    packages = [
      pkgs.alejandra
    ];
    file = {
    };
    sessionVariables = {
      EDITOR = userSettings.editor;
    };
  };
  imports = [
    ./user/bash.nix
    ./user/neovim.nix
    ./user/tmux.nix
    ./user/git.nix
    ./user/hyprland.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
