.PHONY: update
update:
	sudo nixos-rebuild switch --flake .#JaxOS

.PHONY: clean
clean:
	nix-collect-garbage -d