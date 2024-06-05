{pkgs, lib, ...}:{
    wayland.windowManager.hyprland = {
        enable = true; 
        settings = {
        };
        extraConfig = ''
            bind=SUPER,SPACE,rofi,-show drun
            bind=SUPER,Q,kitty
            bind=SUPER,M,hyprctl,dispatch exit
        '';
    };
}