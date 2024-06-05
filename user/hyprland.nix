{pkgs, lib, ...}:{
    wayland.windowManager.hyprland = {
        enable = true; 
        settings = {
        };
        extraConfig = ''
            bind=SUPER,SPACE,rofi,-show drun
        '';
    };
}