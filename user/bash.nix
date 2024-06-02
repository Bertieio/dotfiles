{pkgs, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hmsw = "home-manager switch --flake ~/.dotfiles/";
      hmed = "vim ~/.dotfiles/home.nix";

      nxsw = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      nxed = "vim ~/.dotfiles/configuration.nix";

      #fkrl = "nix flake update";
      fked = "vim ~/.dotfiles/flake.nix";

      cddot = "cd ~/.dotfiles";
      cdds = "cd ~/.dotfiles/system";
      cddu = "cd ~/.dotfiles/user";
           
      ".." = "cd ..";
      la = "ls -a";
    };
    bashrcExtra = ''
      export TERM=xterm-256color
      PS1='\[$(tput setaf 168)\]\u@\h \[$(tput setaf 214)\]\w \[$(tput setaf 159)\]|-> \[$(tput setaf 183)\]'
    '';
  };
}
