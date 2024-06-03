.PHONY: update
update:
	home-manager switch --flake .#JaxOS

.PHONY: clean
clean:
	nix-collect-garbage -d