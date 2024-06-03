{

description = "Flakey!";

inputs = {
   nixpkgs.url = "nixpkgs/nixos-24.05";
   nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
   home-manager.url = "github:nix-community/home-manager/release-24.05";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = {self, nixpkgs, nixpkgs-unstable, home-manager,...}:
  let
    system = "x86_64-linux";
  
    userSettings = {
      username = "fauna";
      name = "Bertie";
      email = "b@bertie.io";
      editor = "neovim";
    };
    lib = nixpkgs.lib; 
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system}; 
  in
  {
   nixosConfigurations = {
    LAB-NIX-NAS-01 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./hosts/LAB-NIX-NAS-01.nix];
        specialArgs = {
          inherit userSettings;
          inherit pkgs-unstable; 
        };
      };
      CerealKiller = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./hosts/CerealKiller.nix];
        specialArgs = {
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
