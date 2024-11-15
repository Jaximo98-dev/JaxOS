{

	description = "This is JaxOS.";

	inputs = {

		nixpkgs.url = "nixpkgs/nixos-24.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";

	};

	outputs = { self, nixpkgs, home-manager, nur, nix-colors, ...}:
		let
      username = "jaximo";
      device = "desktop";

			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; };
		in {
      nixosConfigurations = {

				desktop = lib.nixosSystem {
					inherit system;
          specialArgs = { inherit username ; device = "desktop"; };

					modules = [
            ./system/configuration.nix
						./system/hardware/desktop.nix
            home-manager.nixosModules.home-manager
             {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = {
                  imports = [
                    nur.hmModules.nur
                    ./home/default-home.nix
                    ]; 
                };
                home-manager.extraSpecialArgs = { inherit username ; device = "desktop"; inherit nix-colors; };
                home-manager.backupFileExtension = "backup";
             }
          ];
				};

				laptop = lib.nixosSystem {
					inherit system;
          specialArgs = { inherit username ; device = "laptop"; };

					modules = [
            ./system/configuration.nix
						./system/hardware/laptop.nix
            home-manager.nixosModules.home-manager
             {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = {
                  imports = [
                    nur.hmModules.nur
                    ./home/default-home.nix
                    ]; 
                };
                home-manager.extraSpecialArgs = { inherit username ; device = "laptop"; inherit nix-colors; };
                home-manager.backupFileExtension = "backup";
             }
          ];
				};
        
			};
	};

}
