{

description = "Flakey!";

inputs = {
   nixpkgs.url = "nixpkgs/nixos-23.11";
   nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
   home-manager.url = "github:nix-community/home-manager/release-23.11";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = {self, nixpkgs, nixpkgs-unstable, home-manager,...}:
  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "CerealKiller";
    };
    userSettings = {
      username = "fauna";
      name = "Bertie";
      email = "b@bertie.io";
      editor = "neovim";
    };
    lib = nixpkgs.lib; 
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${systemSettings.system}; 
  in
  {
   nixosConfigurations = {
    CerealKiller = lib.nixosSystem {
        system = systemSettings.system;
        modules = [./configuration.nix];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit pkgs-unstable; 
        };
      };
   };
   homeConfigurations = {
      fauna = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix];
      extraSpecialArgs = 
        {
          inherit pkgs-unstable;
          inherit userSettings;
        };
      };
    };
  };
}
