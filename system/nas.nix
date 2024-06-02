# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
    boot.supportedFilesystems = [ "zfs" ];
    boot.zfs.forceImportRoot = false;
    networking.hostId = "d6f3d1cf";
    environment.systemPackages = with pkgs; [
        zfs
    ]; 
    boot.zfs.devNodes = "/dev/disk/by-path";
    boot.zfs.extraPools = [ "tank1" ];

    services.samba = {
        enable = true; 
        securityType = "user";
        openFirewall = true;
        extraConfig = ''
            workgroup = WORKGROUP
            security = user
            guest account = fauna
        '';
        shares = {
            Files = {
                path = "/tank1/Files";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "yes";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "fauna";
                "force group" = "bertieio";
            };
            Photos = {
                path = "/tank1/Photos";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "yes";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "fauna";
                "force group" = "bertieio";
            };
            GameServers = {
                path = "/tank1/GameServers";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "yes";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "fauna";
                "force group" = "bertieio";
            };
            Media = {
                path = "/tank1/Media";
                browseable = "yes";
                "read only" = "no";
                "guest ok" = "yes";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "fauna";
                "force group" = "bertieio";
            };
        };
    };
    services.samba-wsdd = {
        enable = true;
    };
}
