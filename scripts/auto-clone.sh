#!/bin/bash

# Función para clonar o actualizar el repositorio
sync_repo() {
    REPO_URL=$1
    REPO_DIR=$2

    # Verifica si el directorio de destino existe, sino lo crea
    mkdir -p "$REPO_DIR"

    # Verifica si el repositorio ya existe
    if [ ! -d "$REPO_DIR/.git" ]; then
        echo "Cloning $REPO_URL into $REPO_DIR..."
        git clone "$REPO_URL" "$REPO_DIR"
    else
        echo "Repository $REPO_URL already exists. Updating..."
        cd "$REPO_DIR" || return 1
        
        # Actualiza el repositorio utilizando rebase para mantener los cambios locales
        git pull --rebase || echo "Conflicts detected in $REPO_DIR. Resolve manually."
    fi
}

# Clonación o actualización de repositorios
sync_repo "https://github.com/jaximo98-dev/Abyssmmo.git" "/home/jaximo/development/projects/abyssmmo"
sync_repo "https://github.com/jaximo98-dev/obsidian.git" "/home/jaximo/personal/vaults/obsidian"
sync_repo "https://github.com/jaximo98-dev/obsidian-estudios.git" "/home/jaximo/personal/vaults/obsidian-estudios"
