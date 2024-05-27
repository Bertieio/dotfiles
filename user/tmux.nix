{
  pkgs,
  pkgs-unstable,
  ...
}:
#let 
  #rose-pine = pkgs.tmuxPlugins.mkTmuxPlugin
  #  {
  #    pluginName = "rose-pine";
  #    version = "23.11";
  #    src = pkgs.fetchFromGitHub {
  #      owner = "rose-pine";
  #      repo = "tmux";
  #      rev = "23233037e48ea5f124b6186f8d232fda03326448";
  #      sha256 = "sha256-0ccJVQIIOpHdr3xMIBC1wbgsARCNpmN+xMYVO6eu/SI=";
  #    };
  #  };
  #in
  {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    plugins = [
      {
        plugin = pkgs-unstable.tmuxPlugins.rose-pine;
        extraConfig = "set -g @rose_pine_variant 'moon'";
      }
    ];
  };
} 
