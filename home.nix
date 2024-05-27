{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "fauna";
    homeDirectory = "/home/fauna";
    stateVersion = "23.11"; # Please read the comment before changing.
    packages = [
      pkgs.alejandra
    ];
    file = {
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  imports = [
    ./user/bash.nix
    ./user/neovim.nix
    ./user/tmux.nix
    ./user/git.nix
  ];
  
   
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
