{pkgs, pkgs-unstable}:{
    programs.hyprland = {
        enable = true;
        xwayland.hidpi = true;
        xwayland.enable = true;
    };
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
    services.dbus.enable = true;
    xdg.portal = {
        enale = true;
        wlr.enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
        ];
    };
    environment.systemPackages = with pkgs; [
        hyprland
        swww
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
        xwayland
    ];
}