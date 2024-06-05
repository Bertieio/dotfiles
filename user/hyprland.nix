{pkgs, lib, ...}:{
    wayland.windowManager.hyprland = {
        enable = true; 
        settings = {
            bind=SUPER,SPACE, rofi -show drun
        };
    }
}