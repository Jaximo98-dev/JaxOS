.PHONY: all desktop laptop clean

JAXOS_DIR := $(CURDIR)/JaxOS

all: desktop

desktop:
	@echo "Updating NixOS for desktop profile"
	export JAXOS=$(JAXOS_DIR) && sudo nixos-rebuild switch --flake .#desktop || { echo "Failed to update desktop profile"; exit 1; }

laptop:
	@echo "Updating NixOS for laptop profile"
	export JAXOS=$(JAXOS_DIR) && sudo nixos-rebuild switch --flake .#laptop || { echo "Failed to update laptop profile"; exit 1; }

clean:
	nix-collect-garbage -d
