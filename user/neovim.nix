{config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      statix
      rose-pine
    ];
    extraConfig = "
      set autoindent
      set tabstop=2
      set shiftwidth=2
      set expandtab
      colorscheme rose-pine-moon
    ";
  };
}
