  
  # JaxOS
  This repository contains my full NixOS setup. Heavily inspired in the philosophy of reducing the amount of mental gimmicks to get to places and doing so with the most comfortable and joyful experience. I shall rice this shit to the brim, simplicity and function over form, but how would an artist paint without beauty around him.
  
  ## Installation
  1. Get an instance of NixOS ISO running, and install the whatever template.
  2. Secure internet connection and then git clone the repo, ./dotfiles preferably.
  3. Open terminal, run `nix-shell -p gnumake` and then move to repo directory.
  4. Run `make desktop` or `make laptop`

  ## Todo
  - [X] Add one generic profile, that does not use preset hardware configuration files.
  - [ ] Fingerprint for laptop
  - [ ] Secrets
  - [ ] Multi monitor fix
  - [ ] Rice using nix-style
  - [ ] Neovim configuration (paused until i )
  - [ ] Spotify configuration
  - [X] Obsidian configuration with sync
  - [ ] Eduroam for laptop...
  - [ ] Remove arrows as movement, change capslock.
  - [ ] Safe check if the files are on $HOME/JaxOS


  ## Cambios principales
  - [ ] Generar la estructura de carpetas en el inicio. (Posible idea: generar declarativamente aliases a dichas carpetas, o usar telescope/harpoon)
  - [ ] Script para que revisando que estoy logged a github, con git descarge los repo a sus respectivas carpetas.
  - [ ] Detectar y configurar cualquier pantalla enchufada antes o durante el uso.
  - [ ] Popular cada pantalla con su polybar. (Posible idea: cambiar color de acento)
  - [ ] Establecer reglas para i3 en un entorno multi-monitor. Asignando en monitor 1,2,3 las propiedades de principal, secundario, terciario.
  - [X] Cambiar el greeter de lighdm, a mini y cambiar fondo de pantalla. (Posible idea: estudiar el auth manager para poder usar fingerprint)
  - [ ] Configurar los keybinginds de i3, wezterm, firefox y vscode para amueblarse a vim (Posible idea: propagar configuración a nvim)
  - [ ] Configurar los secretos, en concreto clave de SSH para wezterm y clave de github.

## Cambios seguridad
  - [ ] Asegurar dirección de los .dotfiles en /home/JaxOS, y en los comandos que usan direcciones absolutas cambiarlas a relativas.
  - [ ] 


  xrandr --output DP-3 --mode 2560x1440 --rate 144
---
considerations:
dunst
brillo
nom
udiskie
