{pkgs, lib, ...}:{
    programs.eww.enable = true;
    programs.eww.configDir = ../config/eww;
    services.dunst.enable = true;
}