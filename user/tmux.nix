{
  pkgs,
  pkgs-unstable,
  ...
}:
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
