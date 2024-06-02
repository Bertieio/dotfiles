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

    fileSystems."/Photos" = {
        device = "tank1/Photos";
        fsType = "zfs";
        options = ["zfutil"];
    };
    fileSystems."/GameServers" = {
        device = "tank1/GameServers";
        fsType = "zfs";
        options = ["zfutil"];
    };
    fileSystems."/Media" = {
        device = "tank1/Media";
        fsType = "zfs";
        options = ["zfutil"];
    };
    fileSystems."/Files" = {
        device = "tank1/Files";
        fsType = "zfs";
        options = ["zfutil"];
    };
 }
