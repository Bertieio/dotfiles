{pkgs, lib, ...}:{
    wayland.windowManager.hyprland = {
        enable = true; 
        settings = {
        };
        extraConfig = ''
            bind=SUPER,SPACE,exec,rofi -show drun
            bind=SUPER,Q,exec,kitty
            bind=SUPER,M,exec,hyprctl dispatch exit
        '';
    };
}