{pkgs, lib, ...}:{ environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    htop
    tmux
    git
    zenith
    iftop
    btop
    bottom
    vscode
    firefox
  ];
    nixpkgs.config.allowUnfree = true;
  }