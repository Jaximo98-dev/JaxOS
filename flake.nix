{

	description = "NixOS + home-manager flake. All in one single place.";

	inputs = {

		nixpkgs.url = "nixpkgs/nixos-24.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { self, nixpkgs, home-manager, ...}:
		let
      username = "jaximo";

			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in {
      nixosConfigurations = {
				JaxOS = lib.nixosSystem {

					inherit system;
          specialArgs = { inherit username ; };


					modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
             {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = {
                  imports = [
                    ./home/default-home.nix
                    ]; 
                };
                home-manager.extraSpecialArgs = { inherit username ; };
             }
          ];
				};
			};
	};

}
